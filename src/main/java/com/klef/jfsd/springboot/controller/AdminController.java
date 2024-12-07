package com.klef.jfsd.springboot.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.*;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.FacultyReject;
import com.klef.jfsd.springboot.model.FacultyRequest;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentReject;
import com.klef.jfsd.springboot.model.StudentRequest;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FacultyService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private FacultyService facultyService;
    
    @Autowired
    private StudentService studentService;
    
    @Autowired
   	private JavaMailSender jms;
    
    @Value("${spring.mail.username}")
	private String fromEmail;
    
//ADMIN
    @GetMapping("adminhome") 
    public ModelAndView adminHome() { 
        ModelAndView mv = new ModelAndView(); 
        mv.setViewName("adminhome"); 
        long facultyCount = adminService.facultyCount();
        long studentCount = adminService.studentCount();
        long courseCount = adminService.coursesCount();
        mv.addObject("facultyCount", facultyCount);
        mv.addObject("studentCount", studentCount);
        mv.addObject("courseCount", courseCount);
        return mv; 
    }

    @PostMapping("checkadminlogin") 
    @ResponseBody 
    public ModelAndView checkAdminLogin(HttpServletRequest request) { 
        String adminId = request.getParameter("id"); 
        String adminPassword = request.getParameter("password"); 
        
        int id = Integer.parseInt(adminId);
        Admin admin = adminService.findByIdAndPassword(id, adminPassword); 
        ModelAndView mv = new ModelAndView();
        
        HttpSession session = request.getSession();
        session.setAttribute("admin", admin);
        
        if (admin != null) { 
            mv.setViewName("adminhome");
            long facultyCount = adminService.facultyCount();
            long studentCount = adminService.studentCount();
            long courseCount = adminService.coursesCount();
            mv.addObject("facultyCount", facultyCount);
            mv.addObject("studentCount", studentCount);
            mv.addObject("courseCount", courseCount);
            return mv; 
        } else { 
            mv.setViewName("loginfailed");
            return mv; 
        } 
    }
    
    @GetMapping("adminprofile")
    public String adminProfile(HttpSession session, Model model) {
    	Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/adminsessionexpiry.jsp";
        }
        model.addAttribute("admin", admin);
        return "adminprofile";
    }

    @GetMapping("admineditprofile")
    public String showEditProfilePage(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/adminsessionexpiry.jsp";
        }
        model.addAttribute("admin", admin);
        return "admineditprofile";
    }

    @PostMapping("updateadminprofile")
    public String updateAdminProfile(
            @ModelAttribute("admin") Admin admin,
            @RequestParam("id") int id,
            HttpSession session) {

        Admin existingAdmin = adminService.getAdminById(id);
        if (existingAdmin == null) {
            return "redirect:/adminsessionexpiry.jsp";
        }

        existingAdmin.setName(admin.getName());
        existingAdmin.setGender(admin.getGender());
        existingAdmin.setEmail(admin.getEmail());
        existingAdmin.setContact(admin.getContact());
        existingAdmin.setPassword(admin.getPassword());

        adminService.updateAdmin(existingAdmin);
        session.setAttribute("admin", existingAdmin);

        return "redirect:/adminprofile";
    }

    
    
    
//COURSE
    
    @GetMapping("admincourses")
    public ModelAndView adminCourses() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admincourses");
        List<Course> courselist = adminService.viewAllCourses();
        mv.addObject("courselist", courselist);
        return mv;
    }
    
    @GetMapping("admineditcourse")
    public ModelAndView admineditcourse(@RequestParam String id) {
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("admineditcourse");
    	Course c = adminService.getCourseById(id);
    	mv.addObject("course", c);
    	return mv;
    }
    
    @PostMapping("updateCourse")
    public ModelAndView updateCourse(@RequestParam String id,HttpServletRequest request) {
    	String name = request.getParameter("cname");
    	int credit = Integer.parseInt(request.getParameter("ccredit"));
    	String year = request.getParameter("cyear");
    	String dept = request.getParameter("cdept");
    	Course c = new Course();
    	c.setId(id);
    	c.setName(name);
    	c.setCredits(credit);
    	c.setYear(year);
    	c.setDepartment(dept);
    	String message = adminService.updateCourse(c);
    	ModelAndView mv = new ModelAndView("admincourses");
    	mv.addObject("msg",message);
    	List<Course> courselist = adminService.viewAllCourses();
    	mv.addObject("courselist", courselist);
    	return mv;
    }
    
    @GetMapping("adminaddcourse")
    public ModelAndView adminAddCourse() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminaddcourse");
        return mv;
    }
    
    @PostMapping("addCourse")
    public ModelAndView addCourse(HttpServletRequest request) {
    	String id = request.getParameter("cid");
    	String name = request.getParameter("cname");
    	int credit = Integer.parseInt(request.getParameter("ccredit"));
    	String year = request.getParameter("cyear");
    	String dept = request.getParameter("cdept");
    	Course c = new Course();
    	c.setId(id);
    	c.setName(name);
    	c.setCredits(credit);
    	c.setYear(year);
    	c.setDepartment(dept);
    	c.setStatus(true);
    	adminService.addCourse(c);
    	ModelAndView mv = new ModelAndView("admincourses");
    	List<Course> courselist = adminService.viewAllCourses();
    	mv.addObject("courselist", courselist);
    	return mv;
    }
    
//COMPLAINT

    @GetMapping("admincomplaintlog")
    public ModelAndView adminComplaintLog() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admincomplaintlog");
        return mv;
    }
    
    
//FACULTY

    @GetMapping("adminfaculty")
    public ModelAndView adminFaculty() {
        List<Faculty> facultylist = adminService.viewAllFaculty();
        ModelAndView mv = new ModelAndView();
        mv.addObject("faculty", facultylist);
        mv.setViewName("adminfaculty");
        return mv;
    }
    
    @GetMapping("adminfacultyrequest")
    public ModelAndView adminFacultyRequest() {
        List<FacultyRequest> facultyrequestlist = adminService.viewAllFacultyRequests();
        ModelAndView mv = new ModelAndView();
        mv.addObject("facultyrequestlist", facultyrequestlist);
        mv.setViewName("adminfacultyrequest");
        return mv;
    }

    @GetMapping("adminfacultyreject")
    public ModelAndView adminFacultyReject() {
        List<FacultyReject> facultyrejectlist = adminService.viewAllFacultyRejects();
        ModelAndView mv = new ModelAndView();
        mv.addObject("facultyreject", facultyrejectlist);
        mv.setViewName("adminfacultyreject");
        return mv;
    }

    @PostMapping("adminEditFaculty")
    public String editFacultyForm(@RequestParam("id") int id, Model model) {
        Faculty faculty = facultyService.getFacultyById(id);
        model.addAttribute("faculty", faculty);
        return "adminfacultyedit"; // JSP page
    }

    @PostMapping("editfaculty")
    public String updateFaculty(@ModelAttribute Faculty faculty) {
        facultyService.updateFaculty(faculty);
        return "redirect:/adminfaculty"; // Redirect to faculty list
    }
    
    @PostMapping("acceptFacultyRequest")
    public ModelAndView acceptFacultyRequest(@RequestParam("id") int id) {
        String msg = adminService.acceptFaculty(id);
        sendFacultyAccepted(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/adminfaculty");
        mv.addObject("msg",msg);
        return mv;
    }

    public void sendFacultyAccepted(int id) {
        SimpleMailMessage sm = new SimpleMailMessage();
        Faculty f = adminService.findFacultyById(id);
        sm.setTo(f.getEmail());
        
        String subject = "Welcome to FeedCraft - Your Registration has been Approved!";
        sm.setSubject(subject);
        
        String body = "Dear " + f.getName() + ",\n\n" +
                      "We are pleased to inform you that your registration on FeedCraft has been successfully approved by the admin. Welcome aboard!\n\n" +
                      "Here are your login details:\n" +
                      "Faculty ID: " + f.getId() + "\n" +
                      "Password: " + f.getPassword() + "\n\n" +
                      "You can now log in and start exploring the platform. If you have any questions or need assistance, feel free to reach out to us at " + fromEmail + ".\n\n" +
                      "Thank you for being a part of FeedCraft. We look forward to your contributions!\n\n" +
                      "Best regards,\n" +
                      "The FeedCraft Team\n";
        
        sm.setText(body);
        jms.send(sm);
        System.out.println("Faculty Accepted Mail Sent");
    }

    @PostMapping("rejectFacultyRequest")
    public ModelAndView rejectFaculty(@RequestParam("id") int id) {
        String msg = adminService.rejectFaculty(id);
        sendFacultyRejected(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/adminfaculty");
        mv.addObject("msg",msg);
        return mv; 
    }
    
    public void sendFacultyRejected(int id) {
        SimpleMailMessage sm = new SimpleMailMessage();
        FacultyReject f = adminService.findRFacultyById(id); 		
        sm.setTo(f.getEmail());
        
        String subject = "FeedCraft Registration Status - Rejected";
        sm.setSubject(subject);
        
        String body = "Dear " + f.getName() + ",\n\n" +
                      "We regret to inform you that your registration on FeedCraft has been rejected by the admin.\n\n" +
                      "Unfortunately, we are unable to proceed with your request at this time. If you believe there has been a misunderstanding or if you have any questions, feel free to reach out to us at " + fromEmail + ".\n\n" +
                      "Thank you for your interest in FeedCraft, and we wish you all the best.\n\n" +
                      "Best regards,\n" +
                      "The FeedCraft Team\n";
        
        sm.setText(body);
        jms.send(sm);
        System.out.println("Faculty Rejected Mail Sent");
    }

    
    @PostMapping("deleteFaculty")
    public ModelAndView deleteFaculty(@RequestParam("id") int id) {
    	String msg=adminService.deleteFaculty(id);
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redirect:/adminfaculty");
        mv.addObject("msg",msg);
    	return mv;
    }
    
    @PostMapping("restorefaculty")
    public ModelAndView restoreFaculty(@RequestParam("id") int id) {
        String msg = adminService.restoreFaculty(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/adminfaculty");
        mv.addObject("msg", msg);
        return mv;
    }
    
//STUDENT
    @PostMapping("acceptStudentRequest")
    public ModelAndView acceptStudentRequest(@RequestParam("id") int id) {
        String msg = adminService.acceptStudent(id);
        sendStudentAccepted(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/adminstudent");
        mv.addObject("msg", msg);
        return mv;
    }

    public void sendStudentAccepted(int id) {
        SimpleMailMessage sm = new SimpleMailMessage();
        Student s = adminService.findStudentById(id);
        sm.setTo(s.getEmail());
        
        String subject = "Welcome to FeedCraft - Your Registration has been Approved!";
        sm.setSubject(subject);
        
        String body = "Dear " + s.getName() + ",\n\n" +
                      "We are pleased to inform you that your registration on FeedCraft has been successfully approved by the admin. Welcome to the platform!\n\n" +
                      "Here are your login details:\n" +
                      "Student ID: " + s.getId() + "\n" +
                      "Password: " + s.getPassword() + "\n\n" +
                      "You can now log in and start exploring. If you have any questions or need assistance, feel free to reach out to us at " + fromEmail + ".\n\n" +
                      "Thank you for joining FeedCraft. We look forward to your participation!\n\n" +
                      "Best regards,\n" +
                      "The FeedCraft Team\n";
        
        sm.setText(body);
        jms.send(sm);
        System.out.println("Student Accepted Mail Sent");
    }

    
    @PostMapping("rejectStudentRequest")
    public ModelAndView rejectStudent(@RequestParam("id") int id) {
        String msg = adminService.rejectStudent(id);
        sendStudentRejected(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/adminstudent");
        mv.addObject("msg", msg);
        return mv;
    }
    
    public void sendStudentRejected(int id) {
        SimpleMailMessage sm = new SimpleMailMessage();
        StudentReject s = adminService.findRStudentReject(id);
        sm.setTo(s.getEmail());
        
        String subject = "FeedCraft Registration Status - Rejected";
        sm.setSubject(subject);
        
        String body = "Dear " + s.getName() + ",\n\n" +
                      "We regret to inform you that your registration on FeedCraft has been rejected by the admin.\n\n" +
                      "Unfortunately, we are unable to proceed with your request at this time. If you believe there has been a misunderstanding or if you have any questions, feel free to reach out to us at " + fromEmail + ".\n\n" +
                      "Thank you for your interest in FeedCraft, and we wish you all the best.\n\n" +
                      "Best regards,\n" +
                      "The FeedCraft Team\n";
        
        sm.setText(body);
        jms.send(sm);
        System.out.println("Student Rejected Mail Sent");
    }


    @PostMapping("deleteStudent")
    public ModelAndView deleteStudent(@RequestParam("id") int id) {
        String msg = adminService.deleteStudent(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/adminstudent");
        mv.addObject("msg", msg);
        return mv;
    }

    @PostMapping("restoreStudent")
    public ModelAndView restoreStudent(@RequestParam("id") int id) {
        String msg = adminService.restoreStudent(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/adminstudent");
        mv.addObject("msg", msg);
        return mv;
    }

    @PostMapping("/adminEditStudent")
    public String editStudentForm(@RequestParam("id") int id, Model model) {
        Student student = studentService.getStudentById(id);
        model.addAttribute("student", student);
        return "adminstudentedit"; // JSP page
    }

    @PostMapping("/editstudent")
    public String updateStudent(@ModelAttribute Student student) {
        studentService.updateStudent(student);
        return "redirect:/adminstudent"; // Redirect to student list
    }

    @GetMapping("adminstudent")
    public ModelAndView adminStudent() {
        List<Student> studentList = adminService.viewAllStudents();
        ModelAndView mv = new ModelAndView();
        mv.addObject("students", studentList);
        mv.setViewName("adminstudent");
        return mv;
    }

    @GetMapping("adminstudentrequest")
    public ModelAndView adminStudentRequest() {
        List<StudentRequest> studentRequestList = adminService.viewAllStudentRequests();
        ModelAndView mv = new ModelAndView();
        mv.addObject("studentrequestlist", studentRequestList);
        return mv;
    }

    @GetMapping("adminstudentreject")
    public ModelAndView adminStudentReject() {
        List<StudentReject> studentRejectList = adminService.viewAllStudentRejects();
        ModelAndView mv = new ModelAndView();
        mv.addObject("studentreject", studentRejectList);
        mv.setViewName("adminstudentreject");
        return mv;
    }
    
    @GetMapping("adminpostfeedback")
    public ModelAndView adminpostfeedback() {
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("adminpostfeedback");
    	return mv;
    }
}

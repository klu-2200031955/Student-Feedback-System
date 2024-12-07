package com.klef.jfsd.springboot.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Year;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentRequest;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    
    @Autowired
	private JavaMailSender jms;
	
	@Value("${spring.mail.username}")
	private String fromEmail;
    
    @GetMapping("studentregistration")
    public ModelAndView studentRegistration() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentregistration");
        return mv;
    }

    @PostMapping("studentrequest")
    public ModelAndView studentRequest(HttpServletRequest request) {
        int currentYear = (Year.now().getValue()) % 100;
        int randomNumber = (int) (Math.random() * 999) + 1;
        String randomid = currentYear + String.format("%03d", randomNumber);
        int id = 0;

        try {
            id = Integer.parseInt(randomid);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
            ModelAndView errorView = new ModelAndView("error");
            errorView.addObject("message", "Error generating ID.");
            return errorView;
        }

        String name = request.getParameter("fullname");
        String sdob = request.getParameter("dob");
        String dob = "";
        try {
            // Adjust input format to match the expected input from the HTML form
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            inputFormat.setLenient(false);
            java.util.Date parsedDate = inputFormat.parse(sdob);

            // Format to desired output format
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            dob = outputFormat.format(parsedDate);
        } catch (ParseException e) {
            e.printStackTrace();
            ModelAndView errorView = new ModelAndView("error");
            errorView.addObject("message", "Invalid date format. Please use yyyy-MM-dd.");
            return errorView;
        }


        String gender = request.getParameter("gender");
        String department = request.getParameter("department");
        String email = request.getParameter("email");
        String phno = request.getParameter("phnumber");
        String fathername = "";
        BigDecimal fee = BigDecimal.ZERO;
        String address = "";
        String linkedin = "";
        String facebook = "";
        String password = "std" + sdob;

        StudentRequest srq = new StudentRequest();
        srq.setId(id);
        srq.setName(name);
        srq.setDob(sdob);
        srq.setGender(gender);
        srq.setDepartment(department);
        srq.setEmail(email);
        srq.setContact(phno);
        srq.setFathername(fathername);
        srq.setFee(fee);
        srq.setAddress(address);
        srq.setLinkedin(linkedin);
        srq.setFacebook(facebook);
        srq.setPassword(password);

        String msg = studentService.studentRequest(srq).toString();
        sendStudentRegMail(srq);
        ModelAndView mv = new ModelAndView();
        mv.addObject("message", msg);
        mv.setViewName("home");
        return mv;
    }
    
    public void sendStudentRegMail(StudentRequest srq) {
        SimpleMailMessage sm = new SimpleMailMessage();
        sm.setFrom(fromEmail);
        sm.setTo(srq.getEmail());
        String subject = "Welcome to FeedCraft - Registration Confirmation";
        sm.setSubject(subject);
        String body = "Dear " + srq.getName() + ",\n\n" +
                "We are excited to welcome you to FeedCraft! Your registration has been successfully completed.\n\n" +
                "As a student, your account is currently under review. You will receive a follow-up email with your unique ID and password upon admin approval.\n\n" +
                "Feel free to reach out to us at " + fromEmail + " if you have any questions or require support.\n\n" +
                "Thank you for joining FeedCraft, and we hope you have a great experience!\n\n" +
                "Best regards,\n" +
                "The FeedCraft Team\n";
        sm.setText(body);
        jms.send(sm);
        System.out.println("Email Sent to the Student");
    }
    
//    @PostMapping("checkstudentlogin")
//    @ResponseBody
//    public ModelAndView checkstudentlogin(HttpServletRequest request) {
//    	String studentId = request.getParameter("id");
//    	String studentPassword = request.getParameter("password");
//    	int id = Integer.parseInt(studentId);
//    	Student student = studentService.findIdandPassword(id, studentPassword);
//    	ModelAndView mv = new ModelAndView();
//    	HttpSession session = request.getSession();
//    	session.setAttribute("student",student);
//    	if(student!=null) {
//    		mv.setViewName("studenthome");
//    		return mv;
//    	}else {
//    		mv.setViewName("loginfailed");
//    		return mv;
//    	}
//    }
    
    @GetMapping("studentcurrentresponses")
    public ModelAndView studentcurrentresponses() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentcurrentresponses");
        return mv;
    }
    
    @GetMapping("studenteditprofile")
    public ModelAndView studenteditprofile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studenteditprofile");
        return mv;
    }
    
    @GetMapping("studentprofile")
    public ModelAndView studentprofile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentprofile");
        return mv;
    }
    
    @GetMapping("studenthome")
    public ModelAndView studenthome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studenthome");
        return mv;
    }
    
    @GetMapping("studenthelp")
    public ModelAndView studenthelp() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studenthelp");
        return mv;
    }
    
    @GetMapping("studenthistory")
    public ModelAndView studenthistory() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studenthistory");
        return mv;
    }
    
    
}

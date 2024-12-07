package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FacultyService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private StudentService studentService;
	
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }

    @GetMapping("logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        session.removeAttribute("faculty");
        session.removeAttribute("student");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }
    
    @PostMapping("checklogin")
    @ResponseBody
    public ModelAndView checkLogin(HttpServletRequest request) {
    	String uid = request.getParameter("id");
    	String password = request.getParameter("password");
    	int id = Integer.parseInt(uid);
    	Admin admin = adminService.findByIdAndPassword(id, password);
    	Faculty faculty = facultyService.findIdandPassword(id, password);
    	Student student = studentService.findIdandPassword(id, password);
    	HttpSession session = request.getSession();
    	ModelAndView mv = new ModelAndView();
    	if(admin!=null) {
    		session.setAttribute("admin", admin);
    		mv.setViewName("adminhome");
            long facultyCount = adminService.facultyCount();
            long studentCount = adminService.studentCount();
            long courseCount = adminService.coursesCount();
            mv.addObject("facultyCount", facultyCount);
            mv.addObject("studentCount", studentCount);
            mv.addObject("courseCount", courseCount);
    	}else if(faculty!=null) {
    		session.setAttribute("faculty", faculty);
    		mv.setViewName("facultyhome");
    	}else if(student!=null) {
    		session.setAttribute("student", student);
    		mv.setViewName("studenthome");
    	}else {
    		mv.setViewName("loginfailed");
    	}
    	return mv;
    }
}

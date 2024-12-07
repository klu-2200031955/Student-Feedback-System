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
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.FacultyRequest;
import com.klef.jfsd.springboot.service.FacultyService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FacultyController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
	private JavaMailSender jms;
	
	@Value("${spring.mail.username}")
	private String fromEmail;
    
    @GetMapping("facultyregistration")
    public ModelAndView facultyRegistration() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("facultyregistration");
        return mv;
    }

    @PostMapping("facultyrequest")
    public ModelAndView facultyRequest(HttpServletRequest request) {
        int currentYear = (Year.now().getValue()) % 100;
        int randomNumber = (int)(Math.random() * 999) + 1;
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
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); // Matches HTML date input format
            inputFormat.setLenient(false);
            java.util.Date parsedDate = inputFormat.parse(sdob);
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            dob = outputFormat.format(parsedDate);
        } catch (ParseException e) {
            e.printStackTrace();
            ModelAndView errorView = new ModelAndView("facultyregistration");
            errorView.addObject("message", "Invalid date format. Please select a valid date.");
            return errorView;
        }

        // Remaining fields
        String gender = request.getParameter("gender");
        String department = request.getParameter("department");
        String email = request.getParameter("email");
        String phno = request.getParameter("phnumber");
        String fathername = "";
        BigDecimal salary = BigDecimal.ZERO;
        String address = "";
        String linkedin = "";
        String facebook = "";
        String password = "sfb" + dob.replace("-", ""); // Example password generation

        FacultyRequest frq = new FacultyRequest();
        frq.setId(id); 
        frq.setName(name);
        frq.setDob(dob); 
        frq.setGender(gender);
        frq.setDepartment(department);
        frq.setEmail(email);
        frq.setContact(phno);
        frq.setFathername(fathername);
        frq.setSalary(salary);
        frq.setAddress(address);
        frq.setLinkedin(linkedin);
        frq.setFacebook(facebook);
        frq.setPassword(password);

        String msg = facultyService.facultyrequest(frq).toString();
        sendFacultyRegMail(frq);

        ModelAndView mv = new ModelAndView();
        mv.addObject("message", msg);
        mv.setViewName("home");
        return mv;
    }


    public void sendFacultyRegMail(FacultyRequest frq) {
        SimpleMailMessage sm = new SimpleMailMessage();
        sm.setFrom(fromEmail);
        sm.setTo(frq.getEmail());
        String subject = "Welcome to FeedCraft - Registration Confirmation";
        sm.setSubject(subject);
        String body = "Dear " + frq.getName() + ",\n\n" +
                "We are pleased to inform you that your registration on FeedCraft has been successfully completed. Welcome to our platform!\n\n" +
                "As a faculty member, your account is pending approval from the admin. You will receive a follow-up email with your unique ID and password once your request is accepted.\n\n" +
                "If you have any questions or need assistance, feel free to reach out to us at " + fromEmail + ".\n\n" +
                "Thank you for joining us, and we look forward to your contributions to FeedCraft!\n\n" +
                "Best regards,\n" +
                "The FeedCraft Team\n";
        sm.setText(body);
        jms.send(sm);
        System.out.println("Email Sent to the Faculty");
    }

 }
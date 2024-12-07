<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Feedback System</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
  <link rel="icon" href="./images/LOGO img.png" type="image/png">
  <link rel="stylesheet" href="./css/preload.css"/>
  <script defer src="./preload.js"></script>
  <link rel="stylesheet" href="./css/navbar.css"/>
  <link rel="stylesheet" href="./css/register.css"/>
</head>
<body id="top">

  <div id="preload" class="preload" data-preaload>
    <div class="circle"></div>
    <p class="text">Loading...</p>  
  </div>
  <div class="header" id="header">
    <a href="#home"><img alt="Logo" height="40" src="./images/LOGO.png"/></a>
    <nav>
      <a href="/">Home</a>
      <a href="#contactus">Contact us</a>
    </nav>
    <a class="login-btn" href="/#login">Login</a>
  </div>
  <main>
  <div class="register-container">
    <div class="registration-form">
     <h2>
      Student Registration
     </h2>
      <form action="/studentrequest" method="post">
	     <input placeholder="Enter FullName" id="fullname" name="fullname" type="text"/>
     <input placeholder="Enter DOB (dd/MM/yyyy)" id="dob" name="dob" type="text"/>
     <select name="gender" id="gender" required>
     	<option value="">Select Gender</option>
		<option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
		<option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
		<option value="Other" ${student.gender == 'Other' ? 'selected' : ''}>Other</option>
	 </select>
     <input placeholder="Enter Email" id="email" name="email" type="email"/>
     <input placeholder="Enter Department" id="department" name="department" type="text"/>
     <input placeholder="Enter Phone Number" id="phnumber" name="phnumber" type="text"/>
     <button class="submit-btn">Register</button>
	 &nbsp;&nbsp;Already acc, exist?&nbsp;<a class="login-link" href="/#login">Login</a>
     </form>
    </div>
    <div class="terms">
     <h2>
      Terms and Condition
     </h2>
     <p>By registering for the Student Feedback System, you agree to the following terms and conditions:</p>
     <p>Inaccurate or false information may lead to account suspension or termination. You are responsible for maintaining the \
        confidentiality of your password and account information, and any unauthorized use must be reported immediately.</p>
     <p>The system is intended for academic purposes, and misuse can result in account suspension or legal action. Only eligible students,
         as determined by the admin, are allowed to participate, and users are expected to provide honest and constructive feedback. Your 
         personal data is securely stored and will not be shared without consent, except as required by law.</p>
     <p>We reserve the right to modify these terms at any time, and your continued use of the system signifies acceptance of the changes. 
        Passwords must meet the strength requirements, and if forgotten, you can reset them through your registered email.</p>
    </div>
   </div>
    <div class="contact-container" id="contactus">
      <div class="contact-info">
        <h1 style="font-size: xxx-large;">Contact Us!</h1>
        <p>If you need assistance with using the Student Feedback System or have any inquiries, please contact us through the following channels:</p>
        <p><strong>General Support, Technical Support, Admin Queries:</strong></p>
        <p><strong>Email:</strong> admin@empowerfeedbackhub.com</p>
        <p><strong>Phone:</strong> +1-800-123-4567</p>
      </div>
      <div class="contact-form">
        <form action="#" method="post">
          <div class="input-group">
            <input type="text" id="subject" name="subject" placeholder="Enter subject">
          </div>
          <div class="input-group">
            <textarea id="message" name="message" style="color: white;" placeholder="Enter your message"></textarea>
          </div>
          <div class="input-group">
            <input type="submit" value="Submit">
          </div>
        </form>
      </div>
    </div>
    
  <footer>
    <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
  </main>
</body>
</html>

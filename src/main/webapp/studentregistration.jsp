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

  <header class="header" id="header">
    <a href="#home"><img alt="Logo" height="40" src="./images/LOGO.png"/></a>
    <nav>
      <a href="/">Home</a>
      <a href="#contactus">Contact us</a>
    </nav>
    <a class="login-btn" href="/#login">Login</a>
  </header>

  <main>
    <div class="register-container">
      <div class="registration-form">
        <h2>Student Registration</h2>
        <form action="/studentrequest" method="post">
          <!-- Full Name -->
          <div class="input-box">
            <input 
              type="text" 
              id="fullname" 
              name="fullname" 
              pattern="[A-Za-z\s]+" 
              required
              title="Full Name should contain only alphabets and spaces">
            <label>Full Name</label>
          </div>
          <!-- Date of Birth -->
          <div class="input-box">
            <input 
              id="dob" 
              name="dob" 
              type="date" 
              max="2010-12-31" 
              title="Minimum Age required is 14"
              required 
            />
            <label>Date of Birth</label>
          </div>
          <!-- Gender -->
          <div class="input-box">
            <select id="gender" name="gender" required>
              <option value="" disabled selected></option>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
              <option value="Other">Other</option>
            </select>
            <label>Gender</label>
          </div>
          <!-- Email -->
          <div class="input-box">
            <input 
              type="email" 
              id="email" 
              name="email" 
              required
              title="Enter a valid email address">
            <label>Email</label>
          </div>
          <!-- Department -->
          <div class="input-box">
            <select id="department" name="department" required>
              <option value="" disabled selected></option>
              <option value="CSE">CSE</option>
              <option value="ECE">ECE</option>
              <option value="EEE">EEE</option>
              <option value="Mech">Mech</option>
              <option value="Civil">Civil</option>
            </select>
            <label>Department</label>
          </div>
          <!-- Phone Number -->
          <div class="input-box">
            <input 
              type="text" 
              id="phnumber" 
              name="phnumber" 
              pattern="[6789][0-9]{9}" 
              maxlength="10" 
              required
              title="Phone Number should be 10 digits">
            <label>Phone Number</label>
          </div>
          <!-- Submit Button -->
          <button class="submit-btn">Register</button>
          <p>Already have an account? <a class="login-link" href="/#login">Login</a></p>
        </form>
      </div>
      <div class="terms">
        <h2>Terms and Condition</h2>
        <p>By registering for the Student Feedback System, you agree to the following terms and conditions:</p>
        <ul>
          <li>Inaccurate or false information may lead to account suspension or termination.</li>
          <li>You are responsible for maintaining the confidentiality of your password and account information.</li>
          <li>The system is intended for academic purposes, and misuse can result in account suspension or legal action.</li>
          <li>Your personal data is securely stored and will not be shared without consent, except as required by law.</li>
          <li>We reserve the right to modify these terms at any time, and your continued use of the system signifies acceptance of the changes.</li>
        </ul>
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
            <textarea id="message" name="message" placeholder="Enter your message"></textarea>
          </div>
          <div class="input-group">
            <input type="submit" value="Submit">
          </div>
        </form>
      </div>
    </div>
  </main>

  <footer>
    <p>Copyright © K-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
</body>
</html>

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
  <!-- Alert for Login Failed -->
	<script>
	    // Check if the server has sent an error message
	    const errorMessage = "${error}";
	    if (errorMessage) {
	        alert(errorMessage);
	    }
	</script>
  <link rel="stylesheet" href="./css/navbar.css"/>
  <link rel="stylesheet" href="./css/home.css"/>
</head>
<body id="top">
  <div id="preload" class="preload" data-preaload>
    <div class="circle"></div>
    <p class="text">Loading...</p>  
  </div>
  <div class="header" id="header">
    <a href="#home"><img alt="Logo" height="40" src="./images/LOGO.png"/></a>
    <nav>
      <a href="#home">Home</a>
      <a href="#aboutpage">About</a>
      <a href="#contactus">Contact us</a>
    </nav>
    <a class="login-btn" href="#login">Login</a>
  </div>
  <main>
    <div class="main-banner" id="home">
      <h1>Student Feedback System</h1>
      <p>Dive into a system where feedback shapes your educational journey.</p>
      <p>Join us in enhancing your classes with insights that matter!</p>
    </div>
    <div class="content" id="login">
      <div class="register">
        <div style="margin: 100px;">
          <p style="font-size: 20px;">Sign up for an account to start giving feedback and improve your courses. It's quick and easy!</p>
          <br><a href="studentregistration"><button style="font-size: 20px; margin-bottom: 20px;">Student Register Here!</button></a>
          <br><a href="facultyregistration"><button style="font-size: 20px;">Faculty Register Here!</button></a>
        </div>
      </div>
      <div style="border-left: solid #e3e0e0; border-radius: 90%;"></div>
      <div class="login">
        <div class="login-container">
          <h2>Login Here</h2>
          	<form method="post" action="checklogin">
			    <div class="form-group">
			        <input type="number" id="id" name="id" placeholder="Enter Number" required>
			    </div>
			    <div class="form-group">
			        <input type="password" id="password" name="password" placeholder="Enter Password" required>
			    </div>
			    <button type="submit">Login</button>
			</form>
        </div>
      </div>
    </div>
    
    <div class="about" id="aboutpage">
      <h2>About Us</h2>
      <div class="features">
        <div class="feature">
          <h3>Your Voice Matters!</h3>
          <p>Every feedback form allows you to influence your learning environment. Help us make it better for all students!</p>
        </div>
        <div class="feature">
          <h3>Meet Your Faculty!</h3>
          <p>Get to know your teachers through their profiles. Discover their courses, achievements, and how they can support your success.</p>
        </div>
        <div class="feature">
          <h3>Join Our Community!</h3>
          <p>Connect with fellow students, share experiences, and collaborate on projects. Together, we thrive!</p>
        </div>
      </div>
    </div>
    <div class="contact-container" id="contactus">
      <div class="contact-info">
        <h1 style="font-size: xxx-large;">Contact Us!</h1>
        <p>If you need assistance with using the Student Feedback System or have any inquiries, please contact us through the following channels:</p>
        <p><strong>General Support, Technical Support, Admin Queries:</strong></p>
        <p><strong>Email:</strong> feedcraft.jfsd@gmail.com</p>
        <p><strong>Phone:</strong> +1-800-123-4567</p>
      </div>
      <div class="contact-form">
        <form action="#" method="post">
        <div class="input-group">
            <input type="email" id="email" name="email" placeholder="Enter Email">
        </div>
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

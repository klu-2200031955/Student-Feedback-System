<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <title>FeedCraft Student Help</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
  <link rel="icon" href="./images/LOGO img.png" type="image/png">
  <link rel="stylesheet" href="./css/preload.css"/>
  <script defer src="./preload.js"></script>
  <link rel="stylesheet" href="./css/help.css"/>
  <link rel="stylesheet" href="./css/homesnavbar.css"/>
 </head>
 <body>
  <div id="preload" class="preload" data-preaload>
    <div class="circle"></div>
    <p class="text">Loading...</p>  
  </div>
     <div class="header">
   <img alt="FeedCraft Logo" style="height: 45px;" src="./images/LOGO.png" width="50"/>
   <div class="title">STUDENT - LOG - IN</div>
   <ul>
    <li>
     <a href="studenthome">
      <div class="user-icon"><img src="./images/pofile.png"/></div>
     </a>
     <ul class="dropdown">
      <li><a href="studentprofile">My Profile</a></li>
      <li><a href="/" class="red-hover">Logout</a></li>
     </ul>
    </li>
   </ul>
  </div>
  <div style="background-color: #5b5a5ab4; margin-top: 51px; width: 100%; padding: 2px; position: fixed;"></div>

  <div class="nav">
   <a href="studenthome">Home</a>
   <a href="studentcurrentresponses">Responses</a>
   <a href="studenthistory">History</a>
   <a href="studenthelp">Help</a>
  </div>

       <div class="main-container-content-box">
        <div class="content">
          <h1 style="color: #29016B;">
           Help Center
          </h1>
          <p>
           If you need assistance with using the Student Feedback System or have any inquiries, please contact us through the following channels:
          </p>
          <p>
           General Support, Technical Support, Admin Queries: admin@empowerfeedbackhub.com
          </p>
          <p>
           Phone: +1-800-123-4567
          </p>
          <p>
           For additional resources, you can message/complaint our support team directly through the form below.
          </p>
          <div class="form-container">
           <form>
            <label for="subject">
             Subject:
            </label>
            <input id="subject" name="subject" placeholder="Subject..." type="text"/>
            <label for="message">
             Message here:
            </label>
            <textarea id="message" name="message" placeholder="Write here..." rows="5"></textarea>
            <button class="submit-btn" type="submit">
             Submit
            </button>
            <button class="clear-btn" type="reset">
             Clear
            </button>
           </form>
          </div>
         </div>
       </div>

 
  <footer>
    <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
 </body>
</html>
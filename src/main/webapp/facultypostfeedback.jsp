<%@page import="com.klef.jfsd.springboot.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Faculty faculty = (Faculty) request.getAttribute("faculty");
	if(faculty == null){
		response.sendRedirect("sessionexpiry.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
 <head>
  <title>FeedCraft Faculty Dashboard</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
  <link rel="icon" href="./images/LOGO img.png" type="image/png">
  <link rel="stylesheet" href="./css/preload.css"/>
  <script defer src="./preload.js"></script>
  <link rel="stylesheet" href="./css/homeactiveform.css"/>
  <link rel="stylesheet" href="./css/homesnavbar.css"/>
 </head>
 <body>
    <div id="preload" class="preload" data-preaload>
        <div class="circle"></div>
        <p class="text">Loading...</p>  
      </div>
  <div class="header">
   <img alt="FeedCraft Logo" style="height: 45px;" src="./images/LOGO.png" width="50"/>
   <div class="title">FACULTY - LOG - IN</div>
   <ul>
    <li>
     <a href="facultyhome.jsp">
      <div class="user-icon"><img src="./images/pofile.png"/></div>
     </a>
     <ul class="dropdown">
      <li><a href="facultyprofile.jsp">My Profile</a></li>
      <li><a href="logout" class="red-hover">Logout</a></li>
     </ul>
    </li>
   </ul>
  </div>
  <div style="background-color: #5b5a5ab4; margin-top: 51px; width: 100%; padding: 2px; position: fixed;"></div>

  <div class="nav">
   <a href="facultyhome.jsp">Home</a>
   <a href="facultypostfeedback.jsp">Post Feedback</a>
   <a href="facultyhistory.jsp">History</a>
   <a href="facultyhelp.jsp">Help</a>
  </div>

  <div class="main-container-content-box">
   <h1>Under Construction....!! ;)</h1>
  </div>

  

  <footer>
    <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
 </body>
</html>

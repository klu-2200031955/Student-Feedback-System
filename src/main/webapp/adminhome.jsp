<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	Admin admin = (Admin) session.getAttribute("admin");
	if(admin==null){
		response.sendRedirect("sessionexpiry.jsp");
		return;
	}
%>


<html>
 <head>
  <title>FeedCraft Admin Dashboard</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
  <link rel="icon" href="./images/LOGO img.png" type="image/png">
  <link rel="stylesheet" href="./css/preload.css"/>
  <script defer src="./preload.js"></script>
  <link rel="stylesheet" href="./css/adminhome.css"/>
  <link rel="stylesheet" href="./css/homesnavbar.css"/>
  <link rel="stylesheet" href="./css/homeactiveform.css"/>
 </head>
 </head>
 <body>
    <div id="preload" class="preload" data-preaload>
        <div class="circle"></div>
        <p class="text">Loading...</p>  
    </div>
    <div class="header">
        <a href="adminhome"><img alt="FeedCraft Logo" style="height: 45px;" src="./images/LOGO.png" width="50"/></a>
        <div class="title">ADMIN - LOG - IN</div>
        <ul>
         <li>
          <a href="adminhome">
           <div ><img class="user-icon" src="./images/pofile.png"/></div>
          </a>
          <ul class="dropdown">
           <li><a href="adminprofile">My Profile</a></li>
           <li><a href="logout" class="red-hover">Logout</a></li>
          </ul>
         </li>
        </ul>
       </div>
     
       <div style="background-color: #5b5a5ab4; margin-top: 51px; width: 100%; padding: 2px; position: fixed;"></div>
     
       <div class="nav">
        <a href="adminhome">Home</a>
        <a href="adminstudent">Student</a>
        <a href="adminfaculty">Faculty</a>
        <a href="admincourses">Course</a>
        <a href="adminpostfeedback">Post Feedback</a>
        <a href="admincomplaintlog">Complaint Logs</a>
       </div>

       <div class="main-container-content-box">

        <div class="search-bar">
          <input placeholder="search from here" type="text"/>
          <button><i class="fas fa-search"></i></button>
         </div>
       
         <div class="dashboard">
          <h2>Dashboard - Administration Details</h2>
          <div class="stats">
           <div class="stat">
            <div class="icon"><i class="fas fa-user-graduate"></i></div>
            <h3>${studentCount}</h3>
            <p>Students Count</p>
            <a class="more-info" href="#">More info <i class="fas fa-arrow-right"></i></a>
           </div>
           <div class="stat">
            <div class="icon"><i class="fas fa-chalkboard-teacher"></i></div>
            <h3>${facultyCount}</h3>
            <p>Faculty Count</p>
            <a class="more-info" href="#">More info <i class="fas fa-arrow-right"></i></a>
           </div>
           <div class="stat">
            <div class="icon"><i class="fas fa-file-alt"></i></div>
            <h3>${courseCount}</h3>
            <p>Courses Count</p>
            <a class="more-info" href="#">More info <i class="fas fa-arrow-right"></i></a>
           </div>
           <div class="stat">
            <div class="icon"><i class="fas fa-comments"></i></div>
            <h3>30</h3>
            <p>Feedback Received</p>
            <a class="more-info" href="#">More info <i class="fas fa-arrow-right"></i></a>
           </div>
          </div>
         </div>
       
         <br><br>
       
         <div class="active-forms">
          <h2>Active Forms</h2>
          <div class="forms">
           <div class="form">
            <img alt="Form Image" height="100" src="./images/Form.png"/>
            <p style="margin-bottom: 10%;">CRT Application Form</p>
            <p style="color: grey;  font-size: small;">by - Director CRT</p>
            <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
            <a class="status active">Active</a> 
            <a style="text-align: right;">Filled</a>
           </div>
           <div class="form">
               <img alt="Form Image" height="100" src="./images/Form.png"/>
               <p style="margin-bottom: 10%;">CRT Application Form</p>
               <p style="color: grey;  font-size: small;">by - Director CRT</p>
               <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
               <a class="status expired">Active</a> 
               <a style="text-align: right;">Unfilled</a>
           </div>
           <div class="form">
               <img alt="Form Image" height="100" src="./images/Form.png"/>
               <p style="margin-bottom: 10%;">CRT Application Form</p>
               <p style="color: grey;  font-size: small;">by - Director CRT</p>
               <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
               <a class="status active">Active</a> 
               <a style="text-align: right;">Unfilled</a>
           </div>
           <div class="form">
               <img alt="Form Image" height="100" src="./images/Form.png"/>
               <p style="margin-bottom: 10%;">CRT Application Form</p>
               <p style="color: grey;  font-size: small;">by - Director CRT</p>
               <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
               <a class="status expired">Active</a> 
               <a style="text-align: right;">Filled</a>
           </div>
          </div>
         </div>

      </div>
  

  <footer>
    <p>Copyright ©KL-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
 </body>
</html>

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
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet"/>
  <link rel="icon" href="./images/LOGO img.png" type="image/png"/>
  <link rel="stylesheet" href="./css/preload.css"/>
  <script defer src="./preload.js"></script>
  <link rel="stylesheet" href="./css/adminhome.css"/>
  <link rel="stylesheet" href="./css/homesnavbar.css"/>
  <link rel="stylesheet" href="./css/admintables.css"/>
</head>
<body>
  <div id="preload" class="preload" data-preload>
    <div class="circle"></div>
    <p class="text">Loading...</p>  
  </div>

  <div class="header">
    <a href="adminhome"><img alt="FeedCraft Logo" src="./images/LOGO.png" width="50"/></a>
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
    <div class="content">
      <h2>Accusation</h2>
      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th style="width: 50px;">S.no.</th>
              <th style="width: 100px;">ID.no.</th>
              <th style="width: 100px;">Received-Date</th>
              <th style="width: 150px;">Subject</th>
              <th style="width: 300px;">Message</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style="width: 50px;">1.</td>
              <td style="width: 100px;">31954</td>
              <td style="width: 100px;">Khowshikk Sharma</td>
              <td style="width: 150px;">5</td>
              <td style="width: 300px;">It is difficult to take snacks near cantine because the smell from washroom is too bad.</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  

  <footer>
    <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
</body>
</html>

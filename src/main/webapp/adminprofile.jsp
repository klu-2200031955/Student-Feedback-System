<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	Admin admin = (Admin) session.getAttribute("admin");
	if(admin==null){
		response.sendRedirect("adminsessionexpiry.jsp");
		return;
	}
%>
<html>
    <head>
        <title>FeedCraft Admin Dashboard</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
        <link rel="icon" href="./images/LOGO img.png" type="image/png">
        <link rel="stylesheet" href="./css/preload.css"/>
        <script defer src="./preload.js"></script>
        <link rel="stylesheet" href="./css/homesnavbar.css"/>
        <link rel="stylesheet" href="./css/myprofile.css"/>
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
            <div class="profile-content">
                <div class="header-row">
                    <h2>My Profile</h2>
                    <a href="admineditprofile"><button class="edit-button">Edit</button></a>
                </div>

                <div class="profile-card">
                    <div class="profile-section">
                    
                    <div class="profile-info">
                            <img alt="Profile Picture" src="./images/pofile.png" style="width: 500px; height: 300px"/>
                        </div>
                        <div class="profile-info">
                            <table>
                                <tr>
                                    <td><label>ID:</label></td>
                                    <td><input disabled type="text" value="${admin.id}"/></td>
                                </tr>
                                <tr>
                                    <td><label>Name:</label></td>
                                    <td><input disabled type="text" value="${admin.name}"/></td>
                                </tr>
                                <tr>
                                    <td><label>Gender:</label></td>
                                    <td><input disabled type="text" value="${admin.gender}"/></td>
                                </tr>
                                <tr>
                                    <td><label>Phone No:</label></td>
                                    <td><input disabled type="text" value="${admin.contact}"/></td>
                                </tr>
                                <tr>
                                    <td><label>Email:</label></td>
                                    <td><input disabled type="text" value="${admin.email}"/></td>
                                </tr>
                            </table>
                        </div>

                        
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
        </footer>
    </body>
</html>

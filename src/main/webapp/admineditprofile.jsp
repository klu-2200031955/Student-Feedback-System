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
    <title>FeedCraft Student MyProfile</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/preload.css" />
    <script defer src="./preload.js"></script>
    <link rel="icon" href="./images/LOGO img.png" type="image/png">
    <link rel="stylesheet" href="./css/homesnavbar.css" />
    <link rel="stylesheet" href="./css/myprofile.css" />
    <link rel="stylesheet" href="./css/myprofileupdatetable.css" />

    <style>
       
    </style>
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
                <h2>Edit Page for My Profile </h2>
                <a href="adminprofile"><button class="edit-button">Back</button></a>
            </div>

            <div class="profile-card">
                <div class="profile-section">
                    <div class="profile-info">
                            <div>
                                <h3>Locked Data</h3>
                            </div>
                            <table>
                                <tr>
                                    <td><label for="id">ID:</label></td>
                                    <td><input type="text" id="id" value="${admin.id}" disabled/></td>
                                </tr>
                                
                            </table>
                            <div class="head">
                                <h3>Modifiable Data</h3>
                            </div>
                           <form action="updateadminprofile" method="post">
								    <input type="hidden" name="id" value="${admin.id}" />
								    <table>
								        <tr>
								            <td><label for="fullname">Full Name:</label></td>
								            <td><input type="text" id="fullname" name="name" value="${admin.name}" /></td>
								        </tr>
								        <tr>
								            <td><label for="gender">Gender:</label></td>
								            <td><input type="text" id="gender" name="gender" value="${admin.gender}" /></td>
								        </tr>
								        <tr>
								            <td><label for="email">Email:</label></td>
								            <td><input type="text" id="email" name="email" value="${admin.email}" /></td>
								        </tr>
								        <tr>
								            <td><label for="contact">Phone no:</label></td>
								            <td><input type="text" id="contact" name="contact" value="${admin.contact}" /></td>
								        </tr>
								        <tr>
								            <td><label for="password">Password:</label></td>
								            <td><input type="password" id="password" name="password" value="${admin.password}" /></td>
								        </tr>
								    </table>
								    <div>
								        <input type="submit" value="Update" style="width: 20%;" />
								        <input type="reset" value="Clear" style="width: 20%;" />
								    </div>
								</form>
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

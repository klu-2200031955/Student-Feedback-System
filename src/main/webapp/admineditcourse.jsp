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
        <a href="adminmapping">Mapping</a>
        <a href="adminpostfeedback">Post Feedback</a>
        <a href="admincomplaintlog">Complaint Logs</a>
       </div>
       

       <div class="main-container-content-box">
        <div class="profile-content">
            <form action="updateCourse?id=${course.id}" method="post">
            <div class="header-row">
                <h2>Editing Course Data for ID: ${course.id}</h2>
            </div>

            <div class="profile-card">
                <div class="profile-section">
                    <div class="profile-info">
                            <div>
                                <h3>Modifiable Course Data</h3>
                            </div>
                            <table>
                                <tr>
                                    <td><label for="cname">Name:</label></td>
                                    <td><input type="text" id="cname" name="cname" value="${course.name}"/></td>
                                </tr>
                                <tr>
                                    <td><label for="ccredit">Credit:</label></td>
                                    <td><input type="text" id="ccredit" name="ccredit" value="${course.credits}"/></td>
                                </tr>
                                <tr>
                                    <td><label for="cyear">Year:</label></td>
                                    <td><input type="text" id="cyear" name="cyear" value="${course.year}" /></td>
                                </tr>
                                <tr>
                                    <td><label for="cdept">Department:</label></td>
                                    <td><input type="text" id="cdept" name="cdept" value="${course.department}" /></td>
                                </tr>
                            </table>
                            <div>
                                <a href="#"><input type="submit" value="Update" style="width: 20%;" /></a>
                                <input type="reset" value="Clear" style="width: 20%;" />
                            </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    </div>


  
  
  <footer>
    <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
 </body>
</html>

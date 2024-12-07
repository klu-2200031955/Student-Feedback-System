<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
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
  <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet"/>
  <link rel="icon" href="./images/LOGO img.png" type="image/png"/>
  <link rel="stylesheet" href="./css/preload.css"/>
  <script defer src="./preload.js"></script>
  <link rel="stylesheet" href="./css/adminhome.css"/>
  <link rel="stylesheet" href="./css/homesnavbar.css"/>
  <link rel="stylesheet" href="./css/admintables.css"/>
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
        <div class="content"> 
          <div class="content-header">
            <h2>Course Records</h2>
            <div class="button-container">
              <a href="adminaddcourse"><button class="edit-button">New Course</button></a>
            </div>
          </div>
          <div class="table-container">
            <table>
             <thead>
              <tr>
               <th>S.no.</th>
               <th>ID.no.</th>
               <th>Name</th>
               <th>Credit</th>
               <th>Year</th>
               <th>Department</th>
               <th>Status</th>
               <th>Action</th>
              </tr>
             </thead>
             <tbody>
                <c:forEach items="${courselist}" var="course" varStatus="status">
                	<tr>
                		<td><c:out value="${status.index + 1}"></c:out></td>
                		<td><c:out value="${course.id}"></c:out></td>
                		<td><c:out value="${course.name}"></c:out></td>
                		<td><c:out value="${course.credits}"></c:out></td>
                		<td><c:out value="${course.year}"></c:out></td>
                		<td><c:out value="${course.department}"></c:out></td>
                		<td style="color: ${course.status ? 'green' : 'red'}; font-weight: bold;">
                				<c:out value="${course.status ? 'Active' : 'Inactive'}"></c:out>
                		</td>
                		<td class="action-icons">
		                  <a href="admineditcourse?id=${course.id}"><i style="color: blue;cursor: pointer;" class="fas fa-pen"></i></a>&nbsp;&nbsp;&nbsp;
		                  <a href="#"><i style="color:red;cursor: pointer" class="fas fa-trash"></i></a>
		                  <div class="form-check form-switch">
							  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
							  <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch checkbox input</label>
						  </div>
		                </td>
                	</tr>
                </c:forEach>
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

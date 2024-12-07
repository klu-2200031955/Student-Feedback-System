<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
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
        <div class="content"> 
          <div class="content-header">
            <h2>Faculty Mapped Courses</h2>
            <div class="button-container">
              <a href="adminaddcourse"><button class="edit-button">Add Mapping</button></a>
            </div>
          </div>
          <div class="table-container">
            <table>
             <thead>
              <tr>
               <th>S.no.</th>
               <th>ID.no.</th>
               <th>Course ID</th>
               <th>Course Name</th>
               <th>Faculty ID</th>
               <th>Faculty Name</th>
               <th>Section</th>
               <th>L-T-P-S</th>
               <th>Action</th>
              </tr>
             </thead>
             <tbody>
                <c:forEach items="${facultymappinglist}" var="facultymappinglist" varStatus="status">
                	<tr>
                		<td><c:out value="${status.index + 1}"></c:out></td>
                		<td><c:out value="${facultymappinglist.id}"></c:out></td>
                		<td><c:out value="${facultymappinglist.coursename}"></c:out></td>
                		<td><c:out value="${facultymappinglist.courseid}"></c:out></td>
                		<td><c:out value="${facultymappinglist.facultyid}"></c:out></td>
                		<td><c:out value="${facultymappinglist.facultyname}"></c:out></td>
                		<td><c:out value="${facultymappinglist.section}"></c:out></td>
                		<td><c:out value="${facultymappinglist.ltps}"></c:out></td>
                		<td class="action-icons">
		                  <a href="#"><i style="color:red;cursor: pointer" class="fas fa-trash"></i></a>
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

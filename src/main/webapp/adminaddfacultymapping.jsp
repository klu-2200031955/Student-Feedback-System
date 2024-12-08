<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
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
  <link rel="stylesheet" href="./css/mapping.css" />
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
        <a href="adminmapping">Mapping</a>
        <a href="adminpostfeedback">Post Feedback</a>
        <a href="admincomplaintlog">Complaint Logs</a>
       </div>
       

       <div class="main-container-content-box">
        <div class="mapping-content">
            <div class="header-row">
                <h2>Mapping Course with Faculty</h2>
            </div>

            <div class="mapping-card">
                <div class="mapping-section">
                    <div class="mapping-info">
                        <form method="post" action="addfacultymapping">
                            <table>
                                <tr>
                                    <td><label for="course">Course:</label></td>
                                    <td>
                                        <select id="course" name="cid">
										    <option value="">Select Course</option>
										    <c:forEach var="course" items="${courselist}">
										        <option value="${course.getId()}">${course.getId()} - ${course.getName()}</option>
										    </c:forEach>
										</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label for="faculty">Faculty:</label></td>
                                    <td>
                                        <select id="faculty" name="fid">
										    <option value="">Select Faculty</option>
										    <c:forEach var="faculty" items="${facultylist}">
										        <option value="${faculty.getId()}">${faculty.getId()} - ${faculty.getName()}</option>
										    </c:forEach>
										</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label for="preferences">Preferences:</label></td>
                                    <td colspan="4">
                                        <div class="checkbox-container">
										    <label><input type="checkbox" name="components" value="L" />Lecture</label>
										    <label><input type="checkbox" name="components" value="P" />Practical</label>
										    <label><input type="checkbox" name="components" value="T" />Tutorial</label>
										    <label><input type="checkbox" name="components" value="S" />Skill</label>
										</div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td><label for="section">Section:</label></td>
                                    <td><input type="number" id="section" name="section" required/></td>
                                </tr>
                            </table>
                            <div>
                                <a href="studentprofile.html"><input type="submit" value="Add" style="width: 20%;" /></a>
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

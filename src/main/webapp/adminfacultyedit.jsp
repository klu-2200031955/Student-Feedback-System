<%@ page import="com.klef.jfsd.springboot.model.Faculty" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    Faculty faculty = (Faculty) request.getAttribute("faculty");
	if(faculty == null){
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
                    <img class="user-icon" src="./images/pofile.png"/>
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
                <h2>Edit Faculty Record for ID: ${faculty.id}</h2>
            </div>
            
            <div class="profile-card">
                <div class="profile-section">
                    <div class="profile-info">
                        <div>
                            <h3>Modifiable Faculty Data</h3>
                        </div>
                        <form action="/editfaculty" method="post">
                            <input type="hidden" name="id" value="${faculty.id}" />
                            <input type="hidden" id="password" name="password" value="${faculty.password}" required />
                            <input type="hidden" id="email" name="email" value="${faculty.email}" required />
                            <input type="hidden" id="linkedin" name="linkedin" value="${faculty.linkedin}" />
                            <input type="hidden" id="facebook" name="facebook" value="${faculty.facebook}" />
                                
                            <table>
                                <tr>
                                    <td><label for="name">Full Name:</label></td>
                                    <td><input type="text" id="name" name="name" value="${faculty.name}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="dob">Date of Birth:</label></td>
                                    <td><input type="text" id="dob" name="dob" placeholder="dd-mm-yyyy" value="${faculty.dob}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="gender">Gender:</label></td>
                                    <td>
                                     <select name="gender" id="gender" required>
							            <option value="Male" ${faculty.gender == 'Male' ? 'selected' : ''}>Male</option>
							            <option value="Female" ${faculty.gender == 'Female' ? 'selected' : ''}>Female</option>
							            <option value="Other" ${faculty.gender == 'Other' ? 'selected' : ''}>Other</option>
							        </select>
									</td>
                                </tr>
                                <tr>
                                    <td><label for="contact">Contact:</label></td>
                                    <td><input type="text" id="contact" name="contact" value="${faculty.contact}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="fathername">Father's Name:</label></td>
                                    <td><input type="text" id="fathername" name="fathername" value="${faculty.fathername}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="department">Department:</label></td>
                                    <td><input type="text" id="department" name="department" value="${faculty.department}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="salary">Salary:</label></td>
                                    <td><input type="number" id="salary" name="salary" step="0.01" value="${faculty.salary}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="address">Address:</label></td>
                                    <td><textarea id="address" name="address" required>${faculty.address}</textarea></td>
                                </tr>
                                
                            </table>
                                    <input type="submit" value="Update" style="width: 20%;"/>
                                    <input type="reset" value="Clear" style="width: 20%;"/>
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

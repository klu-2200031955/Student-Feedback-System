<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    Student student = (Student) request.getAttribute("student");
	if(student == null){
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
                <h2>Edit Student Record for ID: ${student.id}</h2>
            </div>

            <div class="profile-card">
                <div class="profile-section">
                    <div class="profile-info">
                        <div>
                            <h3>Modifiable Student Data</h3>
                        </div>
                        <form action="/editstudent" method="post">
                            <input type="hidden" name="id" value="${student.id}" />
                            <input type="hidden" id="password" name="password" value="${student.password}" required />
                            <input type="hidden" id="email" name="email" value="${student.email}" required />
                            <input type="hidden" id="linkedin" name="linkedin" value="${student.linkedin}" />
                            <input type="hidden" id="facebook" name="facebook" value="${student.facebook}" />

                            <table>
                                <tr>
                                    <td><label for="name">Full Name:</label></td>
                                    <td><input type="text" id="name" name="name" value="${student.name}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="dob">Date of Birth:</label></td>
                                    <td><input type="text" id="dob" name="dob" placeholder="dd-mm-yyyy" value="${student.dob}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="gender">Gender:</label></td>
                                    <td>
                                        <select name="gender" id="gender" required>
                                            <option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
                                            <option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
                                            <option value="Other" ${student.gender == 'Other' ? 'selected' : ''}>Other</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label for="fathername">Father's Name:</label></td>
                                    <td><input type="text" id="fathername" name="fathername" value="${student.fathername}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="department">Department:</label></td>
                                    <td><input type="text" id="department" name="department" value="${student.department}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="fee">Fee (per year):</label></td>
                                    <td><input type="number" id="fee" name="fee" step="0.01" value="${student.fee}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="contact">Phone Number:</label></td>
                                    <td><input type="text" id="contact" name="contact" value="${student.contact}" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="address">Address:</label></td>
                                    <td><textarea id="address" name="address" required>${student.address}</textarea></td>
                                </tr>
                            </table>
                            <input type="submit" value="Update" style="width: 20%;" />
                            <input type="reset" value="Clear" style="width: 20%;" />
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

<%@ page import="com.klef.jfsd.springboot.model.Admin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
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
        <a href="adminmapping">Mapping</a>
        <a href="adminpostfeedback">Post Feedback</a>
        <a href="admincomplaintlog">Complaint Logs</a>
    </div>

    <div class="main-container-content-box">
        <div class="content">
            <div class="content-header">
                <h2>Current Faculty Records</h2>
                <div class="button-container">
                    <a href="adminfacultyrequest"><button class="edit-button">Request Access Records</button></a>
                    <a href="adminfacultyreject"><button class="edit-button">Former Faculty Records</button></a>
                </div>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>S.no.</th>
                            <th>ID.no.</th>
                            <th>Name</th>
                            <th>DOB</th>
                            <th>Gender</th>
                            <th>Department</th>
                            <th>Ph.no.</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty faculty}">
                                <tr>
                                    <td colspan="8" style="text-align: center;">No Data</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:set var="counter" value="1" />
                                <c:forEach items="${faculty}" var="faculty">
                                    <tr>
                                        <td>${counter}</td>
                                        <td data-label="ID"><c:out value="${faculty.id}"/></td>
                                        <td data-label="Name"><c:out value="${faculty.name}"/></td>
                                        <td data-label="Date of Birth"><c:out value="${faculty.dob}"/></td>
                                        <td data-label="Gender"><c:out value="${faculty.gender}"/></td>
                                        <td data-label="Department"><c:out value="${faculty.department}"/></td>
                                        <td data-label="Contact"><c:out value="${faculty.contact}"/></td>

                                        <td class="action-icons">
                                            <form action="adminEditFaculty" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${faculty.id}" />
                                                <button type="submit" style="background: none; border: none; color: blue; cursor: pointer;">
                                                    <i class="fas fa-pen"></i>
                                                </button>
                                            </form>
                                            <form action="deleteFaculty" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${faculty.id}" />
                                                <button type="submit" style="background: none; border: none; color: red; cursor: pointer;">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>

                                    </tr>
                                    <c:set var="counter" value="${counter + 1}" />
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
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

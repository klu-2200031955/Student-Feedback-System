<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Form - Admin</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
    <link rel="icon" href="./images/LOGO img.png" type="image/png">
    <link rel="stylesheet" href="./css/preload.css"/>
    <script defer src="./preload.js"></script>
    <link rel="stylesheet" href="./css/adminhome.css"/>
    <link rel="stylesheet" href="./css/homesnavbar.css"/>
    <link rel="stylesheet" href="./css/homeactiveform.css"/>
</head>
<body>
    <div class="header">
        <a href="adminhome"><img alt="FeedCraft Logo" style="height: 45px;" src="./images/LOGO.png" width="50"/></a>
        <div class="title">ADMIN - FEEDBACK FORM</div>
        <ul>
            <li>
                <a href="adminhome">
                    <div><img class="user-icon" src="./images/pofile.png"/></div>
                </a>
                <ul class="dropdown">
                    <li><a href="adminprofile">My Profile</a></li>
                    <li><a href="logout" class="red-hover">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>

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
        <h1>Enter Feedback Questions</h1>
        <form action="submitFeedbackQuestions" method="post">
            <label for="q1">Question 1:</label>
            <textarea id="q1" name="q1" rows="4" cols="50"></textarea><br><br>

            <label for="q2">Question 2:</label>
            <textarea id="q2" name="q2" rows="4" cols="50"></textarea><br><br>

            <label for="q3">Question 3:</label>
            <textarea id="q3" name="q3" rows="4" cols="50"></textarea><br><br>

            <label for="q4">Question 4:</label>
            <textarea id="q4" name="q4" rows="4" cols="50"></textarea><br><br>

            <label for="q5">Question 5:</label>
            <textarea id="q5" name="q5" rows="4" cols="50"></textarea><br><br>

            <input type="submit" value="Submit Feedback Questions">
        </form>
    </div>

    <footer>
        <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
    </footer>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <form>
                            <table>
                                <tr>
                                    <td><label for="course">Course:</label></td>
                                    <td>
                                        <select id="course">
                                            <option value="cs">Computer Science</option>
                                            <option value="math">Mathematics</option>
                                            <option value="phy">Physics</option>
                                            <option value="eng">English</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label for="faculty">Faculty:</label></td>
                                    <td>
                                        <select id="faculty">
                                            <option value="john">Prof. John</option>
                                            <option value="mary">Prof. Mary</option>
                                            <option value="paul">Prof. Paul</option>
                                            <option value="susan">Prof. Susan</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label for="preferences">Preferences:</label></td>
                                    <td colspan="4">
                                        <div class="checkbox-container">
                                            <label><input type="checkbox" id="preference1" value="L" />Lecture</label>
                                            <label><input type="checkbox" id="preference2" value="P" />Pratical</label>
                                            <label><input type="checkbox" id="preference3" value="T" />Tutorial</label>
                                            <label><input type="checkbox" id="preference4" value="S" />Skill</label>
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td><label for="section">Section:</label></td>
                                    <td><input type="number" id="section" /></td>
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

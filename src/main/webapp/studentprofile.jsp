<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FeedCraft Student My Profile</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/preload.css"/>
        <script defer src="./preload.js"></script>
        <link rel="icon" href="./images/LOGO img.png" type="image/png">
        <link rel="stylesheet" href="./css/homesnavbar.css"/>
        <link rel="stylesheet" href="./css/myprofile.css"/>
    </head>
    <body>
        <div id="preload" class="preload" data-preaload>
            <div class="circle"></div>
            <p class="text">Loading...</p>  
        </div>
      <div class="header">
   <img alt="FeedCraft Logo" style="height: 45px;" src="./images/LOGO.png" width="50"/>
   <div class="title">STUDENT - LOG - IN</div>
   <ul>
    <li>
     <a href="studenthome">
      <div class="user-icon"><img src="./images/pofile.png"/></div>
     </a>
     <ul class="dropdown">
      <li><a href="studentprofile">My Profile</a></li>
      <li><a href="/" class="red-hover">Logout</a></li>
     </ul>
    </li>
   </ul>
  </div>
  <div style="background-color: #5b5a5ab4; margin-top: 51px; width: 100%; padding: 2px; position: fixed;"></div>

  <div class="nav">
   <a href="studenthome">Home</a>
   <a href="studentcurrentresponses">Responses</a>
   <a href="studenthistory">History</a>
   <a href="studenthelp">Help</a>
  </div>


        <div class="main-container-content-box">
            <div class="profile-content">
                <div class="header-row">
                    <h2>My Profile</h2>
                    <a href="studenteditprofile"><button class="edit-button">Edit</button></a>
                </div>

                <div class="profile-card">
                    <div class="profile-section">
                        <div class="profile-info">
                            <img alt="Profile Picture" src="./images/pofile.png"/>

                            <table>
                                <tr>
                                    <td><label>ID:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>DOB:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>Gender:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                            </table>
                        </div>

                        <div class="profile-info">
                            <table>
                                <tr>
                                    <td><label>Name:</label></td>
                                    <td><input disabled type="text" />
                                <tr>
                                    <td><label>Father Name:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>Phone No:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>Department:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>Fee (per year):</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>Address:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>Email:</label></td>
                                    <td><input disabled type="text"/></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="profile-section">
                        <div class="profile-info">
                            <table>
                                <tr>
                                    <td><label>LinkedIn Link:</label></td>
                                    <td><input style="width: 81%;" disabled type="text"/></td>
                                </tr>
                                <tr>
                                    <td><label>Facebook Link:</label></td>
                                    <td><input style="width: 81%;" disabled type="text"/></td>
                                </tr>
                            </table>
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

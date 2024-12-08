<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">>
 <head>
  <title>FeedCraft Student Responses</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
  <link rel="icon" href="./images/LOGO img.png" type="image/png">
  <link rel="stylesheet" href="./css/preload.css"/>
  <script defer src="./preload.js"></script>
  <link rel="stylesheet" href="./css/homeactiveform.css"/>
  <link rel="stylesheet" href="./css/homesnavbar.css"/>
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
    <div class="search-bar">
        <input placeholder="search from here" type="text"/>
        <button><i class="fas fa-search"></i></button>
       </div>
     
     
       <div class="active-forms">
         <h2>All Forms</h2>
         <div class="forms">
          <div class="form">
           <img alt="Form Image" height="100" src="./images/Form.png"/>
           <p style="margin-bottom: 10%;">CRT Application Form</p>
           <p style="color: grey;  font-size: small;">by - Director CRT</p>
           <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
           <a class="status active">Active</a> 
           <a style="text-align: right;">Filled</a>
          </div>
          <div class="form">
              <img alt="Form Image" height="100" src="./images/Form.png"/>
              <p style="margin-bottom: 10%;">CRT Application Form</p>
              <p style="color: grey;  font-size: small;">by - Director CRT</p>
              <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
              <a class="status expired">Active</a> 
              <a style="text-align: right;">Unfilled</a>
          </div>
          <div class="form">
              <img alt="Form Image" height="100" src="./images/Form.png"/>
              <p style="margin-bottom: 10%;">CRT Application Form</p>
              <p style="color: grey;  font-size: small;">by - Director CRT</p>
              <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
              <a class="status active">Active</a> 
              <a style="text-align: right;">Unfilled</a>
          </div>
          <div class="form">
              <img alt="Form Image" height="100" src="./images/Form.png"/>
              <p style="margin-bottom: 10%;">CRT Application Form</p>
              <p style="color: grey;  font-size: small;">by - Director CRT</p>
              <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
              <a class="status expired">Active</a> 
              <a style="text-align: right;">Filled</a>
          </div>
          <div class="form">
             <img alt="Form Image" height="100" src="./images/Form.png"/>
             <p style="margin-bottom: 10%;">CRT Application Form</p>
             <p style="color: grey;  font-size: small;">by - Director CRT</p>
             <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
             <a class="status expired">Active</a> 
             <a style="text-align: right;">Filled</a>
         </div>
         <div class="form">
             <img alt="Form Image" height="100" src="./images/Form.png"/>
             <p style="margin-bottom: 10%;">CRT Application Form</p>
             <p style="color: grey;  font-size: small;">by - Director CRT</p>
             <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
             <a class="status expired">Active</a> 
             <a style="text-align: right;">Filled</a>
         </div>
         <div class="form">
             <img alt="Form Image" height="100" src="./images/Form.png"/>
             <p style="margin-bottom: 10%;">CRT Application Form</p>
             <p style="color: grey;  font-size: small;">by - Director CRT</p>
             <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
             <a class="status expired">Active</a> 
             <a style="text-align: right;">Filled</a>
         </div>
         <div class="form">
             <img alt="Form Image" height="100" src="./images/Form.png"/>
             <p style="margin-bottom: 10%;">CRT Application Form</p>
             <p style="color: grey;  font-size: small;">by - Director CRT</p>
             <p style="color: grey;  font-size: small;">expires by 07-10-2024</p><br>
             <a class="status expired">Active</a> 
             <a style="text-align: right;">Filled</a>
         </div>
         </div>
        </div>
  </div>

  

  
  <footer>
    <p>Copyright ©K-University 2024-25 SDP Project. All rights reserved.</p>
  </footer>
 </body>
</html>

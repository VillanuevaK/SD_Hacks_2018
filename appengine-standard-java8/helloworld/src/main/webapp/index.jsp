<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.appengine.java8.HelloAppEngine" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="styleSheet1.css">
  <meta charset = "utf-8">
  <meta name = "viewport" content = "width = device-width, initial - scale = 1">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <title>SD_HACKS</title>
</head>
<body>
  <!--Start nav bar-->
  <nav class = "navbar">
  <div class = "container-fluid">
  <div class = "navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>                        
    </button>
    <a class="navbar-brand" href="https://www.sdhacks.io/">SD HACKS 2018</a>
  </div>
  <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
      <!-- <li><a href="about.html">About</a></li>
      <li><a href="portfolio.html">Portfolio</a></li>
      <li><a href="contact.html">Contact</a></li> -->
    </ul>
    </div>
    </div>
    </nav>
  <!--End Nav Bar-->

  <div class="container-fluid bg-3 text-center">    
    <div class="container text-center">
      <h1>Welcome to this work in progress</h1>
      <h2><code>Made by Danny, and Kevin</code></h2>
    </div>
  </div><br>
  
  <div class="container-fluid bg-3 text-center">
    <form method="POST" action="\hello">
      <div>
        
        <textarea name="description" id="description" rows="10" cols="50" class="form-control"> ${fn:escapeXml(blog.content)} </textarea>
      </div>
      <button type="submit" class="button"> Save </button>
    </form>
  </div>

  <!--File upload widget-->   
  <div id="fileupload" class="container-fluid bg-3 text-center">
  <form method="post" enctype="multipart/form-data">
    <div class="fileupload-buttonbar">
     <label class="fileinput-button">
      <span>Upload</span>
      <input type="file" name="files[]" multiple>
     </label>
    </div>
  </form>
  <div class="fileupload-content">
      <table class="files"></table>
  </div>
  </div>

<script id="template-upload" type="text/x-jquery-tmpl">
</script>
<!--End file upload widget--> 

  <% ArrayList<String> listOfSavedDescriptions = (ArrayList<String>) request.getAttribute("outPut"); %>
  <div class="container-fluid bg-3 text-center">    
    <p> Some info: 
      <%for(String result : listOfSavedDescriptions) {%> 
        <%=result%>
      <%}%> 
    </p>
  </div><br>
  
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.appengine.java8.HelloAppEngine" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="styleSheet1.css">
  <meta charset = "utf-8">
  <meta name = "viewport" content = "width = device-width, initial - scale = 1">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <a class="navbar-brand" href="index.jsp">SD HACKS 2018</a>
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
      <h2><code>Made by Hirish, Danny, and Kevin</code></h2>
    </div>
  </div><br>
  
  <p>This is <%= HelloAppEngine.getInfo() %>.</p>
  <table>
    <tr>
      <td colspan="2" style="font-weight:bold;">Available Servlets:</td>
    </tr>
    <tr>
      <td><a href='/hello'>Hello Its duniel</a></td>
    </tr>
  </table>

  <div class= "container">
    <form method="POST" action="\hello">
      <div>
        <label for = "description"> Enter some nums </label>
        <textarea name="description" id="description" rows="10" cols="50" class="form-control"> ${fn:escapeXml(blog.content)} </textarea>
      </div>
      <button type="submit"> Save </button>
    </form>
  </div>
  
</body>
</html>

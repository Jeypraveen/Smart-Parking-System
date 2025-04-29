<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <style type="text/css">
      <%@ include file="/views/css/menu_style.css"%>
      body {
         background-image: url("/views/images/f11.jpg");
         background-size: 100% 100vh;
         background-repeat: no-repeat;
         margin: 0;
         padding: 0;
      }
   </style>
   <meta charset="utf-8">
   <title>Menu</title>
   <link rel="stylesheet" href="/views/css/menu_style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<nav>
   <div class="logo">
      Smart Parking System
   </div>
   <label for="click" class="menu-btn">
      <i class="fas fa-bars"></i>
   </label>
   <ul>
      <li><a class="active" href="/User_Home">Home</a></li>
      <li><a href="/bookParking">Book Parking</a></li>
      <li><a href="/yourBooking">Your Booking</a></li>
      <li><a href="/">Logout</a></li>
   </ul>
</nav>
<div class="content">
</div>
<div>${PrintSwal}</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <style type="text/css">
      <%@ include file="/views/css/menu_style.css"%>

      table {
         border-collapse: collapse;
         width: 100%;
      }

      th, td {
         border: 2px solid black;
         padding: 20px;
      }

      th {
         background-color: #f0f0f0;
      }
   </style>
   <meta charset="utf-8">
   <title>Responsive Navigation Menu</title>
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
      <li><a href="/User_Home">Home</a></li>
      <li><a href="/bookParking">Book Parking</a></li>
      <li><a class="active" href="/yourBooking">Your Booking</a></li>
      <li><a href="/">Logout</a></li>
   </ul>
</nav>
<div class="content">
   <br></br><br></br><br></br>
   <h2 style="font-size: 18px;">Important Notice: We do not allow cancellations of bookings.</h2>
   <table>
      <tr>
         <th>Parking id </th>
         <th>Vehicle No </th>
         <th>Parking Date </th>
         <th>Start Time </th>
         <th>End Time </th>
         <th>Slot Name </th>
         <th>Parking Cost </th>
      </tr>
      <div>${Out}</div>
   </table>
</div>
<div>${PrintSwal}</div>
</body>
</html>
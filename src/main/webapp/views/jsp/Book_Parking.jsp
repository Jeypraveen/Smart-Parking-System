<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        body {
            background-image: url("/views/images/f1.jpg");
            background-size: 100% 100vh;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        form {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 500px;
            margin: -250px auto;
            background-color: #f5f5f5;
            padding: 20px;
            border: 1px solid black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            font-size: 24px;
        }
        input {
            width: 200px;
            padding: 10px;
            border: 1px solid black;
        }
        label {
            font-size: 16px;
        }
        select {
            width: 200px;
            padding: 10px;
            border: 1px solid black;
        }
        input[type="submit"] {
            background-color: #100808;
            color: #ffffff;
            padding: 10px;
            border: none;
        }
        .vehicle-number {
            margin-bottom: 10px;
        }
        .select-date {
            margin-bottom: 10px;
        }
        .parking-time {
            margin-bottom: 10px;
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
        <li><a class="active" href="/bookParking">Book Parking</a></li>
        <li><a href="/yourBooking">Your Booking</a></li>
        <li><a href="/">Logout</a></li>
    </ul>
</nav>
<div class="content">
    <form action="/book-parking-slot" method="post">
        <h1>Book Parking Slot</h1><br><br>
        <label for="park_id">Parking Id</label>
        &ensp; &emsp; &emsp;&ensp; &emsp; &emsp; &ensp;
        <input type="text" id="park_id" name="park_id1" value="${Park_id}" disabled><br></br>
        <label for="vehicle_number">Vehicle Number</label>
        &ensp; &emsp; &emsp; &ensp;
        <input type="text" id="vehicle_number" value="KP-12-1234" name="vehicle_number" placeholder="Enter vehicle number"><br></br>
        <label for="select_date">Select Date</label>
        &ensp; &ensp; &emsp; &emsp;&emsp; &ensp;
        <input type="date" id="select_date" name="start_date" value="2023-09-06"><br></br>
        <label for="park_cost">Parking Cost Per Hours</label>
        &ensp;
        <input type="text" id="park_cost" name="park_cost1" value="${Park_cost}" disabled><br></br>

        <label for="parking_time">Parking Time </label>

        &emsp; &emsp; &ensp;
        <select id="parking_time" name="parking_end_time"><br></br>
            <option value="1" selected>1 Hours</option>
            <option value="2">2 Hours</option>
            <option value="3">3 Hours</option>
            <option value="4">4 Hours</option>
            <option value="5">5 Hours</option>
            <option value="6">6 Hours</option>
            <option value="7">7 Hours</option>
            <option value="8">8 Hours</option>
            <option value="9">9 Hours</option>
            <option value="10">10 Hours</option>
            <option value="11">11 Hours</option>
            <option value="12">12 Hours</option>
            <option value="13">13 Hours</option>
            <option value="14">14 Hours</option>
            <option value="15">15 Hours</option>
            <option value="16">16 Hours</option>
            <option value="17">17 Hours</option>
            <option value="18">18 Hours</option>
            <option value="19">19 Hours</option>
            <option value="20">20 Hours</option>
            <option value="21">21 Hours</option>
            <option value="22">22 Hours</option>
            <option value="23">23 Hours</option>
            <option value="24">24 Hours</option>
        </select><br>
        <div>${Out}</div><br>
        <input type="submit" value="Book Slot">
    </form>
</div>
<div>${PrintSwal}</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    html, body {
      display: grid;
      height: 100vh;
      width: 100%;
      place-items: center;
      background-image: url("/views/images/f5.jpg");
      background-position: center;
      background-size: cover;
    }
    ::selection {
      background: #ff80bf;
    }
    .container {
      max-width: 400px;
      width: 100%;
      padding: 25px 30px;
      border-radius: 20px;
      box-shadow: 0 10px 80px rgba(0, 0, 0, 0.3);
      text-align: center;
      background-color: #ffffff; /* Added background color */
    }
    .container .title {
      font-size: 35px;
      font-weight: 600;
      margin: 20px 0 10px 0;
      position: relative;
      color: #000000;
    }
    .container .title:before {
      content: '';
      position: absolute;
      height: 4px;
      width: 50px;
      left: 50%;
      bottom: -10px;
      border-radius: 5px;
      background: black;
      transform: translateX(-50%);
    }
    .container .input-box {
      width: 100%;
      margin-top: 25px;
      position: relative;
    }
    .container .input-box input {
      width: 100%;
      height: 50px;
      font-size: 18px;
      border: 2px solid #ccc;
      border-radius: 8px;
      padding: 10px;
      box-sizing: border-box;
      outline: none;
    }
    .container .input-box input:focus {
      border-color: #8f8d8d;
    }
    .container .button {
      margin-top: 30px;
    }
    .container .button input[type="button"] {
      border: none;
      font-size: 18px;
      padding: 15px 20px;
      border-radius: 30px;
      cursor: pointer;
      font-weight: 500;
      text-align: center;
      background: linear-gradient(135deg, #474749, #161918);
      transition: background 0.4s ease;
      width: 100%;
      max-width: 300px;
      margin: auto;
      display: block;
      color: #fff;
    }
    .container .button input[type="button"]:hover {
      background: linear-gradient(135deg, #161918, #474749);
    }
    .container .option {
      font-size: 15px;
      color: #fff;
    }
  </style>
</head>
<body>
<div class="container">
  <form action="/VerifyLogin" id="form1" method="post">
    <div class="title">Login</div>
    <div class="input-box">
      <input type="text" name="email" id="email" placeholder="Enter Your Email" required>
    </div>
    <div class="input-box">
      <input type="password" name="password" id="password" placeholder="Enter Your Password" required>
    </div>
    <div class="button">
      <input type="button" value="Continue" onclick="Verify()">
    </div>
  </form>
</div>
<div>${PrintSwal}</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<script>
  function Verify() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    if (email === "" || password === "") {
      Swal.fire("Please fill out this field");
      return false;
    } else {
      var form = document.getElementById("form1");
      form.submit();
      form.reset();
    }
  }
</script>
</body>
</html>

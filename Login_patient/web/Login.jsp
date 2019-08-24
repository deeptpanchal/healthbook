<%-- 
    Document   : Login
    Created on : Apr 4, 2018, 4:07:21 PM
    Author     : deept
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <style>
  body {
   background-image: url("https://auth.mygov.in/sites/all/themes/mygovauth/images/bg.png");
   background-color: #cccccc;
    }
    a
    {
        color: #003399;
        text-decoration: none;
    }
    header
    {
      background-color: #003399;
      height: 70px;
    }
    input[type=text], select {
    width: 300px;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 300px;
    background-color: #003399;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #0066cc;
}

div {
    border-radius: 5px;
    padding: 20px;
}
  </style>
</head>
<body> 
    <header >
        <center>
            <font face="vardana" color="white" size="50px">Login For Patient</font>
        </center>
    </header>
    <center>
      <div>
     <form action="login_patient_servlet">
        <input type="text" name="aadhaarnumber" placeholder="Aadhaar Number" required=""><br>
        <input type="text" name="password" placeholder="Password" required=""> <br> 
        <a href="http://localhost:8080/Login_patient/createforgotpassword.jsp">create password / Forgot your password?</a>
        <br>
        <input type="submit" value="submit">
    </form>
    <hr width="300px" color="#0066cc">
    <form action="login_patient_servlet" method="post">
        <input type="text" name="aadhaarnumber" placeholder="Aadhaar Number" required=""><br>
        <input type="text" name="otp" placeholder="OTP" required=""><br>
        <input type="submit" value="Login with OTP">
    </form>
    </div>
    </center>
    
</body>
</html>

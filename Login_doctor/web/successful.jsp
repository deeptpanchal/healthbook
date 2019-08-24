<%-- 
    Document   : successful
    Created on : Jun 2, 2018, 11:48:53 AM
    Author     : deept
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="b.css">
        <style>
            
            p{
                border-style: solid;
                border-radius: 5px;
            }
            .button {
                border-radius: 4px;
                background-color: green;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 28px;
                padding: 20px;
                width: 200px;
                transition: all 0.5s;
                cursor: pointer;
                margin: 5px;
            }

            .button span {
                cursor: pointer;
                display: inline-block;
                position: relative;
                transition: 0.5s;
            }

            .button span:after {
                content: '\00bb';
                position: absolute;
                opacity: 0;
                top: 0;
                right: -20px;
                transition: 0.5s;
            }

            .button:hover span {
                padding-right: 25px;
            }

            .button:hover span:after {
                opacity: 1;
                right: 0;
            }
        </style>
    </head>
    <body>
        <br>
        <br><br><br>
        <p>
    <center>
        <font color="red" size="10px">
        Health Details is successfully submitted...
        <br>Thank you<br>       
        </font>
        <div class="checkmark-circle">
            <div class="background"></div>
            <div class="checkmark draw"></div>
        </div>
        <br><br>
    </center>
</p>
</body>
</html>


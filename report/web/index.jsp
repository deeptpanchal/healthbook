<%-- 
    Document   : index
    Created on : Jun 4, 2018, 4:12:47 PM
    Author     : deept
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Report</title>
        <meta name="description" content="Demo for the tutorial: Styling and Customizing File Inputs the Smart Way" />
        <meta name="keywords" content="cutom file input, styling, label, cross-browser, accessible, input type file" />
        <meta name="author" content="Osvaldas Valutis for Codrops" />
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <style>
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 11px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 2px 2px;
                cursor: pointer;
            }
            .button3 {
                background-color: white; 
                color: black; 
                border: 2px solid #f44336;
                border-radius: 4px;
            }
            input[type=text] {
                width: 500px;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 2px solid red;
                border-radius: 4px;
            }
        </style>
        <script>
            var request;
            function sendInfo()
            {
                var v = document.vinform.aadhaarnumber.value;
                var url = "index1.jsp?aadhaarnumber=" + v;
                
                if (window.XMLHttpRequest) 
                {
                    request = new XMLHttpRequest();
                } 
                else if (window.ActiveXObject) 
                {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try 
                {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                } 
                catch (e) 
                {
                    alert("Unable to connect to server");
                }
            }
            function getInfo() 
            {
                if (request.readyState == 4) 
                {
                    var val = request.responseText;
                    document.getElementById('dp').innerHTML = val;
                }
            }

        </script> 
        
        <script>
            (function (e, t, n) 
            {
                var r = e.querySelectorAll("html")[0];
                r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2")
            })
            (document, window, 0);
        </script>
    </head>
    <body>     
    <center>       
        <div class="container">
            <form ENCTYPE="multipart/form-data" ACTION="uploadandstore.jsp" METHOD=POST name="vinform">
                <header class="codrops-header">
                    <div class="codrops-links">
                        <input type="text" id="aadhaar" name="aadhaarnumber" placeholder="Enter Aadhaar Number" required="" onkeyup="sendInfo()">           
                        <br>    
                        <span id="dp">
                            </span>
                    </div>
                </header>
                <div class="content">
                <div class="box">
                    <input type="file" name="file" id="file-5" class="inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple required/>               
                    <label for="file-5"><figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure> <span>Choose a file&hellip;</span></label>
                    <br>
                    <input type="submit" value="submit">
                </div>
            </div>
            </form>
        </div>
        <script src="js/custom-file-input.js"></script>
        <br><br>
    </center>
    
    
</body>
</html>

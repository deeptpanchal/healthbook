<%-- 
    Document   : Healthbook_doctor
    Created on : Apr 5, 2018, 9:12:17 AM
    Author     : deept
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){background-color: #f2f2f2;}

            #customers tr:hover {background-color: #ddd;}

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }

        </style>
    </head>
    <body>
        <%String MCI = request.getParameter("MCI");%>
    <center>
        <font face="vardana" color="#4CAF50" size="50px">Health bOOk</font><br>
        <font color="blue" size="5px"><a href="http://localhost:8080/homepage/index.html">log out</a></font>
    </center>
    
    <center>
        <form action="Healthbook_aadhaar.jsp" target="_blank">
            <input type="text" id="aadhaar" name="aadhaarnumber" placeholder="Enter Aadhaar Number" required="">
            <input type="hidden" name="MCI" value="<%=MCI%>">
            <button class="button button3">Submit</button>
        </form>           
        <br><br>
    </center>

    <table id="customers">
        <tr>
            <th>Id</th>
            <th>Date</th>
            <th>Aadhaar Number</th>
            <th>Name</th>
            <th>Sex</th>
            <th>Chief Complain</th>
            <th>Details</th>
        </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/healthbook","root","");
                    Statement st = con.createStatement();
                    ResultSet pr = st.executeQuery("select * from healthbook");
                    while (pr.next()) 
                    {
                        if(MCI.equals(pr.getString(3))==true)
                        {
                            out.println("<tr>");
                                out.println("<td>"+pr.getString(1)+"</td>");
                                out.println("<td>"+pr.getString(15)+"</td>");
                                out.println("<td>"+pr.getString(2)+"</td>");
                                
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/aadhaar","root","");
                                Statement st1 = conn.createStatement();
                                ResultSet pr1 = st1.executeQuery("select * from aadhaardetails");
                                while(pr1.next())
                                {
                                    if(pr1.getString(1).equals(pr.getString(2)))
                                    {
                                        out.println("<td>"+pr1.getString(4)+"</td>");
                                        out.println("<td>"+pr1.getString(5)+"</td>");
                                        break;
                                    }
                                }
                                out.println("<td>"+pr.getString(4)+"</td>");
                                out.println("<td><a href=http://localhost:8080/Login_doctor/Healthbook_details.jsp?id="+pr.getString(1)+" target=\"_blank\">details</a></td>");
                            out.println("</tr>");
                        }
                        
                    }
                } catch (Exception e) {

                }
            %>
    </table>

</body>
</html>

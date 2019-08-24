<%-- 
    Document   : Healthbook_details
    Created on : Apr 5, 2018, 9:16:28 AM
    Author     : deept
--%>

<%@page import="java.time.YearMonth"%>
<%@page import="java.time.temporal.ChronoField"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        input[type=text], select {
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 950px;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        div {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }
        table, tr, td 
        {
            border: 2px solid black;
            border-collapse: collapse;
        }
        tr, td 
        {
            padding: 7px;
        }
    </style>
    <body>
        <%
            String id = request.getParameter("id");
            String aadhaarnumber="";
            String MCI="";
            String CC="";
            String OD="";
            String PI="";
            String GE="";
            String SE="";
            String PD="";
            String M="";
            String S="";   
            String LSM="";  
            String PTL="";  
            String OSN="";  
            Date date; 
            
            String name="";
            int age=0;
            String sex="";
            String address="";
            String marrietal="";
            String religion="";
            String occupation="";
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthbook", "root", "");
                Statement st = con.createStatement();
                ResultSet pr = st.executeQuery("select * from healthbook");
                while (pr.next()) 
                {
                    if (id.equals(pr.getString(1))) 
                    {
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/aadhaar","root","");
                        Statement st1=conn.createStatement();
                        ResultSet pr1=st1.executeQuery("select * from aadhaardetails");
                        while(pr1.next())
                        {                
                            if(pr1.getString(1).equals(pr.getString(2))==true)
                            {
                                date=pr1.getDate(6);
                                int yyyy=1900+date.getYear();
                                int mm=date.getMonth();
                    
                                YearMonth YM = YearMonth.now();  
                                int YYYY = YM.get(ChronoField.YEAR); 
                                int MM = YM.get(ChronoField.MONTH_OF_YEAR);
                                if(MM>mm)
                                {
                                    age=YYYY-yyyy;
                                }
                                else
                                {
                                    age=YYYY-yyyy-1;
                                }
                                name=pr1.getString(4);
                                sex=pr1.getString(5);
                                address=pr1.getString(8);
                            }
                        }
                            CC=pr.getString(4);
                            OD=pr.getString(5);
                            PI=pr.getString(6);
                            GE=pr.getString(7);
                            SE=pr.getString(8);
                            PD=pr.getString(9);
                            M=pr.getString(10);
                            S=pr.getString(11);
                            LSM=pr.getString(12);
                            PTL=pr.getString(13);
                            OSN=pr.getString(14);
                            break;
                        
                    }
               } 
            }
            catch(Exception e) 
            {
                        
            }
        %>
        <div>
            <center>
                <center>
                    <font face="vardana" color="#4CAF50" size="50px">Health bOOk</font>
                </center><br>
                <form>

                    <table border="1" width="950">
                        <tr>
                            <td colspan="3">
                                Name :
                                <input type="text" name="name" size="100px" value="<%=name%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Age :
                                <input type="text" name="age" value="<%=age%>" disabled>
                            </td>
                            <td>
                                Sex :
                                <input type="text" name="sex" value="<%=sex%>" disabled>
                            </td>
                            <td>
                                Religion :
                                <input type="text" name="religion" value="<%=religion%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Occupation :
                                <input type="text" name="occupation" size="40px" value="<%=occupation%>" disabled>
                            </td>
                            <td>
                                Marital Status :
                                <input type="text" name="marrietal" value="<%=marrietal%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Address :
                                <input type="text" name="address" value="<%=address%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Chief Complain :
                                <input type="text" name="CC" value="<%=CC%>" disabled>
                            </td>
                            <td>
                                Origin Duration :
                                <input type="text" name="OD" value="<%=OD%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Progration of Illness :
                                <input type="text" name="PI" value="<%=PI%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                General Examination :
                                <input type="text" name="GE" value="<%=GE%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Systemic Examination :
                                <input type="text" name="SE" value="<%=SE%>" disabled>
                            </td> 				
                        </tr>
                        <tr>
                            <td colspan="3">
                                Provisonal Dignosis :
                                <input type="text" name="PD" value="<%=PD%>" disabled >
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Medical :
                                <input type="text" name="M" value="<%=M%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Surgical :
                                <input type="text" name="S" value="<%=S%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Life Style Modification :
                                <input type="text" name="LSM" value="<%=LSM%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Prepration of Transmission of Life :
                                <input type="text" name="PTL" value="<%=PTL%>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Other Special Notes :
                                <input type="text" name="OSN" value="<%=OSN%>" disabled>
                            </td>
                        </tr>
                    </table>
                </form>
            </center>   

        </div>

    </body>
</html>

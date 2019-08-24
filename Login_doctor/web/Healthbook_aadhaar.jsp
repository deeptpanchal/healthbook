<%-- 
    Document   : Healthbook_aadhaar
    Created on : Apr 5, 2018, 9:18:45 AM
    Author     : deept
--%>

<%@page import="java.time.temporal.ChronoField"%>
<%@page import="java.time.YearMonth"%>
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

<div>
    <%
        String aadhaarnumber=request.getParameter("aadhaarnumber");
        String MCI=request.getParameter("MCI");
        int age=0;
        String name="";
        String sex="";
        String address="";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/aadhaar","root","");
            Statement st=con.createStatement();
            ResultSet pr=st.executeQuery("select * from aadhaardetails");
            while(pr.next())
            {                
                if(aadhaarnumber.equals(pr.getString(1))==true)
                {
                    Date date=pr.getDate(6);
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
                    name=pr.getString(4);
                    sex=pr.getString(5);
                    address=pr.getString(8);
                }
            }
        }
        catch(Exception e)
        {
            
        }
    %>
 	<center>
 		<center>
            <font face="vardana" color="#4CAF50" size="50px">Health bOOk</font>
        </center><br>
        <form action="Healthbook_servlet">
            <input type="hidden" name="aadhaarnumber" value="<%=aadhaarnumber%>">
            <input type="hidden" name="MCI" value="<%=MCI%>">
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
 						<input type="text" name="age" size="10px" value="<%=age%>" disabled>
 					</td>
 					<td>
 						Sex :
 						<input type="text" name="sex" size="10px" value="<%=sex%>" disabled>
 					</td>
 					<td>
 						Religion :
 						<input type="text" name="religion" disabled>
 					</td>
 				</tr>
 				<tr>
 					<td colspan="2">
 						Occupation :
 						<input type="text" name="occupation" size="40px" disabled>
 					</td>
 					<td>
 						Marital Status :
 						<input type="text" name="marital" disabled>
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Address :
 						<input type="text" name="address" size="100px" value="<%=address%>" disabled>
 					</td>
 				</tr>
 				<tr>
 					<td colspan="2">
 						Chief Complain :
 						<input type="text" name="CC" size="60px">
 					</td>
 					<td>
 						Origin Duration :
 						<input type="text" name="OD">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Progression of Illness :
 						<input type="text" name="PI" size="100px">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						General Examination :
 						<input type="text" name="GE" size="100px">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Systemic Examination :
 						<input type="text" name="SE" size="100px">
 					</td> 				
 				</tr>
 				<tr>
 					<td colspan="3">
 						Provisional Dignosis :
 						<input type="text" name="PD" size="100px">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Medical :
 						<input type="text" name="M" size="100px">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Surgical :
 						<input type="text" name="S" size="100px">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Life Style Modification :
 						<input type="text" name="LSM" size="100px">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Preparation of Transmission of Life :
 						<input type="text" name="PTL" size="100px">
 					</td>
 				</tr>
 				<tr>
 					<td colspan="3">
 						Other Special Notes :
 						<input type="text" name="OSN" size="100px">
 					</td>
 				</tr>
 			</table>
 			<input type="submit" value="submit">
  		</form>
 	</center>   
 
</div>

</body>
</html>

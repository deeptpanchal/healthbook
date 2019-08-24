<%-- 
    Document   : index1.jsp
    Created on : Jun 4, 2018, 4:20:21 PM
    Author     : deept
--%>

    <%@ page import="java.sql.*"%>  
     <html>
<head>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
    <%  
    String aadhaarnumber=request.getParameter("aadhaarnumber");  
    if(aadhaarnumber==null || aadhaarnumber.trim().equals(""))
    {  
        out.print("Please enter aadhaarnumber");  
    }
    else
    {   
        
        try
        {  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthbook","root","");  
            
            PreparedStatement ps=con.prepareStatement("select * from healthbook where aadhaarnumber=?");  
            
            ps.setString(1,aadhaarnumber);  
            ResultSet rs=ps.executeQuery(); 
            %>
            <table>
            <tr>
                <th>ID</th>
                <th>Report</th>
                <th>Date</th>
            </tr>
            <%
            while(rs.next())
            {  
                out.println("<tr><th>"+rs.getString(1)+"</th><th>"+rs.getString(10)+"</th><th>"+rs.getString(15)+"</th></tr>");  
            }  
            con.close();  
        }
        catch(Exception e)
        {
            
        }  
    }  
    %>  
            </table>
        </body>
</html>
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class password extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
            String aadhaarnumber=request.getParameter("aadhaarnumber");
            String otp=request.getParameter("otp");
            String password=request.getParameter("password");
            String confirmpassword=request.getParameter("confirmpassword");
            if(otp.equals("160798") && password.equals(confirmpassword))
            {
                PreparedStatement pr=con.prepareStatement("update patient set password=? where aadhaarnumber=?");
                pr.setString(1,password);
                pr.setString(2,aadhaarnumber);
                pr.executeUpdate();
                RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
                rd.forward(request, response);
            }
            else
            {
                RequestDispatcher rd=request.getRequestDispatcher("/createforgotpassword.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception e)
        {
            
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       
    }
}

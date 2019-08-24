import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class login_patient_servlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out=response.getWriter();
        out.println("hello");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
            String aadhaarnumber=request.getParameter("aadhaarnumber");
            String password=request.getParameter("password");
            Statement st=con.createStatement();
            ResultSet pr=st.executeQuery("select * from patient");
            while(pr.next())
            {
                if(aadhaarnumber.equals(pr.getString(1)) && password.equals(pr.getString(2)))
                {
                    RequestDispatcher rd=request.getRequestDispatcher("/Healthbook.jsp");
                    rd.forward(request, response);
                }
            }
            RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
            rd.forward(request, response);
        }
        catch(Exception e)
        {
            
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out=response.getWriter();
        out.println("hello");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
            String aadhaarnumber=request.getParameter("aadhaarnumber");
            String otp=request.getParameter("otp");
            Statement st=con.createStatement();
            ResultSet pr=st.executeQuery("select * from patient");
            while(pr.next())
            {
                if(aadhaarnumber.equals(pr.getString(1)) && otp.equals("160798"))
                {
                    RequestDispatcher rd=request.getRequestDispatcher("/Healthbook.jsp");
                    rd.forward(request, response);
                }
            }
            RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
            rd.forward(request, response);
        }
        catch(Exception e)
        {
            
        }
    }
}

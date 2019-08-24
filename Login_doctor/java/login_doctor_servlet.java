import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class login_doctor_servlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
            String MCI=request.getParameter("MCI");
            String password=request.getParameter("password");
            PrintWriter out=response.getWriter();
            out.println(MCI);
            Statement st=con.createStatement();
            ResultSet pr=st.executeQuery("select * from doctor");
            while(pr.next())
            {
                if(MCI.equals(pr.getString(1)) && password.equals(pr.getString(2)))
                {
                    RequestDispatcher rd=request.getRequestDispatcher("/Healthbook_doctor.jsp?MCI="+pr.getString(1));
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
            String aadhaarnumber=request.getParameter("MCI");
            String otp=request.getParameter("otp");
            Statement st=con.createStatement();
            ResultSet pr=st.executeQuery("select * from doctor");
            while(pr.next())
            {
                if(aadhaarnumber.equals(pr.getString(1)) && otp.equals("160798"))
                {
                    RequestDispatcher rd=request.getRequestDispatcher("/Healthbook_doctor.jsp?MCI="+pr.getString(1));
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

import java.io.*;
import java.sql.*;
import java.time.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.time.YearMonth;
import java.time.temporal.ChronoField;
public class Healthbook_servlet extends HttpServlet 
{
    private int id; 
    @Override
    public void init() 
    {
        id = 2;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/Healthbook","root","");
            
            String aadhaarnumber=request.getParameter("aadhaarnumber");
            String MCI=request.getParameter("MCI");
            String CC=request.getParameter("CC");
            String OD=request.getParameter("OD");
            String PI=request.getParameter("PI");
            String GE=request.getParameter("GE");
            String SE=request.getParameter("SE");
            String PD=request.getParameter("PD");
            String M=request.getParameter("M");
            String S=request.getParameter("S");
            String LSM=request.getParameter("LSM");
            String PTL=request.getParameter("PTL");
            String OSN=request.getParameter("OSN");
             long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis);  
        System.out.println(date); 
            
            PrintWriter out=response.getWriter();      
//            out.println("hello");
//            out.println(id);
//            out.println(aadhaarnumber);
//            out.println(MCI);
//            out.println(CC);
//            out.println(OD);
//            out.println(PI);
//            out.println(GE);
//            out.println(SE);
//            out.println(PD);
//            out.println(M);
//            out.println(S);
//            out.println(LSM);
//            out.println(PTL);
//            out.println(OSN);
            
            PreparedStatement pr=con.prepareStatement("insert into healthbook values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pr.setInt(1,id);
            pr.setString(2,aadhaarnumber);
            pr.setString(3,MCI);
            pr.setString(4,CC);
            pr.setString(5,OD);
            pr.setString(6,PI);
            pr.setString(7,GE);
            pr.setString(8,SE);
            pr.setString(9,PD);
            pr.setString(10,M);
            pr.setString(11,S);
            pr.setString(12,LSM);
            pr.setString(13,PTL);
            pr.setString(14,OSN);
            pr.setDate(15,date);
            int i=pr.executeUpdate();   
         //   out.println(i);
            id++;
            RequestDispatcher rd=request.getRequestDispatcher("/successful.jsp");
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
        
    }
}

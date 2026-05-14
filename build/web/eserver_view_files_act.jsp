<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>
<%@page import="collaborative.Mail"%>
<%
    String filename = request.getParameter("filename");
    String email = request.getParameter("email");
    
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy.HH:mm:ss");
    
    SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
 
    try{
        
       
       
    Connection con=Dbconnection.getConnection();
    Random s = new Random();
    int otp = s.nextInt(10000 - 5000) +25000 ;
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from edgeserver_files where email= '"+email+"' and filename='"+filename+"'");
    if(rs.next())
    {

    PreparedStatement ps=con.prepareStatement("insert into cloud_files values(?,?,?,?,?,?)");

    ps.setString(1,rs.getString("filename"));
    ps.setString(2,email);
    ps.setString(3,rs.getString("data"));  
    ps.setString(4,rs.getString("cipher"));
    ps.setString(5,rs.getString("skey"));
    ps.setString(6,dt);
   
    ps.executeUpdate();
   
   
                   
    response.sendRedirect("eserver_view_files.jsp?m1=success");
    }
    else 
    {
    response.sendRedirect("eserver_view_files.jsp?m2=LoginFail");
    }
    }
    catch(Exception e)
    {
    response.sendRedirect("eserver_view_files.jsp?m3=LoginFail");
    }
%>
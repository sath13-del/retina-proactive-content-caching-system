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
     String md = request.getParameter("md");
    String mdemail = null;
     
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy.HH:mm:ss");
    
    SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
                        String skey = null;
			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
 
    try{
        
       
       
    Connection con=Dbconnection.getConnection();
    Random s = new Random();
    int otp = s.nextInt(10000 - 5000) +25000 ;
    
    
    PreparedStatement p=con.prepareStatement("select * from mobiledestination where username = '"+md+"'");
    ResultSet r=p.executeQuery();
    
    if(r.next()){
        
        mdemail = r.getString("email");
    }
    
        
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from cloud_files where email= '"+email+"' and filename='"+filename+"'");
    if(rs.next())
    {

    PreparedStatement ps=con.prepareStatement("insert into md_files values(?,?,?,?,?,?,?)");

    ps.setString(1,rs.getString("filename"));
    ps.setString(2,email);
    ps.setString(3,md);
    ps.setString(4,rs.getString("data"));  
    ps.setString(5,rs.getString("cipher"));
    ps.setString(6,rs.getString("skey"));
    ps.setString(7,dt);
   
    ps.executeUpdate();
    
    skey = rs.getString("skey");
   
        Mail m = new Mail();
        String msg ="User Name:"+md+"\nKey :"+skey;
        m.secretMail(msg,email,email);
                   
    response.sendRedirect("cloud_view_files.jsp?m1=success");
    }
    else 
    {
    response.sendRedirect("cloud_view_files.jsp?m2=LoginFail");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in emplogact"+e.getMessage());
    }
%>
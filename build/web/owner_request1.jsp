<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>
<%@page import="collaborative.Mail"%>
<%
    String filename = request.getParameter("filename");
    String ms = request.getParameter("ms");
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
    
    
    PreparedStatement p=con.prepareStatement("select * from mobiledestination where username = '"+md+"' ");
    ResultSet r=p.executeQuery();
    
    if(r.next()){
        
        mdemail = r.getString("email");
    }
    
        
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from cloud_files where email= '"+ms+"' and filename='"+filename+"'");
    if(rs.next())
    {

    PreparedStatement ps=con.prepareStatement("update request set status = 'sent' where ms = '"+ms+"' and md = '"+md+"' and filename = '"+filename+"' ");

    
   
    ps.executeUpdate();
    
    skey = rs.getString("skey");
   
        Mail m = new Mail();
        String msg ="User Name:"+md+"\nKey :"+skey;
        m.secretMail(msg,mdemail,mdemail);
                   
    response.sendRedirect("owner_request.jsp?m1=success");
    }
    else 
    {
    response.sendRedirect("owner_request.jsp?m2=LoginFail");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in emplogact"+e.getMessage());
    }
%>
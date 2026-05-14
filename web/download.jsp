<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>
<%@page import="collaborative.Mail"%>
<%

String filename = request.getParameter("filename");
String skey = request.getParameter("skey");
String email = request.getParameter("email");
String user = session.getAttribute("user").toString();
String data = null;
//String content = new decryption().decrypt(data, skey);

try{
    
    Connection con=Dbconnection.getConnection();
    
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from md_files where email= '"+email+"' and md='"+user+"' and filename = '"+filename+"' ");
    if(rs.next())
    {
            data = rs.getString("data");
            
            
    }
            response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
            out.write(data);
    
    PreparedStatement ps=con.prepareStatement("update md_files set ranker1 = '1' where email= '"+email+"' and md='"+user+"' and filename = '"+filename+"'");
    ps.executeUpdate();
    
    
    }
    catch(Exception e)
    {
    System.out.println("Error in emplogact"+e.getMessage());
    }

         


%>
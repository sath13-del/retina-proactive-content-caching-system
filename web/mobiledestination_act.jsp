<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>
<%@page import="collaborative.Mail"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    try{
       
    Connection con=Dbconnection.getConnection();
    Random s = new Random();
    int otp = s.nextInt(10000 - 5000) +25000 ;
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from mobiledestination where email= '"+username+"' and password='"+password+"'");
    if(rs.next())
    {

    String user = rs.getString("username");
    session.setAttribute("user",user);
    String email = rs.getString("email");
    session.setAttribute("email",email);
    
    
    response.sendRedirect("mobiledestination_home.jsp?m1=success");
    }
    else 
    {
    response.sendRedirect("mobiledestination.jsp?m2=LoginFail");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in emplogact"+e.getMessage());
    }
%>
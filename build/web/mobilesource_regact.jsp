<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>
    <%
    String username = request.getParameter("username");
    String password = request.getParameter("password"); 
    String email = request.getParameter("email");
 
    String gender = request.getParameter("gender"); 
    String address = request.getParameter("address");
    String mobile = request.getParameter("mobile");
    String image = request.getParameter("image");
    
    try{
   
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into mobilesource values(?,?,?,?,?,?,?,?)");

    ps.setString(1,username);
    ps.setString(2,password);
    ps.setString(3,email);
  
    ps.setString(4,gender);
    ps.setString(5,address);
    ps.setString(6,mobile);
    ps.setString(7,image);
      ps.setString(8,"status");
   
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("mobilesource.jsp?msg=Registered");
    }
    else{
    response.sendRedirect("mobilesource_reg.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>
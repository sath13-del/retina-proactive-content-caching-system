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
    PreparedStatement ps=con.prepareStatement("insert into mobiledestination values(?,?,?,?,?,?)");

    ps.setString(1,username);
    ps.setString(2,password);
    ps.setString(3,email);
  
    ps.setString(4,gender);
    ps.setString(5,address);
    ps.setString(6,mobile);
  
   
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("mobiledestination.jsp?m1=Registered");
    }
    else{
    response.sendRedirect("mobiledestination_reg.jsp?m2=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>
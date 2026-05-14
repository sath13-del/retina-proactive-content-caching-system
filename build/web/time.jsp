<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>

<html>
   <head>
      <title>Display Current Date &amp; Time</title>
   </head>
   
   <body>
      <center>
         <h1>Display Current Date &amp; Time</h1>
      </center>
      <%
         Date date = new Date();
         out.print( "<h2 align = \"center\">" +date.toString()+"</h2>");
         
         SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy.HH:mm:ss");
      %>
   </body>
</html>
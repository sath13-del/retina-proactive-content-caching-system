<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>
<%@page import="collaborative.Mail"%>
<%
    String filename = request.getParameter("filename");
    String md = request.getParameter("email");  // sender email
    String dtt = request.getParameter("dtt");   // date time
    String ms = session.getAttribute("user").toString();  // receiver username
    String stk = null;

    int i = 0;
    SimpleDateFormat sdfDate = new SimpleDateFormat("dd");
    SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

    Date now = new Date();

    String strDate = sdfDate.format(now);
    String strTime = sdfTime.format(now);
    String dt = strDate + "   " + strTime;

    // Get count from upload table for the specific filename
    Connection conCount = Dbconnection.getConnection();
    PreparedStatement pstCount = conCount.prepareStatement("select count from upload where filename=? and email=?");
    pstCount.setString(1, filename);
    pstCount.setString(2, md);
    ResultSet rsCount = pstCount.executeQuery();

    if(rsCount.next()){
        int fileCount = rsCount.getInt("count");

        if(fileCount < 2){
            stk = "cloud";
        } else {
            stk = "edge";
        }
    }

    rsCount.close();
    pstCount.close();
    conCount.close();

    try{
        Connection con = Dbconnection.getConnection();

        // Query for the specific file from edgeserver_files
        PreparedStatement pst = con.prepareStatement("select * from edgeserver_files where filename=? and email=?");
        pst.setString(1, filename);
        pst.setString(2, md);
        ResultSet rs = pst.executeQuery();

        if(rs.next()){
            PreparedStatement ps = con.prepareStatement("insert into request values(?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, i);
            ps.setString(2, rs.getString("filename"));
            ps.setString(3, md);  // sender email
            ps.setString(4, rs.getString("data"));
            ps.setString(5, rs.getString("cipher"));
            ps.setString(6, rs.getString("skey"));
            ps.setString(7, ms);  // receiver username
            ps.setString(8, strDate);
            ps.setString(9, "waiting");
            ps.setString(10, stk);
            ps.executeUpdate();

            response.sendRedirect("mobiledestination_request.jsp?m1=success");
        } else {
            response.sendRedirect("mobiledestination_request.jsp?m3=FileNotFound");
        }

        rs.close();
        pst.close();
        con.close();
    }
    catch(Exception e){
        out.println(e);
        // response.sendRedirect("mobiledestination_request.jsp?m3=Error");
    }
%>
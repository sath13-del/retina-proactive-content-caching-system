
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>

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
    ResultSet rs = st.executeQuery("select * from md_files where  filename = '"+filename+"' ");
    if(rs.next())
    {
            data = rs.getString("data");
            
            
    }
            response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
            out.write(data);

            // Increment count in upload table for popularity tracking
            PreparedStatement psCount = con.prepareStatement("select count from upload where filename=?");
            psCount.setString(1, filename);
            ResultSet rsCount = psCount.executeQuery();

            if(rsCount.next()){
                int currentCount = rsCount.getInt("count");
                int newCount = currentCount + 1;

                PreparedStatement psUpdateCount = con.prepareStatement("update upload set count=? where filename=?");
                psUpdateCount.setInt(1, newCount);
                psUpdateCount.setString(2, filename);
                psUpdateCount.executeUpdate();
                psUpdateCount.close();
            }

            rsCount.close();
            psCount.close();

    PreparedStatement ps=con.prepareStatement("update md_files set ranker1 = '1' where email= '"+email+"' and md='"+user+"' and filename = '"+filename+"'");
    ps.executeUpdate();
    
    
    }
    catch(Exception e)
    {
    System.out.println("Error in emplogact"+e.getMessage());
    }

         


%>
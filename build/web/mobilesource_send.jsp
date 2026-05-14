<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="collaborative.Dbconnection"%>
<%@ page session="true" %>
<%@page import="collaborative.Mail"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Send Data</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
    <%
if(request.getParameter("m1")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>File Sent Successfully!
           <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
       </div>
   </div>
   <!-- End Alert Messages -->
}  

<%}
if(request.getParameter("m3")!=null){%>

    <!-- Alert Messages -->
    <div class="container mt-3">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>Filename Already Exists!
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </div>
    <!-- End Alert Messages -->
}
<%
}
%>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-mobile-alt me-2"></i>
                Sender
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="mobilesource_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobilesource_upload.jsp">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="mobilesource_send.jsp">Send Data</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="hero-content">
                <h1><i class="fas fa-share-square me-3"></i>Send Data to SBS</h1>
                <p>View uploaded files and send them to Small Base Stations for efficient content distribution</p>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card fade-in">
                        <div class="card-header">
                            <h5><i class="fas fa-list me-2"></i>Uploaded Files & Send Options</h5>
                        </div>
                        <div class="card-body">
                            <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
                            <%@page import="java.text.SimpleDateFormat"%>
                            <%@page import="java.util.Random"%>
                            <%@page import="java.sql.*"%>
                            <%@page import="collaborative.Dbconnection"%>
                            <%@ page session="true" %>
                            <%@page import="collaborative.Mail"%>

                            <%
                            String user = session.getAttribute("email").toString();

                            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

                            SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                            SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

                            Date now = new Date();

                            String strDate = sdfDate.format(now);
                            String strTime = sdfTime.format(now);
                            String dt = strDate;
                            System.out.println(dt);

                            String k = dt.substring(0,2);

                            System.out.println(k);

                            try{
                            	Connection con = null;
                                con = Dbconnection.getConnection();
                                PreparedStatement pst=con.prepareStatement("select * from upload where dt >= "+k+" ");
                                ResultSet rs=pst.executeQuery();
                            %>

                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
         
        <tr>
        
���     <th>File Name</th>
        <th>Uploaded Date</th>
        <th>Owner</th>
        <th>Data</th>
        <th>Size</th>
        <th>Count</th>

                                             <th><i class="fas fa-paper-plane me-2"></i>Send</th>
                                         </tr>
                                     </thead>
                                     <tbody>
        
     
 ��� 
 </tr>

<%
       
	while(rs.next()){
            %><tr>
                <td><%=rs.getString("filename")%></td>
                <td><%=rs.getString("cdate")%></td>
                <td><%=rs.getString("email")%></td>
                <td><textarea><%=rs.getString("cipher")%></textarea></td>
                <td><%=rs.getInt("size")%></td>
                <td><%=rs.getInt("count")%></td>

       <td><a href="mobilesource_send_act.jsp?filename=<%=rs.getString("filename")%>&email=<%=rs.getString("email")%>" class="btn btn-primary btn-sm"><i class="fas fa-paper-plane me-1"></i>Send</a></td>


                                        </tr>
                                    <%  }
                                    %>
                                    </tbody>
                                </table>

<% }
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
        
        <br><br><br>
         <hr>    
        
            
    </div>
    <br>
    
    <div class="cl">&nbsp;</div>
  </div>
</div>
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Proactive Content Caching System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>
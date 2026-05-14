<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="collaborative.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - File Timeline</title>
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
if(request.getParameter("m2")!=null){%>

    <!-- Alert Messages -->
    <div class="container mt-3">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>Operation Failed!
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
                <i class="fas fa-server me-2"></i>
                SBS
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="eserver_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="eserver_view_files.jsp">View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="eserver_time.jsp">View Time</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="owner_request.jsp">View Request</a>
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
<%
String filename = request.getParameter("filename");
String email = request.getParameter("email");
%>
                <h1><i class="fas fa-clock me-3"></i>File Timeline Analysis</h1>
                <p>Processing timeline for file: <strong><%=filename%></strong></p>
                <div class="mt-4">
                    <a href="eserver_time.jsp" class="btn btn-light btn-lg">
                        <i class="fas fa-arrow-left me-2"></i>Back to Time View
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Timeline Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card">
                        <div class="card-header">
                            <h5><i class="fas fa-chart-line me-2"></i>File Processing Timeline</h5>
                        </div>
                        <div class="card-body">
<%
    String utime = null;
    String etime = null;
    String ctime = null;
    
    try {
        Connection con = Dbconnection.getConnection();
        
        // Get upload time
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from upload where email= '"+email+"' and filename='"+filename+"'");
        if(rs.next()) {
            utime = rs.getString("cdate");
        }
        
        // Get SBS time
        Statement st1 = con.createStatement();
        ResultSet rs1 = st1.executeQuery("select * from edgeserver_files where email= '"+email+"' and filename='"+filename+"'");
        if(rs1.next()) {
            etime = rs1.getString("tm");
        }
        
        // Get cloud time
        Statement st2 = con.createStatement();
        ResultSet rs2 = st2.executeQuery("select * from cloud_files where email= '"+email+"' and filename='"+filename+"'");
        if(rs2.next()) {
            ctime = rs2.getString("tm");
        }
        
    } catch(Exception e) {
        System.out.println(e);
    }
%>

                            <!-- Timeline Display -->
                            <div class="timeline">
                                <div class="row mb-4">
                                    <div class="col-12">
                                        <h6 class="text-muted mb-3">File Processing Stages</h6>
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-upload me-2 text-primary"></i>Upload Stage</strong>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card bg-light">
                                            <div class="card-body py-2">
                                                <%=utime != null ? utime : "No data available"%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-server me-2 text-success"></i>Edge Processing</strong>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card bg-light">
                                            <div class="card-body py-2">
                                                <%=etime != null ? etime : "No data available"%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row mb-4">
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-cloud me-2 text-info"></i>Cloud Storage</strong>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card bg-light">
                                            <div class="card-body py-2">
                                                <%=ctime != null ? ctime : "Pending or not transferred"%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Performance Metrics -->
                            <div class="row mt-4">
                                <div class="col-lg-6">
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <h6 class="card-title"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Performance Analysis</h6>
                                            <ul class="card-text">
                                                <li>Upload to Edge: <strong><%=utime != null ? "Completed" : "Pending"%></strong></li>
                                                <li>Edge Processing: <strong><%=etime != null ? "Completed" : "Pending"%></strong></li>
                                                <li>Cloud Transfer: <strong><%=ctime != null ? "Completed" : "Pending"%></strong></li>
                                                <li>Overall Status: <span class="badge bg-<%= (utime != null && etime != null) ? "success" : "warning" %>">
                                                    <%= (utime != null && etime != null) ? "Processed" : "In Progress" %>
                                                </span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <h6 class="card-title"><i class="fas fa-info-circle me-2 text-info"></i>Timeline Information</h6>
                                            <ul class="card-text">
                                                <li>This timeline shows the complete file processing pipeline</li>
                                                <li>Each stage represents a critical step in content delivery</li>
                                                <li>SBSs handle initial processing and caching</li>
                                                <li>Cloud storage provides long-term archival</li>
                                                <li>Timeline helps optimize system performance</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="row mt-4">
                                <div class="col-12 text-center">
                                    <a href="eserver_time.jsp" class="btn btn-primary me-3">
                                        <i class="fas fa-clock me-2"></i>View All Timelines
                                    </a>
                                    <a href="eserver_view_files.jsp" class="btn btn-success me-3">
                                        <i class="fas fa-file me-2"></i>Manage Files
                                    </a>
                                    <a href="eserver_home.jsp" class="btn btn-info">
                                        <i class="fas fa-home me-2"></i>Dashboard
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>SBS (SBS)</h5>
                    <p>Distributed edge computing for reduced latency and improved content delivery performance.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p>&copy; 2024 All Rights Reserved<br>
                    User Preferences-Based Proactive Content Caching<br>
                    With Characteristics Differentiation in HetNets</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>
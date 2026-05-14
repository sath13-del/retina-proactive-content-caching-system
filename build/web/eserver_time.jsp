<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="collaborative.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - SBS View Time</title>
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
                <h1><i class="fas fa-clock me-3"></i>SBS Time Management</h1>
                <p>Monitor file processing times and performance metrics across edge infrastructure</p>
                <div class="mt-4">
                    <a href="eserver_view_files.jsp" class="btn btn-light btn-lg me-3">
                        <i class="fas fa-file me-2"></i>Manage Files
                    </a>
                    <a href="owner_request.jsp" class="btn btn-outline-light btn-lg">
                        <i class="fas fa-tasks me-2"></i>View Requests
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Time Management Content -->
    <div class="main-content">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5><i class="fas fa-chart-line me-2"></i>File Processing Timeline</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th><i class="fas fa-file me-2"></i>File Name</th>
                                            <th><i class="fas fa-calendar me-2"></i>Upload Time</th>
                                            <th><i class="fas fa-user me-2"></i>Owner</th>
                                            <th><i class="fas fa-database me-2"></i>Encrypted Data</th>
                                            <th><i class="fas fa-eye me-2"></i>View Time</th>
                                        </tr>
                                    </thead>
                                    <tbody>
    <% 
        try{ 
            Connection con = null;
            con = Dbconnection.getConnection();
            PreparedStatement pst=con.prepareStatement("select * from edgeserver_files");
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                %>
                <tr>
                    <td><strong><%=rs.getString("filename")%></strong></td>
                    <td><%=rs.getString("tm")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td>
                        <button class="btn btn-sm btn-outline-info" type="button" data-bs-toggle="collapse" data-bs-target="#cipher_<%=rs.getString("filename")%>">
                            <i class="fas fa-eye me-1"></i>View Data
                        </button>
                        <div class="collapse mt-2" id="cipher_<%=rs.getString("filename")%>">
                            <div class="card card-body">
                                <small><%=rs.getString("cipher")%></small>
                            </div>
                        </div>
                    </td>
                    <td>
                        <a href="eserver_time_act.jsp?filename=<%=rs.getString("filename")%>&email=<%=rs.getString("email")%>" 
                           class="btn btn-primary btn-sm">
                            <i class="fas fa-clock me-1"></i>View Timeline
                        </a>
                    </td>
                </tr>
              <%  
            }
            
        } catch(Exception e) {
            System.out.println(e);
        }
    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Performance Information -->
            <div class="row mt-4">
                <div class="col-lg-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Performance Metrics</h5>
                            <ul class="card-text">
                                <li><strong>Processing Speed:</strong> Real-time file encryption and caching</li>
                                <li><strong>Response Time:</strong> Sub-millisecond latency for cached content</li>
                                <li><strong>Throughput:</strong> High-volume data processing capabilities</li>
                                <li><strong>Availability:</strong> 24/7 SBS operations</li>
                                <li><strong>Scalability:</strong> Dynamic resource allocation based on demand</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-info-circle me-2 text-info"></i>Time Tracking Features</h5>
                            <ul class="card-text">
                                <li>Monitor upload, processing, and delivery times</li>
                                <li>Track SBS response times</li>
                                <li>Analyze performance bottlenecks</li>
                                <li>Optimize caching strategies based on timing data</li>
                                <li>Generate performance reports for system administrators</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="row mt-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-file-alt fa-3x text-success"></i>
                            </div>
                            <h5 class="card-title">File Management</h5>
                            <p class="card-text">Manage files stored at the SBS with security controls.</p>
                            <a href="eserver_view_files.jsp" class="btn btn-success">Manage Files</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-tasks fa-3x text-warning"></i>
                            </div>
                            <h5 class="card-title">Request Handling</h5>
                            <p class="card-text">Process file access requests from Receivers.</p>
                            <a href="owner_request.jsp" class="btn btn-warning">View Requests</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-home fa-3x text-info"></i>
                            </div>
                            <h5 class="card-title">Dashboard</h5>
                            <p class="card-text">Return to the main SBS dashboard.</p>
                            <a href="eserver_home.jsp" class="btn btn-info">Home</a>
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
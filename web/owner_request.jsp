<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="collaborative.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Request Management</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("m1")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>Request Processed Successfully!
           <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
       </div>
   </div>
   <!-- End Alert Messages -->
}  

<%}
if(request.getParameter("m3")!=null){%>

    <!-- Alert Messages -->
    <div class="container mt-3">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
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
                        <a class="nav-link" href="eserver_time.jsp">View Time</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="owner_request.jsp">View Request</a>
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
                <h1><i class="fas fa-tasks me-3"></i>Request Management</h1>
                <p>Handle file access requests from Receivers efficiently</p>
                <div class="mt-4">
                    <a href="eserver_view_files.jsp" class="btn btn-light btn-lg me-3">
                        <i class="fas fa-file me-2"></i>Manage Files
                    </a>
                    <a href="eserver_time.jsp" class="btn btn-outline-light btn-lg">
                        <i class="fas fa-clock me-2"></i>View Timing
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Request Management Content -->
    <div class="main-content">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5><i class="fas fa-inbox me-2"></i>Pending File Requests</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th><i class="fas fa-file me-2"></i>File Name</th>
                                            <th><i class="fas fa-mobile-alt me-2"></i>Sender</th>
                                            <th><i class="fas fa-download me-2"></i>Receiver</th>
                                            <th><i class="fas fa-cogs me-2"></i>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
    <% 
        try{ 
            Connection con = null;
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy.HH:mm:ss");
            SimpleDateFormat sdfDate = new SimpleDateFormat("dd");
            SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
            Date now = new Date();
            String strDate = sdfDate.format(now);
            String strTime = sdfTime.format(now);
            String dt = strDate + "   " + strTime;
            
            con = Dbconnection.getConnection();
            PreparedStatement pst=con.prepareStatement("select * from request where stk = 'edge' and status='waiting' ");
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                %>
                <tr>
                    <td><strong><%=rs.getString("filename")%></strong></td>
                    <td><%=rs.getString("ms")%></td>
                    <td><%=rs.getString("md")%></td>
                    <td>
                        <a href="owner_request1.jsp?filename=<%=rs.getString("filename")%>&ms=<%=rs.getString("ms")%>&md=<%=rs.getString("md")%>" 
                           class="btn btn-success btn-sm">
                            <i class="fas fa-check me-1"></i>Process Request
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

            <!-- Request Management Features -->
            <div class="row mt-4">
                <div class="col-lg-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-shield-alt me-2 text-success"></i>Request Security</h5>
                            <ul class="card-text">
                                <li><strong>Authentication:</strong> All requests verified before processing</li>
                                <li><strong>Authorization:</strong> Access rights validated for each request</li>
                                <li><strong>Encryption:</strong> Secure file transfer protocols</li>
                                <li><strong>Audit Trail:</strong> Complete logging of all request activities</li>
                                <li><strong>Rate Limiting:</strong> Protection against request flooding</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-cogs me-2 text-primary"></i>Processing Workflow</h5>
                            <ul class="card-text">
                                <li>Receive file access requests from Receivers</li>
                                <li>Verify user permissions and file availability</li>
                                <li>Process requests in order of priority</li>
                                <li>Generate secure access tokens</li>
                                <li>Log all activities for compliance and monitoring</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Statistics Cards -->
            <div class="row mt-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-clock fa-3x text-warning"></i>
                            </div>
                            <h5 class="card-title">Pending Requests</h5>
                            <p class="card-text">Requests waiting for processing and approval.</p>
                            <a href="eserver_time.jsp" class="btn btn-warning">View Timing</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-file-alt fa-3x text-info"></i>
                            </div>
                            <h5 class="card-title">File Management</h5>
                            <p class="card-text">Manage files stored at the SBS.</p>
                            <a href="eserver_view_files.jsp" class="btn btn-info">Manage Files</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-home fa-3x text-success"></i>
                            </div>
                            <h5 class="card-title">Dashboard</h5>
                            <p class="card-text">Return to the main SBS dashboard.</p>
                            <a href="eserver_home.jsp" class="btn btn-success">Home</a>
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
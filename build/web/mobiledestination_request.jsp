<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="collaborative.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Receiver Request</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("m1")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>Request Sent Successfully!
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
                Receiver
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination_profile.jsp">View Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination_files.jsp">View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="mobiledestination_request.jsp">Send Request</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination_download.jsp">Download</a>
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
                <h1><i class="fas fa-share me-3"></i>Request Files</h1>
                <%
    String user = session.getAttribute("user").toString();
    %>
                <p>Request access to files from Senders with secure authentication</p>
                <div class="mt-4">
                    <a href="mobiledestination_files.jsp" class="btn btn-light btn-lg me-3">
                        <i class="fas fa-file me-2"></i>Browse Files
                    </a>
                    <a href="mobiledestination_download.jsp" class="btn btn-outline-light btn-lg">
                        <i class="fas fa-download me-2"></i>My Downloads
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Request Content -->
    <div class="main-content">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5><i class="fas fa-paper-plane me-2"></i>File Access Requests</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th><i class="fas fa-file me-2"></i>File Name</th>
                                            <th><i class="fas fa-calendar me-2"></i>Uploaded Date</th>
                                            <th><i class="fas fa-user me-2"></i>Owner</th>
                                            <th><i class="fas fa-key me-2"></i>Request Key</th>
                                        </tr>
                                    </thead>
                                    <tbody>
    <% 
        try{ 
            Connection con = null;
            con = Dbconnection.getConnection();
            PreparedStatement pst=con.prepareStatement("select * from upload");
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                %>
                <tr>
                    <td><strong><%=rs.getString("filename")%></strong></td>
                    <td><%=rs.getString("cdate")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td>
                        <a href="mobiledestination_request_act.jsp?filename=<%=rs.getString("filename")%>&email=<%=rs.getString("email")%>&dtt=<%=rs.getString("dt")%>" 
                           class="btn btn-primary btn-sm">
                            <i class="fas fa-key me-1"></i>Request Access
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

            <!-- Information Cards -->
            <div class="row mt-4">
                <div class="col-lg-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-info-circle me-2 text-info"></i>Request Process</h5>
                            <ol class="card-text">
                                <li>Browse available files in the table above</li>
                                <li>Click "Request Access" for desired files</li>
                                <li>System sends secure request to file owner</li>
                                <li>Wait for approval notification</li>
                                <li>Download approved files from Download section</li>
                            </ol>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-shield-alt me-2 text-success"></i>Security Features</h5>
                            <ul class="card-text">
                                <li><strong>Secure Authentication:</strong> All requests are authenticated</li>
                                <li><strong>Encrypted Communication:</strong> Data transmission is encrypted</li>
                                <li><strong>Access Control:</strong> Only approved requests get access</li>
                                <li><strong>Audit Trail:</strong> All requests are logged for security</li>
                                <li><strong>Owner Approval:</strong> File owners control access permissions</li>
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
                                <i class="fas fa-download fa-3x text-info"></i>
                            </div>
                            <h5 class="card-title">Download Center</h5>
                            <p class="card-text">Access your approved downloads and manage downloaded files.</p>
                            <a href="mobiledestination_download.jsp" class="btn btn-info">My Downloads</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-database fa-3x text-primary"></i>
                            </div>
                            <h5 class="card-title">Browse Files</h5>
                            <p class="card-text">Explore all available files from Senders in the system.</p>
                            <a href="mobiledestination_files.jsp" class="btn btn-primary">All Files</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-user-circle fa-3x text-warning"></i>
                            </div>
                            <h5 class="card-title">Profile</h5>
                            <p class="card-text">View your account details and manage your preferences.</p>
                            <a href="mobiledestination_profile.jsp" class="btn btn-warning">My Profile</a>
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
                    <h5>Receiver</h5>
                    <p>Revolutionizing content delivery through intelligent edge computing and popularity-based caching strategies.</p>
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
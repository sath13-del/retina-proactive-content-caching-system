<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Receiver Profile</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("m1")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>Login Successful!
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
            <i class="fas fa-exclamation-triangle me-2"></i>Login Failed!
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
                        <a class="nav-link active" href="mobiledestination_profile.jsp">View Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination_files.jsp">View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination_request.jsp">Send Request</a>
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
                <h1><i class="fas fa-user-circle me-3"></i>Receiver Profile</h1>
                <%
    String user = session.getAttribute("user").toString();
    %>
                <p>Welcome, <strong><%=user%></strong>! View your account details and settings</p>
                <div class="mt-4">
                    <a href="mobiledestination_files.jsp" class="btn btn-light btn-lg me-3">
                        <i class="fas fa-file me-2"></i>Browse Files
                    </a>
                    <a href="mobiledestination_request.jsp" class="btn btn-outline-light btn-lg">
                        <i class="fas fa-share me-2"></i>Send Request
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Profile Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="card">
                        <div class="card-header">
                            <h5><i class="fas fa-user me-2"></i>Profile Information</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="card-subtitle mb-2 text-muted">Account Details</h6>
                                    <p><strong>Username:</strong> <%=user%></p>
                                    <p><strong>Account Type:</strong> Receiver (Receiver)</p>
                                    <p><strong>Status:</strong> <span class="badge bg-success">Active</span></p>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="card-subtitle mb-2 text-muted">System Access</h6>
                                    <p><strong>Profile Access:</strong> <i class="fas fa-check text-success"></i> Enabled</p>
                                    <p><strong>File Access:</strong> <i class="fas fa-check text-success"></i> Enabled</p>
                                    <p><strong>Download Access:</strong> <i class="fas fa-check text-success"></i> Enabled</p>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <h6 class="card-subtitle mb-3 text-muted">Quick Actions</h6>
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <a href="mobiledestination_files.jsp" class="btn btn-primary w-100">
                                        <i class="fas fa-file me-2"></i>View Files
                                    </a>
                                </div>
                                <div class="col-md-4">
                                    <a href="mobiledestination_request.jsp" class="btn btn-success w-100">
                                        <i class="fas fa-share me-2"></i>Send Request
                                    </a>
                                </div>
                                <div class="col-md-4">
                                    <a href="mobiledestination_download.jsp" class="btn btn-info w-100">
                                        <i class="fas fa-download me-2"></i>Downloads
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
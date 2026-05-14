<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Receiver Home</title>
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
                        <a class="nav-link active" href="mobiledestination_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination_profile.jsp">View Profile</a>
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
                <h1><i class="fas fa-mobile-alt me-3"></i>Receiver Dashboard</h1>
                <%
    String user = session.getAttribute("user").toString();
    %>
                <p>Welcome, <strong><%=user%></strong>! Access your personalized content caching dashboard</p>
                <div class="mt-4">
                    <a href="mobiledestination_profile.jsp" class="btn btn-light btn-lg me-3">
                        <i class="fas fa-user me-2"></i>View Profile
                    </a>
                    <a href="mobiledestination_files.jsp" class="btn btn-outline-light btn-lg">
                        <i class="fas fa-file me-2"></i>Browse Files
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <div class="main-content">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="mb-4">Receiver Features</h2>
                    <p class="lead">Access and manage your content with intelligent caching technology</p>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-file-alt fa-3x text-primary"></i>
                            </div>
                            <h5 class="card-title">View Files</h5>
                            <p class="card-text">Browse and explore available files from Senders with detailed information.</p>
                            <a href="mobiledestination_files.jsp" class="btn btn-primary">Browse Files</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-share fa-3x text-success"></i>
                            </div>
                            <h5 class="card-title">Send Request</h5>
                            <p class="card-text">Request access to specific files from Senders with secure authentication.</p>
                            <a href="mobiledestination_request.jsp" class="btn btn-success">Send Request</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-download fa-3x text-info"></i>
                            </div>
                            <h5 class="card-title">Download Files</h5>
                            <p class="card-text">Download approved files directly from the SBSs or cloud storage.</p>
                            <a href="mobiledestination_download.jsp" class="btn btn-info">Download</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-user-circle fa-3x text-warning"></i>
                            </div>
                            <h5 class="card-title">Profile Management</h5>
                            <p class="card-text">View and manage your Receiver profile and account settings.</p>
                            <a href="mobiledestination_profile.jsp" class="btn btn-warning">View Profile</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-shield-alt fa-3x text-danger"></i>
                            </div>
                            <h5 class="card-title">Secure Access</h5>
                            <p class="card-text">All transactions are secured with advanced encryption and authentication protocols.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-mobile-alt fa-3x text-secondary"></i>
                            </div>
                            <h5 class="card-title">Mobile Optimized</h5>
                            <p class="card-text">Seamlessly designed for mobile devices with responsive interface and fast loading.</p>
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
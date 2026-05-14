<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Cloud Server Home</title>
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
                <i class="fas fa-cloud me-2"></i>
                Cloud Server
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="cloud_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cloud_view_files.jsp">View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cloud_view_req.jsp">View Requests</a>
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
                <h1><i class="fas fa-cloud me-3"></i>Welcome to Cloud Server</h1>
                <p>Main Base Station Cloud (MBS-Cloud) - Centralized content management and distribution</p>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card fade-in">
                        <div class="card-header">
                            <h5><i class="fas fa-tachometer-alt me-2"></i>Cloud Server Dashboard</h5>
                        </div>
                        <div class="card-body text-center">
                            <div class="mb-4">
                                <i class="fas fa-cloud text-primary" style="font-size: 4rem;"></i>
                            </div>
                            <h4 class="card-title">Main Base Station Cloud</h4>
                            <p class="card-text">Manage and distribute content from the centralized cloud infrastructure. Handle requests for less popular files and maintain the primary content repository.</p>

                            <div class="row mt-4">
                                <div class="col-md-4">
                                    <div class="text-center">
                                        <i class="fas fa-file-alt text-info mb-2" style="font-size: 2rem;"></i>
                                        <h6>View Files</h6>
                                        <a href="cloud_view_files.jsp" class="btn btn-outline-primary btn-sm">Access</a>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="text-center">
                                        <i class="fas fa-list text-success mb-2" style="font-size: 2rem;"></i>
                                        <h6>View Requests</h6>
                                        <a href="cloud_view_req.jsp" class="btn btn-outline-success btn-sm">Access</a>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="text-center">
                                        <i class="fas fa-server text-warning mb-2" style="font-size: 2rem;"></i>
                                        <h6>Cloud Status</h6>
                                        <span class="badge bg-success">Online</span>
                                    </div>
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
            <p>&copy; 2024 Proactive Content Caching System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>
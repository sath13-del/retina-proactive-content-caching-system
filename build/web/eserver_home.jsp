<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - SBS Home</title>
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
                <i class="fas fa-server me-2"></i>
                SBS
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="eserver_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="eserver_view_files.jsp">View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="eserver_time.jsp">View Time</a>
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
                <h1><i class="fas fa-server me-3"></i>SBS Dashboard</h1>
                <p>Small Base Station (SBS) Management Interface for Edge Computing Operations</p>
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

    <!-- Features Section -->
    <div class="main-content">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="mb-4">SBS Capabilities</h2>
                    <p class="lead">Manage distributed edge computing resources and content caching</p>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-file-alt fa-3x text-primary"></i>
                            </div>
                            <h5 class="card-title">File Management</h5>
                            <p class="card-text">View and manage files stored at the SBS with secure access control.</p>
                            <a href="eserver_view_files.jsp" class="btn btn-primary">Manage Files</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-clock fa-3x text-info"></i>
                            </div>
                            <h5 class="card-title">Time Tracking</h5>
                            <p class="card-text">Monitor file processing times and SBS performance metrics.</p>
                            <a href="eserver_time.jsp" class="btn btn-info">View Timing</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-exchange-alt fa-3x text-success"></i>
                            </div>
                            <h5 class="card-title">Data Transfer</h5>
                            <p class="card-text">Transfer data between SBSs and cloud infrastructure seamlessly.</p>
                            <a href="eserver_view_files.jsp" class="btn btn-success">Transfer Data</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-tasks fa-3x text-warning"></i>
                            </div>
                            <h5 class="card-title">Request Management</h5>
                            <p class="card-text">Handle file access requests from Receivers efficiently.</p>
                            <a href="owner_request.jsp" class="btn btn-warning">View Requests</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-shield-alt fa-3x text-danger"></i>
                            </div>
                            <h5 class="card-title">Security</h5>
                            <p class="card-text">Advanced encryption and secure authentication for all edge operations.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-tachometer-alt fa-3x text-secondary"></i>
                            </div>
                            <h5 class="card-title">Performance</h5>
                            <p class="card-text">Optimized caching algorithms for reduced latency and improved throughput.</p>
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
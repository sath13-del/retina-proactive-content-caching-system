<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Sender Upload</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("m1")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>Uploaded Successfully!
           <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
       </div>
   </div>
   <!-- End Alert Messages -->


<%}
if(request.getParameter("m2")!=null){%>

    <!-- Alert Messages -->
    <div class="container mt-3">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>Upload Failed!
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
                <i class="fas fa-network-wired me-2"></i>
                Proactive Content Caching
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
                        <a class="nav-link active" href="mobilesource_upload.jsp">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobilesource_send.jsp">Send Data</a>
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
                <h1><i class="fas fa-cloud-upload-alt me-3"></i>File Upload Center</h1>
                <p>Upload your content securely with intelligent caching and popularity-based distribution</p>
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
                            <h5><i class="fas fa-upload me-2"></i>Upload New File</h5>
                        </div>
                        <div class="card-body">
                            <form action="Upload" method="post">
                                <div class="mb-3">
                                    <label for="fname" class="form-label">File Name</label>
                                    <input type="text" class="form-control" id="fname" name="fname" required>
                                </div>
                                <div class="mb-4">
                                    <label for="data" class="form-label">Enter Data</label>
                                    <textarea class="form-control" id="data" name="data" rows="4" required></textarea>
                                </div>
                                <div class="text-center">
                                    <button type="submit" name="submit" class="btn btn-primary btn-lg">
                                        <i class="fas fa-cloud-upload-alt me-2"></i>Upload File
                                    </button>
                                </div>
                            </form>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Sender Home</title>
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
                Sender
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="mobilesource_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobilesource_upload.jsp">Upload</a>
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
                <h1><i class="fas fa-mobile-alt me-3"></i>Sender Dashboard</h1>
                <p>Welcome to your content management interface - upload and distribute data efficiently</p>
            </div>
        </div>
    </section>
<div id="main">
  <div class="shell">
    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card fade-in">
                        <div class="card-header">
                            <h5><i class="fas fa-user-circle me-2"></i>Welcome</h5>
                        </div>
                        <div class="card-body text-center">
                            <div class="mb-4">
                                <i class="fas fa-user text-primary" style="font-size: 4rem;"></i>
                            </div>
                            <%
                                String user = session.getAttribute("user").toString();
                            %>
                            <h3 class="card-title">Welcome, <%=user%>!</h3>
                            <p class="card-text">You are now logged in as a Sender user. You can upload files and send data to the network for distribution.</p>

                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="text-center">
                                        <i class="fas fa-upload text-success mb-2" style="font-size: 2rem;"></i>
                                        <h6>Upload Files</h6>
                                        <a href="mobilesource_upload.jsp" class="btn btn-outline-success btn-sm">Upload</a>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-center">
                                        <i class="fas fa-paper-plane text-info mb-2" style="font-size: 2rem;"></i>
                                        <h6>Send Data</h6>
                                        <a href="mobilesource_send.jsp" class="btn btn-outline-info btn-sm">Send</a>
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
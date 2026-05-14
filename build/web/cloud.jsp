<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Cloud Server Login</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("msg")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>Registration Successful!
           <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
       </div>
   </div>
   <!-- End Alert Messages -->
}  

<%}
if(request.getParameter("msg1")!=null){%>

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
                <i class="fas fa-network-wired me-2"></i>
                Proactive Content Caching
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobilesource.jsp">Sender</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="eserver.jsp">SBS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="cloud.jsp">Cloud Server</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mobiledestination.jsp">Receiver</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="hero-content">
                <h1><i class="fas fa-cloud me-3"></i>Cloud Server Login</h1>
                <p>Access the Main Base Station Cloud (MBS-Cloud) management interface for centralized operations</p>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="card fade-in">
                        <div class="card-header">
                            <h5><i class="fas fa-cloud me-2"></i>Cloud Server (MBS-Cloud) Login</h5>
                        </div>
                        <div class="card-body">
                            <form action="cloudact.jsp" method="post">
                                <div class="mb-3">
                                    <label for="username" class="form-label">
                                        <i class="fas fa-envelope me-2"></i>Email Address
                                    </label>
                                    <input type="email" class="form-control" id="username" name="username" required>
                                </div>
                                <div class="mb-4">
                                    <label for="password" class="form-label">
                                        <i class="fas fa-lock me-2"></i>Password
                                    </label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <div class="text-center">
                                    <button type="submit" name="submit" class="btn btn-primary btn-lg">
                                        <i class="fas fa-sign-in-alt me-2"></i>Login to Cloud Server
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
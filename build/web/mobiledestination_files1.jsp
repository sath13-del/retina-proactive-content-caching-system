<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="collaborative.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - File Download</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("msg")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>Download Successful!
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
            <i class="fas fa-exclamation-triangle me-2"></i>Download Failed!
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
                        <a class="nav-link active" href="mobiledestination_files.jsp">View Files</a>
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
                <h1><i class="fas fa-download me-3"></i>File Download</h1>
                <p>Enter security key to download the requested file</p>
                <div class="mt-4">
                    <a href="mobiledestination_files.jsp" class="btn btn-light btn-lg">
                        <i class="fas fa-arrow-left me-2"></i>Back to Files
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Download Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <h5><i class="fas fa-key me-2"></i>Security Authentication</h5>
                        </div>
                        <div class="card-body">
<%
String filename = request.getParameter("filename");
String email = request.getParameter("email");
%>
                            <form action="download.jsp" method="post">
                                <div class="mb-3">
                                    <label for="filename" class="form-label">
                                        <i class="fas fa-file me-2"></i>File Name
                                    </label>
                                    <input type="text" class="form-control" id="filename" name="filename" value="<%=filename%>" readonly>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="email" class="form-label">
                                        <i class="fas fa-user me-2"></i>Sender Name
                                    </label>
                                    <input type="text" class="form-control" id="email" name="email" value="<%=email%>" readonly>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="skey" class="form-label">
                                        <i class="fas fa-shield-alt me-2"></i>Security Key
                                    </label>
                                    <input type="text" class="form-control" id="skey" name="skey" required placeholder="Enter Security Key">
                                </div>
                                
                                <div class="text-center">
                                    <button type="submit" name="submit" class="btn btn-success btn-lg">
                                        <i class="fas fa-download me-2"></i>Download File
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Security Information -->
            <div class="row mt-4">
                <div class="col-lg-8 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-info-circle me-2 text-info"></i>Download Security</h5>
                            <ul class="card-text">
                                <li>Security key is provided by the file owner upon approval</li>
                                <li>Each download requires a unique security key</li>
                                <li>Downloads are encrypted and secure</li>
                                <li>File integrity is verified during download</li>
                                <li>Contact the owner if you need access assistance</li>
                            </ul>
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
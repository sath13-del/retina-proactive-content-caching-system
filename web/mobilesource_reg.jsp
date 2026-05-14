<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Sender Registration</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("mg")!=null){%>
    
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
if(request.getParameter("msg1")!=null){%>

 <script>alert('Owner Registration Failed..!')</script>
}
<%
}
%>
<%
if(request.getParameter("m3")!=null){%>
    
   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-warning alert-dismissible fade show" role="alert">
           <i class="fas fa-exclamation-triangle me-2"></i>Username Already Exists!
           <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
       </div>
   </div>
   <!-- End Alert Messages -->
}  

<%}
if(request.getParameter("")!=null){%>

    <!-- Alert Messages -->
    <div class="container mt-3">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>Registration Failed!
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
                        <a class="nav-link active" href="mobilesource.jsp">Sender</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="eserver.jsp">SBS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cloud.jsp">Cloud Server</a>
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
                <h1><i class="fas fa-user-plus me-3"></i>Sender Registration</h1>
                <p>Join our network as a content provider and start sharing data efficiently</p>
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
                            <h5><i class="fas fa-user-plus me-2"></i>Sender Registration</h5>
                        </div>
                        <div class="card-body">
                            <form name="myform" autocomplete="off" action="mobilesource_regact.jsp" method="post" onsubmit="return validateform()">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="username" class="form-label">
                                                <i class="fas fa-user me-2"></i>User Name
                                            </label>
                                            <input type="text" class="form-control" id="username" name="username" autocomplete="off" required placeholder="Enter username">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="password" class="form-label">
                                                <i class="fas fa-lock me-2"></i>Password
                                            </label>
                                            <input type="password" class="form-control" id="password" name="password" required placeholder="Enter password">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="email" class="form-label">
                                                <i class="fas fa-envelope me-2"></i>Email ID
                                            </label>
                                            <input type="email" class="form-control" id="email" name="email" autocomplete="off" required placeholder="Enter email">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="gender" class="form-label">
                                                <i class="fas fa-venus-mars me-2"></i>Gender
                                            </label>
                                            <select class="form-select" id="gender" name="gender" required>
                                                <option value="">--Select Gender--</option>
                                                <option value="MALE">Male</option>
                                                <option value="FEMALE">Female</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="mobile" class="form-label">
                                                <i class="fas fa-mobile-alt me-2"></i>Mobile Number
                                            </label>
                                            <input type="tel" class="form-control" id="mobile" name="mobile" required placeholder="Enter mobile number">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="image" class="form-label">
                                                <i class="fas fa-image me-2"></i>Face Image
                                            </label>
                                            <input type="file" class="form-control" id="image" name="image" required accept="image/*">
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">
                                        <i class="fas fa-map-marker-alt me-2"></i>Address
                                    </label>
                                    <textarea class="form-control" id="address" name="address" rows="3" required placeholder="Enter your address"></textarea>
                                </div>
                                <div class="text-center">
                                    <button type="submit" name="submit" class="btn btn-primary btn-lg">
                                        <i class="fas fa-user-plus me-2"></i>Register as Sender
                                    </button>
                                </div>
                            </form>
    </p>     
        
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
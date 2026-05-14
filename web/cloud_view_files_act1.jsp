<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="collaborative.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proactive Content Caching - Send File to Receiver</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
     <%
if(request.getParameter("msg")!=null){%>

   <!-- Alert Messages -->
   <div class="container mt-3">
       <div class="alert alert-success alert-dismissible fade show" role="alert">
           <i class="fas fa-check-circle me-2"></i>Sender Registration Success..!
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
            <i class="fas fa-exclamation-triangle me-2"></i>Login Failed..!
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
                        <a class="nav-link" href="cloud_home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="cloud_view_files.jsp">View Files</a>
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
                <h1><i class="fas fa-paper-plane me-3"></i>Send File to Receiver</h1>
                <p>Distribute files from cloud server to selected mobile destination receivers</p>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card fade-in">
                        <div class="card-header">
                            <h5><i class="fas fa-share me-2"></i>Send to Receiver</h5>
                        </div>
                        <div class="card-body">
<%
String filename = request.getParameter("filename");

String email = request.getParameter("email");

try{
	Connection con = null;
        con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from mobiledestination");
        ResultSet rs=pst.executeQuery();
%>
                            <form action="cloud_view_files_act.jsp" method="post">
                                <div class="mb-3">
                                    <label for="filename" class="form-label">Filename</label>
                                    <input type="text" class="form-control" id="filename" name="filename" value="<%=filename%>" readonly required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Sender Name</label>
                                    <input type="text" class="form-control" id="email" name="email" value="<%=email%>" readonly required>
                                </div>
                                <div class="mb-3">
                                    <label for="md" class="form-label">Select Receiver</label>
                                    <select name="md" class="form-select" required>
                                        <option value="">--Select--</option>
<%
while(rs.next()){
%>
                                        <option value="<%=rs.getString("username")%>"><%=rs.getString("username")%></option>
<%
}
%>
                                    </select>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" name="submit" class="btn btn-primary">
                                        <i class="fas fa-paper-plane me-2"></i>Send
                                    </button>
                                </div>
                            </form>
<%
}
catch(Exception e)
{
	System.out.println(e);
}
%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Axis Bank | Enterprise Dashboard</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f5f7;
    margin: 0;
    padding: 0;
}

/* Header */
.header {
    background-color: #A50034;
    color: #fff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 40px;
    font-weight: 600;
    font-size: 16px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.header .logo img {
    height: 40px;
}

/* User Dropdown */
.user-info {
    display: flex;
    align-items: center;
    gap: 10px;
}

.user-info img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #fff;
    cursor: pointer;
}

.dropdown-menu {
    min-width: 180px;
}

.dropdown-item:hover {
    background-color: #f8d7da;
}

/* Carousel */
.carousel-item img {
    border-radius: 10px;
    height: 400px;
    object-fit: cover;
    width: 100%;
}

/* Section Title */
.section-title {
    text-align: center;
    color: #A50034;
    margin-top: 60px;
    margin-bottom: 30px;
    font-weight: 700;
}

/* Cards */
.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.card-title {
    color: #A50034;
    font-weight: 600;
}

.btn-maroon {
    background-color: #A50034;
    color: #fff;
    border: none;
}

.btn-maroon:hover {
    background-color: #8B002D;
}

/* Card Images (Uniform Height) */
.card-img-top {
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
    width: 100%;
}

/* Footer */
footer {
    background-color: #A50034;
    color: #fff;
    text-align: center;
    padding: 15px 0;
    margin-top: 60px;
}

/* Responsive Carousel Height */
@media (max-width: 768px) {
    .carousel-item img {
        height: 250px;
    }
}
</style>
</head>
<body>

<%
HttpSession ses = request.getSession(false);
String username = (String) ses.getAttribute("username");
String profilePic = (String) ses.getAttribute("profilePic"); // Optional profile picture URL
if(profilePic == null) {
    profilePic = "https://i.pravatar.cc/150?img=3"; // Default placeholder
}

// Session flag to show SweetAlert only once
Boolean loginAlert = (Boolean) ses.getAttribute("loginAlert");
if (loginAlert == null) loginAlert = true;
%>

<!-- Header -->
<div class="header">
    <div class="logo">
        <img src="https://upload.wikimedia.org/wikipedia/commons/2/26/Axis_Bank_Logo.svg" alt="Axis Bank Logo">
    </div>

    <div class="user-info dropdown">
        <img src="<%= profilePic %>" alt="Profile" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
        <span id="userDropdownText" data-bs-toggle="dropdown" aria-expanded="false">
            <%= username != null ? username : "Guest" %>
        </span>

        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
            <li><a class="dropdown-item" href="profile.jsp?username=<%= username %>">👤 Profile</a></li>
            <li><a class="dropdown-item" href="changePassword.jsp?username=<%= username %>">🔒 Change Password</a></li>
            <li><a class="dropdown-item" href="settings.jsp?username=<%= username %>">⚙️ Settings</a></li>
            <li><hr class="dropdown-divider"></li>
            <li>
                <form action="login.jsp" method="post" style="margin:0;">
                    <button type="submit" class="dropdown-item">🚪 Logout</button>
                </form>
            </li>
        </ul>
    </div>
</div>

<!-- Carousel -->
<div id="enterpriseCarousel" class="carousel slide mt-4 container" data-bs-ride="carousel">
  <div class="carousel-inner rounded-4 shadow-lg">

    <div class="carousel-item active">
      <img src="https://images.unsplash.com/photo-1605902711622-cfb43c4437b5?auto=format&fit=crop&w=1400&q=80" class="d-block w-100" alt="Corporate Banking">
      <div class="carousel-caption d-none d-md-block">
        <h3>Enterprise Banking Solutions</h3>
        <p>Manage all your financial operations with efficiency and security. Streamline payments, track corporate cash flow, and generate detailed reports for your organization.</p>
      </div>
    </div>

    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1521790361543-f645cf042ec4?auto=format&fit=crop&w=1400&q=80" class="d-block w-100" alt="Business Loans">
      <div class="carousel-caption d-none d-md-block">
        <h3>Flexible Business Loans</h3>
        <p>Empower your enterprise with tailor-made loan solutions. Choose from short-term credit, long-term funding, and working capital loans with competitive interest rates designed for corporate growth.</p>
      </div>
    </div>

    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1556740749-887f6717d7e4?auto=format&fit=crop&w=1400&q=80" class="d-block w-100" alt="Digital Transactions">
      <div class="carousel-caption d-none d-md-block">
        <h3>Seamless Digital Transactions</h3>
        <p>Experience instant, secure transfers and payments worldwide. Automate bulk payments, integrate with ERP systems, and monitor transaction logs with advanced security features.</p>
      </div>
    </div>

  </div>

  <button class="carousel-control-prev" type="button" data-bs-target="#enterpriseCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#enterpriseCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<!-- Services Section -->
<h2 class="section-title">Our Banking Services</h2>
<div class="container">
  <div class="row g-4 justify-content-center">

    <!-- Deposit -->
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://png.pngtree.com/png-clipart/20250423/original/pngtree-secure-your-savings-with-smart-deposits-png-image_20778464.png" 
             class="card-img-top mb-3" alt="Deposit">
        <div class="card-body">
          <h5 class="card-title">💰 Corporate Deposits</h5>
          <p class="card-text">
            Securely grow your enterprise reserves with Axis Bank’s fixed and recurring deposits. 
            Our deposit plans offer flexible tenures, attractive interest rates, and instant access to statements and transaction history.
          </p>
          <a href="deposit?username=<%= username != null ? username : "Guest" %>" class="btn btn-maroon">Deposit Now</a>
        </div>
      </div>
    </div>

    <!-- Transfer -->
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://images.unsplash.com/photo-1556740758-90de374c12ad?auto=format&fit=crop&w=800&q=80" class="card-img-top mb-3" alt="Transfer">
        <div class="card-body">
          <h5 class="card-title">💸 Fund Transfer</h5>
          <p class="card-text">
            Instantly transfer funds between corporate accounts with real-time processing. 
            Bulk payments, scheduled transfers, and inter-bank remittances are secure and easy to manage from your dashboard.
          </p>
          <a href="withdraw?username=<%= username != null ? username : "Guest" %>" class="btn btn-maroon">Transfer</a>
        </div>
      </div>
    </div>

    <!-- Statement -->
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://images.unsplash.com/photo-1579621970795-87facc2f976d?auto=format&fit=crop&w=800&q=80" class="card-img-top mb-3" alt="Statement">
        <div class="card-body">
          <h5 class="card-title">📄 Account Statement</h5>
          <p class="card-text">
            View detailed transaction reports, statements, and audit summaries instantly. 
            Export your data to PDF or Excel, schedule automated reports, and monitor every corporate account activity in real-time.
          </p>
          <a href="statement?username=<%= username != null ? username : "Guest" %>" class="btn btn-maroon">View Statement</a>
        </div>
      </div>
    </div>

    <!-- Loan -->
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?auto=format&fit=crop&w=800&q=80" class="card-img-top mb-3" alt="Loan">
        <div class="card-body">
          <h5 class="card-title">🏢 Business Loan</h5>
          <p class="card-text">
            Expand your enterprise with Axis Bank’s custom loan plans for corporates. 
            Choose from term loans, working capital financing, and trade finance with competitive interest rates and flexible repayment options.
          </p>
          <a href="loan?username=<%= username != null ? username : "Guest" %>" class="btn btn-maroon">Apply Now</a>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- Footer -->
<footer>
  © 2025 Axis Bank | Enterprise Digital Banking
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- SweetAlert Greeting: fires only once after login -->
<%
if (username != null && loginAlert) {
%>
<script>
Swal.fire({
    icon: 'success',
    title: 'Welcome <%= username %>!',
    text: 'You are logged into Axis Bank Enterprise Dashboard.',
    confirmButtonColor: '#A50034'
});
</script>
<%
    ses.setAttribute("loginAlert", false);
}
%>

</body>
</html>

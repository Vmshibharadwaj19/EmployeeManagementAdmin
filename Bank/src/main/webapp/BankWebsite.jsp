<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Axis Bank Enterprise</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; scroll-behavior: smooth; background-color: #f4f5f7; }

/* Navbar */
.navbar { background-color: #A50034; }
.navbar .navbar-brand, .navbar .nav-link { color: #fff !important; }
.navbar .nav-link:hover { color: #FFD700 !important; }

/* Profile */
.profile-img { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }
.profile-name { color: #fff; margin-left: 10px; font-weight: 500; }

/* Carousel */
.carousel-item img { width: 100%; height: 500px; object-fit: cover; }

/* Section Titles */
.section-title { text-align: center; color: #A50034; margin-top: 60px; margin-bottom: 30px; font-weight: 700; }

/* Cards */
.card { border: none; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); transition: all 0.3s ease; }
.card:hover { transform: translateY(-6px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
.card-title { color: #A50034; font-weight: 600; }
.btn-maroon { background-color: #A50034; color: #fff; }
.btn-maroon:hover { background-color: #8B002D; }

/* Statistics */
.stat-card { text-align:center; padding:20px; border-radius:15px; background:#fff; box-shadow:0 4px 15px rgba(0,0,0,0.1); transition:0.3s; }
.stat-card:hover { transform: translateY(-5px); box-shadow:0 6px 20px rgba(0,0,0,0.15); }
.stat-value { font-size:2rem; color:#A50034; font-weight:bold; }
.stat-label { color:#333; font-weight:500; }

/* Footer  section */
footer { background-color: #A50034; color: #fff; text-align: center; padding: 30px 0; margin-top: 60px; }
</style>
</head>
<body>

<%
HttpSession ses = request.getSession(false);
String username = (String) ses.getAttribute("username");
String profileImg = "https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=80&q=80"; 
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
  <div class="container">
    <a class="navbar-brand" href="#">Axis Bank</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
        <li class="nav-item"><a class="nav-link" href="#schemes">Schemes</a></li>
        <li class="nav-item"><a class="nav-link" href="#loans">Loans</a></li>
        <li class="nav-item"><a class="nav-link" href="#stats">Statistics</a></li>
        <li class="nav-item"><a class="nav-link" href="#testimonials">Clients</a></li>
        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
      </ul>
      <div class="d-flex align-items-center">
      
        <a href="login.jsp" class="btn btn-outline-light ms-3">Login</a>
      </div>
    </div>
  </div>
</nav>

<!-- Hero Carousel -->
<section id="home" class="mt-3">
<div id="homeCarousel" class="carousel slide container" data-bs-ride="carousel">
  <div class="carousel-inner rounded-4 shadow-lg">
    <div class="carousel-item active">
      <img src="https://plus.unsplash.com/premium_photo-1677553955495-d63b9ddcb913?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169">
      <div class="carousel-caption d-none d-md-block">
        <h3>Enterprise Banking Solutions</h3>
        <p>Manage all your financial operations efficiently.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1681825984459-47ee999da245?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1332" alt="Digital Banking">
      <div class="carousel-caption d-none d-md-block">
        <h3>Digital Banking</h3>
        <p>Secure online transactions and fund transfers worldwide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1521790361543-f645cf042ec4?auto=format&fit=crop&w=1400&q=80" alt="Business Growth">
      <div class="carousel-caption d-none d-md-block">
        <h3>Business Growth</h3>
        <p>Financial tools to help your enterprise thrive.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#homeCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#homeCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
</section>

<!-- Services Section -->
<section id="services">
<h2 class="section-title">Our Services</h2>
<div class="container">
  <div class="row g-4 justify-content-center">
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://images.unsplash.com/photo-1605902711622-cfb43c4437b5?auto=format&fit=crop&w=800&q=80" class="card-img-top mb-3" alt="Deposit">
        <div class="card-body">
          <h5 class="card-title">💰 Corporate Deposits</h5>
          <p class="card-text">Grow your enterprise reserves securely.</p>
          <a href="deposit?username=<%= username %>" class="btn btn-maroon">Deposit Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://images.unsplash.com/photo-1672380135241-c024f7fbfa13?auto=format&fit=crop&w=800&q=80" class="card-img-top mb-3" alt="Transfer">
        <div class="card-body">
          <h5 class="card-title">💸 Fund Transfer</h5>
          <p class="card-text">Instantly transfer funds between accounts.</p>
          <a href="withdraw?username=<%= username %>" class="btn btn-maroon">Transfer</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://images.unsplash.com/photo-1556740758-90de374c12ad?auto=format&fit=crop&w=800&q=80" class="card-img-top mb-3" alt="Statement">
        <div class="card-body">
          <h5 class="card-title">📄 Account Statement</h5>
          <p class="card-text">View detailed transaction reports instantly.</p>
          <a href="statement?username=<%= username %>" class="btn btn-maroon">View Statement</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-center p-3">
        <img src="https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?auto=format&fit=crop&w=800&q=80" class="card-img-top mb-3" alt="Loan">
        <div class="card-body">
          <h5 class="card-title">🏢 Business Loan</h5>
          <p class="card-text">Custom loan plans for corporates to grow business.</p>
          <a href="loan?username=<%= username %>" class="btn btn-maroon">Apply Now</a>
        </div>
      </div>
    </div>
  </div>
</div>
</section>

<!-- Schemes Section -->
<section id="schemes">
<h2 class="section-title">Special Schemes</h2>
<div class="container text-center">
  <div class="row g-4 justify-content-center">
    <div class="col-md-4">
      <div class="card p-3">
        <h5 class="card-title">Startup Growth Scheme</h5>
        <p class="card-text">Over 500 startups funded with low interest loans.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card p-3">
        <h5 class="card-title">Premium Deposit Scheme</h5>
        <p class="card-text">₹2000 Crores deposited through premium schemes.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card p-3">
        <h5 class="card-title">Digital Banking Scheme</h5>
        <p class="card-text">Over 100,000 enterprise transactions processed daily.</p>
      </div>
    </div>
  </div>
</div>
</section>

<!-- Loans Section -->
<section id="loans">
<h2 class="section-title">Business Loans</h2>
<div class="container text-center">
<div class="row g-4 justify-content-center">
<div class="col-md-4">
  <div class="card p-3">
    <h5 class="card-title">SME Loan</h5>
    <p class="card-text">₹50 Crores sanctioned in last year for SMEs.</p>
  </div>
</div>
<div class="col-md-4">
  <div class="card p-3">
    <h5 class="card-title">Startup Loan</h5>
    <p class="card-text">500+ startups supported with zero processing fees.</p>
  </div>
</div>
<div class="col-md-4">
  <div class="card p-3">
    <h5 class="card-title">Expansion Loan</h5>
    <p class="card-text">Over ₹100 Crores sanctioned for business expansion.</p>
  </div>
</div>
</div>
</div>
</section>

<!-- Statistics Section -->
<section id="stats">
<h2 class="section-title">Bank Statistics</h2>
<div class="container">
  <div class="row g-4 justify-content-center">
    <div class="col-md-3 stat-card">
      <div class="stat-value">10,000+</div>
      <div class="stat-label">Corporate Clients</div>
    </div>
    <div class="col-md-3 stat-card">
      <div class="stat-value">₹5000 Cr</div>
      <div class="stat-label">Total Deposits</div>
    </div>
    <div class="col-md-3 stat-card">
      <div class="stat-value">150+</div>
      <div class="stat-label">Branch Offices</div>
    </div>
    <div class="col-md-3 stat-card">
      <div class="stat-value">24/7</div>
      <div class="stat-label">Online Services</div>
    </div>
  </div>
</div>
</section>

<!-- Testimonials / Clients -->
<section id="testimonials">
<h2 class="section-title">Our Clients</h2>
<div class="container text-center">
<div class="row g-4 justify-content-center">
<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1603570415138-23a1d0e9790b?auto=format&fit=crop&w=200&q=80" class="rounded-circle mb-2" alt="Client1">
<h6>ABC Enterprises</h6>
<p>“Axis Bank helped our business grow exponentially.”</p>
</div>
<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1595152772835-219674b2a8a5?auto=format&fit=crop&w=200&q=80" class="rounded-circle mb-2" alt="Client2">
<h6>XYZ Tech</h6>
<p>“Seamless transactions and excellent service.”</p>
</div>
<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=200&q=80" class="rounded-circle mb-2" alt="Client3">
<h6>LMN Industries</h6>
<p>“Highly professional and reliable banking partner.”</p>
</div>
</div>
</div>
</section>

<!-- Contact Section -->
<section id="contact">
<h2 class="section-title">Contact Us</h2>
<div class="container text-center mb-5">
<p>Email: enterprise@axisbank.com | Phone: +91-1800-419-5555</p>
<p>Address: Axis Bank Corporate Center, Mumbai, India</p>
</div>
</section>

<!-- Footer -->
<footer>
© 2025 Axis Bank | Enterprise Digital Banking
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- SweetAlert Greeting -->
<script>
<% if (username != null) { %>
Swal.fire({
    icon: 'success',
    title: 'Welcome <%= username %>!',
    text: 'You are logged into Axis Bank Enterprise Dashboard.',
    confirmButtonColor: '#A50034'
});
<% } %>
</script>

</body>
</html>

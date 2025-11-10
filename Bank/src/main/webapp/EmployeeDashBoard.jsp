<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Axis Bank | Employee Dashboard</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
/* --- Keep your previous CSS intact --- */
body { font-family: 'Segoe UI', 
Tahoma, Geneva, Verdana, sans-serif; 
background-color: #f8f9fa; margin: 0;
 }
.header { position: sticky;
 top: 0; z-index: 1030; 
 background-color: #A50034; 
 color: white; display: flex; justify-content: space-between; align-items: center; padding: 10px 30px; }
.header .logo img { height: 40px; }
.header .user-info { display: flex; align-items: center; gap: 10px; }
.header .user-info img { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 2px solid #fff; }
.header .logout-btn { background: none; border: none; color: white; font-size: 20px; cursor: pointer; }
.header .logout-btn:hover { color: #ffdddd; }
#sidebar { height: 100vh; position: fixed; top: 0; left: -220px; width: 220px; background-color: #343a40; color: white; transition: all 0.3s; padding-top: 70px; }
#sidebar.active { left: 0; }
#sidebar .nav-link { color: white; padding: 12px 20px; }
#sidebar .nav-link:hover { background-color: #495057; border-radius: 4px; }
#content { margin-left: 0; transition: all 0.3s; padding: 20px; }
#content.active { margin-left: 220px; }
.hamburger { font-size: 1.5rem; cursor: pointer; }
.kpi-card { border-radius: 12px; padding: 20px; color: #fff; transition: transform 0.3s; }
.kpi-card:hover { transform: translateY(-5px); }
.kpi-revenue {background-color:#A50034;} .kpi-users {background-color:#007bff;} .kpi-conversion {background-color:#28a745;} .kpi-orders {background-color:#ffc107;}
iframe { border: none; width: 100%; height: 600px; border-radius: 10px; }
</style>
</head>
<body>

<%
HttpSession ses = request.getSession(false);
String username = (String) ses.getAttribute("username");
String profilePic = (String) ses.getAttribute("profilePic");
Integer id=(Integer)ses.getAttribute("id");
if(profilePic == null) profilePic = "https://i.pravatar.cc/150?img=3";

// Session flag to show SweetAlert only once
Boolean loginAlert = (Boolean) ses.getAttribute("loginAlert");
if (loginAlert == null) loginAlert = true;
%>

<!-- Header -->
<div class="header">
    <div class="d-flex align-items-center">
        <span class="hamburger me-3"><i class="fas fa-bars"></i></span>
        <img src="https://upload.wikimedia.org/wikipedia/commons/2/26/Axis_Bank_Logo.svg" alt="Axis Bank">
    </div>
    <div class="user-info">
        <img src="<%= profilePic %>" alt="Profile">
        <span><%= username != null ? username : "Employee" %></span>
        <form action="login.jsp" method="post" style="display:inline;">
            <button type="submit" class="logout-btn" title="Logout">&#x1F511;</button>
        </form>
    </div>
</div>

<!-- Sidebar -->
<div id="sidebar">
    <nav class="nav flex-column">
        <a class="nav-link" href="#dashboardTab">Dashboard</a>
        <a class="nav-link" href="#customersTab">All Customers</a>
        <a class="nav-link" href="#accountsTab">Accounts</a>
        <a class="nav-link" href="#loansTab">Loans</a>
        <a class="nav-link" href="#depositsTab">Deposits</a>
        <a class="nav-link" href="#statementsTab">Statements</a>
        <a class="nav-link" href="#settingsTab">Settings</a>
    </nav>
</div>

<!-- Main Content -->
<div id="content">
    <ul class="nav nav-tabs mb-3" id="employeeTabs" role="tablist">
        <li class="nav-item" role="presentation"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#dashboardTab">Dashboard</button></li>
        <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#customersTab">All Customers</button></li>
        <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#accountsTab">Accounts</button></li>
        <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#loansTab">Loans</button></li>
        <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#depositsTab">Deposits</button></li>
        <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#statementsTab">Statements</button></li>
        <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#settingsTab">Settings</button></li>
    </ul>

    <div class="tab-content">
        <!-- Dashboard -->
        <div class="tab-pane fade show active" id="dashboardTab">
            <div class="row g-4 mb-4">
                <div class="col-md-3"><div class="kpi-card kpi-revenue text-center"><i class="fas fa-chart-line fa-2x"></i><h4 class="mt-2">Total Revenue</h4><p>$1,250,000</p></div></div>
                <div class="col-md-3"><div class="kpi-card kpi-users text-center"><i class="fas fa-users fa-2x"></i><h4 class="mt-2">New Users</h4><p>1,250</p></div></div>
                <div class="col-md-3"><div class="kpi-card kpi-conversion text-center"><i class="fas fa-percent fa-2x"></i><h4 class="mt-2">Conversion Rate</h4><p>8.7%</p></div></div>
                <div class="col-md-3"><div class="kpi-card kpi-orders text-center"><i class="fas fa-receipt fa-2x"></i><h4 class="mt-2">Orders</h4><p>320</p></div></div>
            </div>
            <div class="card mb-4 p-3"><canvas id="performanceChart" height="100"></canvas></div>
            <div class="card p-3">
                <h5>Recent Tickets</h5>
                <table class="table table-striped table-hover">
                    <thead><tr><th>Cust ID</th><th>Customer</th><th>Transaction</th><th>Status</th><th>Date</th></tr></thead>
                    <tbody>
                        <tr><td>ORD101</td><td>John Doe</td><td>$1,250</td><td>Completed</td><td>2025-11-09</td></tr>
                        <tr><td>ORD102</td><td>Jane Smith</td><td>$980</td><td>Pending</td><td>2025-11-08</td></tr>
                        <tr><td>ORD103</td><td>Robert Brown</td><td>$2,500</td><td>Completed</td><td>2025-11-07</td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- All Customers: Dynamic via servlet -->
        <div class="tab-pane fade" id="customersTab">
            <iframe src="CustomerServlet"></iframe>
        </div>
        <div class="tab-pane fade" id="accountsTab">
            <iframe src="AccountServlet"></iframe>
        </div>

        <!-- Accounts -->
        <!-- Loans -->
        <div class="tab-pane fade" id="loansTab"><p>Loan management content goes here.</p></div>
        <!-- Deposits -->
        <div class="tab-pane fade" id="depositsTab"><p>Deposits management content goes here.</p></div>
        <!-- Statements -->
        <div class="tab-pane fade" id="statementsTab"><p>Statements content goes here.</p></div>
        <!-- Settings -->
        <div class="tab-pane fade" id="settingsTab">
            <h5>Profile Settings</h5>
            <p>Update your profile, change password, or configure notifications.</p>
           <a href="EditProfile?id=<%=id%>"> <button class="btn btn-primary mb-2">Edit Profile</button></a>
           <a href="EditPassword?id=<%=id%>"> <button class="btn btn-warning mb-2" >Change Password</button></a>
            <button class="btn btn-secondary mb-2">Notification Settings</button>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Sidebar Toggle -->
<script>
document.querySelector(".hamburger").addEventListener("click", function(){
    document.getElementById("sidebar").classList.toggle("active");
    document.getElementById("content").classList.toggle("active");
});
</script>

<!-- Chart.js -->
<script>
const ctx = document.getElementById('performanceChart').getContext('2d');
new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Jan','Feb','Mar','Apr','May','Jun'],
        datasets: [{
            label: 'Revenue',
            data: [120000, 150000, 140000, 160000, 175000, 200000],
            backgroundColor: 'rgba(165,0,52,0.2)',
            borderColor: '#A50034',
            borderWidth: 2,
            fill: true,
            tension: 0.3
        }]
    },
    options: {
        responsive: true,
        plugins: { legend: { display: true } },
        scales: { y: { beginAtZero: true } }
    }
});
</script>

<
<%
if (username != null && loginAlert) {
%>
<script>
Swal.fire({
    icon: 'success',
    title: 'Welcome <%= username %>!',
    text: 'You are logged into Axis Bank Employee Dashboard.',
    confirmButtonColor: '#A50034'
});
</script>
<%
    ses.setAttribute("loginAlert", false);
}
%>

</body>
</html>

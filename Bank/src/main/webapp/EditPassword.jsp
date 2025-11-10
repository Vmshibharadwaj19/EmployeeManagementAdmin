<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 500px;
    margin: 80px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #FF8200;
}

label {
    font-weight: 500;
    margin-top: 10px;
}

input[type="password"] {
    width: 100%;
    padding: 10px 12px;
    margin-top: 5px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 0.95rem;
}

input[type="submit"], .cancel-btn {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

input[type="submit"] {
    background-color: #28a745;
    color: #fff;
}

input[type="submit"]:hover {
    background-color: #218838;
}

.cancel-btn {
    background-color: #dc3545;
    color: #fff;
    margin-top: 10px;
}

.cancel-btn:hover {
    background-color: #c82333;
}
</style>
</head>
<body>

<%
String id = request.getParameter("id"); // hidden field from GET
String error = (String) request.getAttribute("error");
String error1 = (String) request.getAttribute("error1");
String success = (String) request.getAttribute("success");
%>

<div class="container">
    <h2>Change Password</h2>
    <form method="post" action="EditPassword">
        <input type="hidden" name="id" value="<%= id %>">
        
        <label>Current Password</label>
        <input type="password" name="current" required>
        
        <label>New Password</label>
        <input type="password" name="new1" required>
        
        <label>Retype New Password</label>
        <input type="password" name="new2" required>
        
        <input type="submit" value="Change Password">
        <button type="button" class="cancel-btn" onclick="window.location.href='EmployeeDashBoard.jsp'">Cancel</button>
    </form>
</div>

<script>
// Show SweetAlert2 notifications
<% if(error != null){ %>
Swal.fire({
    icon: 'error',
    title: 'Oops...',
    text: '<%= error %>',
    confirmButtonColor: '#FF8200'
});
<% } %>

<% if(error1 != null){ %>
Swal.fire({
    icon: 'error',
    title: 'Oops...',
    text: '<%= error1 %>',
    confirmButtonColor: '#FF8200'
});
<% } %>

<% if(success != null){ %>
Swal.fire({
    icon: 'success',
    title: 'Success!',
    text: '<%= success %>',
    confirmButtonColor: '#28a745'
}).then(() => {
    window.location.href = 'EmployeeDashBoard.jsp';
});
<% } %>
</script>

</body>
</html>

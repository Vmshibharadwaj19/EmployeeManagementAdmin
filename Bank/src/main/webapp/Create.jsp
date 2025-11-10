<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Customer</title>
<style>
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f2f2f2; color: #333; }
header { background-color: #FF8200; color: #fff; text-align: center; padding: 25px 0; font-size: 2rem; font-weight: 700; box-shadow: 0 3px 10px rgba(0,0,0,0.2); letter-spacing: 1px; }
.container { width: 95%; max-width: 600px; margin: 30px auto; background-color: #fff; border-radius: 10px; padding: 30px 25px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
form input[type="text"], form input[type="email"], form input[type="password"], form select { width: 100%; padding: 12px 15px; margin: 10px 0 20px 0; border: 1px solid #ccc; border-radius: 6px; font-size: 1rem; transition: 0.3s; }
form input:focus, form select:focus { border-color: #FF8200; outline: none; }
.submit-btn { width: 100%; background-color: #28a745; color: #fff; padding: 14px; font-size: 1.1rem; font-weight: bold; border: none; border-radius: 6px; cursor: pointer; transition: 0.3s; }
.submit-btn:hover { background-color: #218838; }
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<header>Axis Bank - Create Customer</header>
<div class="container">
<h2 style="text-align:center; margin-bottom:25px;">New Customer Form</h2>
<form action="CreateNewCustomer" method="post">
    <input type="text" name="cname" placeholder="Customer Name" required>
    <input type="email" name="email" placeholder="Customer Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="text" name="phone" placeholder="Phone">
    <input type="text" name="address" placeholder="Address">
    <select name="accountType" required>
        <option value="savings">Savings Account</option>
        <option value="current">Current Account</option>
    </select>
    <input type="submit" class="submit-btn" value="Create Customer">
</form>
</div>

<script>
<%
    Object resultObj = request.getAttribute("result");
    Object errorObj = request.getAttribute("error");
%>
<% if(resultObj != null) { %>
Swal.fire({
    icon: 'success',
    title: 'Created!',
    text: 'Customer and account created successfully!',
    confirmButtonColor: '#28a745'
}).then(() => {
    window.location.href = 'CustomerServlet';
});
<% } else if(errorObj != null) { %>
Swal.fire({
    icon: 'error',
    title: 'Error!',
    text: '<%= errorObj.toString() %>',
    confirmButtonColor: '#FF0000'
});
<% } %>
</script>
</body>
</html>

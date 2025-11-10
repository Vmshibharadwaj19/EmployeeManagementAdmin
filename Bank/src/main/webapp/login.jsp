<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Login</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body { font-family: 'Segoe UI', sans-serif; background: #f2f2f2; display:flex; justify-content:center; align-items:center; height:100vh; }
.login-container { background:#fff; padding:40px; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.15); width:350px; }
.login-container h2 { text-align:center; margin-bottom:25px; color:#333; }
input[type="text"], input[type="password"] { width:100%; padding:12px; margin:10px 0 20px 0; border:1px solid #ccc; border-radius:6px; font-size:1rem; }
input[type="text"]:focus, input[type="password"]:focus { border-color:#FF8200; outline:none; }
.login-btn { width:100%; padding:14px; background:#FF8200; color:#fff; border:none; border-radius:6px; font-size:1.1rem; cursor:pointer; }
.login-btn:hover { background:#e68a00; }
</style>
</head>
<body>

<div class="login-container">
    <h2>Bank Login</h2>
    <form action="Login" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login" class="login-btn">
    </form>
</div>

<script>

<%
    Object errorObj = request.getAttribute("error");
    if(errorObj != null) {
%>
Swal.fire({
    icon: 'error',
    title: 'Login Failed!',
    text: '<%= errorObj.toString() %>',
    confirmButtonColor: '#FF8200'
});
<% } %>
</script>

</body>
</html>

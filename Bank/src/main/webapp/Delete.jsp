<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Customer</title>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<script>
<%
    // Get success or error message set by servlet
    Object successObj = request.getAttribute("success");
    Object errorObj = request.getAttribute("error");
%>

<% if(successObj != null) { %>
    Swal.fire({
        icon: 'success',
        title: 'Deleted!',
        text: '<%= successObj.toString() %>',
        confirmButtonColor: '#FF8200'
    }).then(() => {
        window.location.href = 'CustomerServlet'; // redirect to customer list
    });
<% } else if(errorObj != null) { %>
    Swal.fire({
        icon: 'error',
        title: 'Error!',
        text: '<%= errorObj.toString() %>',
        confirmButtonColor: '#FF0000'
    }).then(() => {
        window.location.href = 'CustomerServlet'; // redirect to customer list
    });
<% } else { %>
    <script>
        // fallback redirect if no messages
        window.location.href = 'CustomerServlet';
    </script>
<% } %>
</script>

</body>
</html>

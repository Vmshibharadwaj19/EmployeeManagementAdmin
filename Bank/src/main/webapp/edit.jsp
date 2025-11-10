<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.Banking.Customers" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f2f5f7;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
}
.form-container {
    background: #fff;
    width: 450px;
    max-width: 95%;
    margin: 50px auto;
    padding: 30px 25px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    transition: 0.2s;
}
.form-container:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 25px rgba(0,0,0,0.2);
}
h2 { text-align: center; margin-bottom: 25px; color: #333; }
label { display: block; margin-bottom: 6px; font-weight: 600; color: #555; }
input[type="text"], input[type="email"] { width: 100%; padding: 10px 12px; margin-bottom: 18px; border: 1px solid #ccc; border-radius: 6px; font-size: 0.95rem; box-sizing: border-box; }
.btn { width: 100%; padding: 12px 0; font-size: 1rem; font-weight: 600; border: none; border-radius: 6px; cursor: pointer; transition: 0.3s; }
.btn-update { background-color: #FF9800; color: white; }
.btn-update:hover { background-color: #e68a00; }
</style>
</head>
<body>

<div class="form-container">
<h2>Edit Customer</h2>

<%
List<Customers> customerList = (List<Customers>) request.getAttribute("customer");
Customers cust = (customerList != null && !customerList.isEmpty()) ? customerList.get(0) : null;
%>

<form method="post" action="EditCustomerServlet">
    <label for="cust_id">Customer ID:</label>
    <input type="text" id="cust_id" name="customer_id" value="<%= (cust != null ? cust.getCust_id() : "") %>" readonly>

    <label for="custName">Name:</label>
    <input type="text" id="custName" name="custName" value="<%= (cust != null ? cust.getCustName() : "") %>" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= (cust != null ? cust.getEmail() : "") %>" required>

    <label for="mobno">Mobile No:</label>
    <input type="text" id="mobno" name="mobno" value="<%= (cust != null ? cust.getMobno() : "") %>" required>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" value="<%= (cust != null ? cust.getAddress() : "") %>" required>

    <input type="submit" class="btn btn-update" value="Update Customer">
</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
<%
Object resultObj = request.getAttribute("result");
if(resultObj != null) {
    int result = (Integer) resultObj;
%>
if (<%= result %> > 0) {
    Swal.fire({
        icon: 'success',
        title: 'Updated!',
        text: 'Customer details updated successfully!',
        confirmButtonColor: '#FF9800'
    }).then(() => {
        window.location.href = 'CustomerServlet'; // Redirect to list
    });
} else {
    Swal.fire({
        icon: 'error',
        title: 'Failed!',
        text: 'Customer update failed. Please try again.',
        confirmButtonColor: '#FF9800'
    });
}
<% } %>
</script>

</body>
</html>

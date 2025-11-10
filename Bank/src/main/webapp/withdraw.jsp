<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.Banking.Accounts" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw Money</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f9f9f9;
}
header {
    background-color: #FF8200;
    color: white;
    text-align: center;
    padding: 20px;
    font-size: 1.6rem;
    font-weight: bold;
}
.container {
    width: 90%;
    max-width: 800px;
    margin: 30px auto;
    background-color: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}
th, td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
}
th {
    background-color: #FF8200;
    color: white;
}
button {
    background-color: #dc3545;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}
button:hover {
    background-color: #c82333;
}
.cancel-btn {
    background-color: #6c757d;
}
.cancel-btn:hover {
    background-color: #5a6268;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<header>Withdraw Money</header>

<div class="container">
    <h2 style="text-align:center;">Your Account Details</h2>

    <%
        List<Accounts> accountList = (List<Accounts>) request.getAttribute("account");
        if (accountList != null && !accountList.isEmpty()) {
    %>

    <table>
        <tr>
            <th>Account ID</th>
            <th>Customer ID</th>
            <th>Account Type</th>
            <th>Balance</th>
            <th>Created At</th>
            <th>Action</th>
        </tr>
        <% for(Accounts acc : accountList) { %>
        <tr>
            <td><%= acc.getAccountId() %></td>
            <td><%= acc.getCustomerId() %></td>
            <td><%= acc.getAccountType() %></td>
            <td><%= acc.getBalance() %></td>
            <td><%= acc.getCreatedAt() %></td>
            <td>
                <button type="button" onclick="withdrawMoney(<%= acc.getAccountId() %>)">Transfer</button>
            </td>
        </tr>
        <% } %>
    </table>

    <% } else { %>
        <p style="text-align:center; color:red;">No accounts found.</p>
    <% } %>

    <!-- Cancel button to go back to dashboard -->
    <div style="text-align:center; margin-top:20px;">
        <button type="button" class="cancel-btn" onclick="window.location.href='dashboard.jsp'">Cancel</button>
    </div>
</div>

<!-- Hidden form for posting withdrawal -->
<form id="withdrawForm" action="withdraw" method="post" style="display:none;">
    <input type="hidden" id="accountId" name="accountId">
    <input type="hidden" id="amount" name="amount">
</form>

<%
    Object successObj = request.getAttribute("success");
    Object errorObj = request.getAttribute("error");
%>

<script>
function withdrawMoney(accountId) {
    Swal.fire({
        title: 'Enter Withdrawal Amount',
        input: 'number',
        inputAttributes: { min: 1, step: 0.01 },
        showCancelButton: true,
        confirmButtonText: 'Transfer',
        confirmButtonColor: '#dc3545',
        preConfirm: (amount) => {
            if (!amount || amount <= 0) {
                Swal.showValidationMessage('Enter a valid amount');
            }
            return amount;
        }
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('accountId').value = accountId;
            document.getElementById('amount').value = result.value;
            document.getElementById('withdrawForm').submit();
        }
    });
}

// SweetAlert after withdrawal
<% if (successObj != null) { %>
Swal.fire({
    icon: 'success',
    title: 'Withdrawal Successful!',
    text: '<%= successObj.toString() %>',
    confirmButtonColor: '#28a745'
}).then(() => {
    window.location.href = 'dashboard.jsp';
});
<% } else if (errorObj != null) { %>
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

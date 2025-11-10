<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.Banking.Transactions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Statement</title>
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
    width: 95%;
    max-width: 900px;
    margin: 30px auto;
    background-color: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
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
tr:nth-child(even) {
    background-color: #f2f2f2;
}
.home-btn {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    font-size: 1rem;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}
.home-btn:hover {
    background-color: #218838;
}
</style>
</head>
<body>

<header>Account Statement</header>

<div class="container">
    <%
        List<Transactions> history = (List<Transactions>) request.getAttribute("history");
        if(history != null && !history.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>Account ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Description</th>
        </tr>
        <% for(Transactions t : history) { %>
        <tr>
            <td><%= t.getTransactionId() %></td>
            <td><%= t.getAccountId() %></td>
            <td><%= t.getTransactionType() %></td>
            <td><%= t.getAmount() %></td>
            <td><%= t.getTransactionDate() %></td>
            <td><%= t.getDescription() %></td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
        <p style="text-align:center; color:red;">No transactions found for this account.</p>
    <% } %>

    <!-- Home button -->
    <button class="home-btn" onclick="window.location.href='dashboard.jsp'">Home</button>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.Banking.Accounts" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Axis Bank Accounts</title>
<style>
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f2f2f2; color: #333; }
header { background-color: #FF8200; color: #fff; text-align: center; padding: 25px 0; font-size: 2rem; font-weight: 700; box-shadow: 0 3px 10px rgba(0,0,0,0.2); letter-spacing: 1px; }
.container { width: 95%; max-width: 1200px; margin: 30px auto; background-color: #fff; border-radius: 10px; padding: 25px 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); overflow-x: auto; }
.create-btn { background-color: #28a745; color: #fff; padding: 12px 20px; font-size: 1rem; font-weight: bold; border: none; border-radius: 6px; cursor: pointer; margin-bottom: 20px; display: inline-block; text-decoration: none; transition: 0.3s; }
.create-btn:hover { background-color: #218838; }

.search-bar { width: 100%; max-width: 400px; padding: 10px 15px; margin-bottom: 20px; border-radius: 6px; border: 1px solid #ccc; font-size: 0.95rem; }

table { width: 100%; border-collapse: collapse; min-width: 800px; }
th, td { padding: 15px 20px; text-align: left; }
th { background-color: #FF8200; color: #fff; font-weight: 600; text-transform: uppercase; font-size: 0.95rem; }
tr:nth-child(even) { background-color: #fafafa; }
tr:hover { background-color: #fef3e0; transition: 0.2s; }
td { font-size: 0.9rem; }
.action-btn { padding: 6px 14px; border-radius: 5px; font-size: 0.85rem; font-weight: bold; text-decoration: none; color: #fff; transition: 0.3s; }
.edit-btn { background-color: #2196F3; }
.edit-btn:hover { background-color: #0b7dda; }
.delete-btn { background-color: #F44336; }
.delete-btn:hover { background-color: #da190b; }
@media screen and (max-width: 1024px) { th, td { padding: 12px 15px; font-size: 0.85rem; } .create-btn { padding: 10px 18px; font-size: 0.9rem; } .search-bar { width: 100%; margin-bottom: 15px; } }
@media screen and (max-width: 768px) { table { min-width: 100%; } th, td { padding: 10px 12px; font-size: 0.8rem; } .action-btn { padding: 4px 10px; font-size: 0.75rem; } .create-btn { width: 100%; text-align: center; margin-bottom: 15px; } }
</style>

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<header>
    Axis Bank Accounts
</header>

<div class="container">
    <a href="CreateNewAccount" class="create-btn">+ Create New Account</a>
    <input type="text" id="searchInput" class="search-bar" placeholder="Search by Account ID, Customer ID or Account Type..." onkeyup="filterTable()">

    <table id="accountsTable">
        <tr>
            <th>Account Id</th>
            <th>Customer Id</th>
            <th>Account Type</th>
            <th>Balance</th>
            <th>Creation Date</th>
            <th colspan="2">Actions</th>
        </tr>

        <%
        List<Accounts> c = (List<Accounts>)request.getAttribute("customer");
        if(c != null && !c.isEmpty()){
            for(Accounts i : c){
        %>
        <tr>
            <td><%=i.getAccountId() %></td>
            <td><%=i.getCustomerId() %></td>
            <td><%=i.getAccountType() %></td>
            <td><%=i.getBalance() %></td>
            <td><%=i.getCreatedAt() %></td>
            
            <td><a class="action-btn edit-btn" href="EditAccountServlet?account_id=<%=i.getAccountId()%>">Edit</a></td>
            <td><a href="#" class="action-btn delete-btn" onclick="confirmDelete(<%=i.getAccountId()%>)">Delete</a></td>
        </tr>
        <%  }
        } %>
    </table>
</div>

<script>
// Delete confirmation
function confirmDelete(accountId) {
    Swal.fire({
        title: 'Are you sure?',
        text: "This action cannot be undone!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#FF8200',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if(result.isConfirmed) {
            window.location.href = 'DeleteAccountServlet?account_id=' + accountId + '&deleted=true';
        }
    });
}

// Success alert
<%
String deleted = request.getParameter("deleted");
if("true".equals(deleted)) {
%>
Swal.fire({
    icon: 'success',
    title: 'Deleted!',
    text: 'Account deleted successfully!',
    confirmButtonColor: '#FF8200'
});
<% } %>

// Filter table function
function filterTable() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let table = document.getElementById("accountsTable");
    let tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) { // skip header row
        let tdArr = tr[i].getElementsByTagName("td");
        let found = false;
        for (let j = 0; j < 3; j++) { // check first 3 columns: Account ID, Customer ID, Account Type
            if(tdArr[j] && tdArr[j].innerText.toLowerCase().indexOf(input) > -1) {
                found = true;
                break;
            }
        }
        tr[i].style.display = found ? "" : "none";
    }
}
</script>

</body>
</html>

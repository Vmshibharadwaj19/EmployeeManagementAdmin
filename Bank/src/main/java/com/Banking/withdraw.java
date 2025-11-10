package com.Banking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/withdraw")
public class withdraw extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        List<Accounts> account = new ArrayList<>();
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DbConnection.getConnection();
            //we don't have connection directly between the user and the customer to adjust the schema the joins are used
            PreparedStatement ps = con.prepareStatement(
                "SELECT a.* FROM accounts a " +
                "INNER JOIN customers c ON a.customer_id = c.customer_id " +
                "JOIN users u ON c.email = u.username " +
                "WHERE u.username = ?"
            );
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Accounts a = new Accounts(
                    rs.getInt("account_id"),
                    rs.getInt("customer_id"),
                    rs.getString("account_type"),
                    rs.getDouble("balance"),
                    rs.getTimestamp("created_at")
                );
                account.add(a);
            }

            request.setAttribute("account", account);
            request.getRequestDispatcher("withdraw.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("withdraw.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        double amount = Double.parseDouble(request.getParameter("amount"));

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DbConnection.getConnection();
            con.setAutoCommit(false);

            // Check balance before withdrawal
            PreparedStatement check = con.prepareStatement("SELECT balance FROM accounts WHERE account_id = ?");
            check.setInt(1, accountId);
            ResultSet rs = check.executeQuery();
            double currentBalance = 0;
            if (rs.next()) {
                currentBalance = rs.getDouble("balance");
            }
            check.close();

            if (currentBalance < amount) {
                request.setAttribute("error", "Insufficient balance!");
                request.getRequestDispatcher("withdraw.jsp").forward(request, response);
                return;
            }

            //I need to deduct the amount from the current balance of the Customer Account
            ps = con.prepareStatement("UPDATE accounts SET balance = balance - ? WHERE account_id = ?");
            ps.setDouble(1, amount);
            ps.setInt(2, accountId);
            int rows = ps.executeUpdate();
            ///Need to Check after passing as it leads to an exception stuck on this for hours
            if (rows > 0) {
                // Log transaction
                PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO transactions(account_id, transaction_type, amount) VALUES(?, 'WITHDRAWAL', ?)"
                );
                ps2.setInt(1, accountId);
                ps2.setDouble(2, amount);
                ps2.executeUpdate();
                ps2.close();

                con.commit();
                request.setAttribute("success", "₹" + amount + " withdrawn successfully!");
            } else {
                request.setAttribute("error", "Withdrawal failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            try { if (con != null) con.rollback(); } catch (Exception ex) {}
            request.setAttribute("error", "Error: " + e.getMessage());
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        request.getRequestDispatcher("withdraw.jsp").forward(request, response);
    }
}

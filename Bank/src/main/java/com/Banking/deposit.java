package com.Banking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/deposit")
public class deposit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        List<Accounts> account = new ArrayList<>();
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT a.* FROM accounts a " +
                "INNER JOIN customers c ON a.customer_id = c.customer_id " +
                "JOIN users u ON c.email = u.username " +
                "WHERE u.username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Accounts a = new Accounts(
                    rs.getInt(1), rs.getInt(2),
                    rs.getString(3), rs.getDouble(4),
                    rs.getTimestamp(5)
                );
                account.add(a);
            }

            request.setAttribute("account", account);
            request.getRequestDispatcher("deposit.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DbConnection.getConnection();
            con.setAutoCommit(false);

            // 1️⃣ Update the account balance
            PreparedStatement ps = con.prepareStatement("UPDATE accounts SET balance = balance + ? WHERE account_id = ?");
            ps.setDouble(1, amount);
            ps.setInt(2, accountId);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                // 2️⃣ Log transaction
                PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO transactions(account_id,transaction_type, amount) VALUES(?, 'DEPOSIT', ?)");
                ps2.setInt(1, accountId);
                ps2.setDouble(2, amount);
                ps2.executeUpdate();
                ps2.close();

                con.commit();
                request.setAttribute("success", "Deposit successful!");
                doGet(request, response);
            } else {
                request.setAttribute("error", "Account not found!");
            }

        } catch (Exception e) {
            try { if (con != null) con.rollback(); } catch (Exception ex) {}
            e.printStackTrace();
            request.setAttribute("error", "Error while depositing: " + e.getMessage());
        } finally {
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        // Forward to JSP to show alert
        request.getRequestDispatcher("deposit.jsp").forward(request, response);
    }
}

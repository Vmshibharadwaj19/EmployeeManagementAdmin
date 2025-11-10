package com.Banking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.Banking.DbConnection;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AccountServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Accounts> customer = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DbConnection.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM accounts");

            while (rs.next()) {
                Accounts c = new Accounts(
                    rs.getInt(1),        // accountId
                    rs.getInt(2),        // customerId
                    rs.getString(3),     // accountType
                    rs.getDouble(4),     // balance
                    rs.getTimestamp(5)   // createdAt
                );
                customer.add(c);
            }

            request.setAttribute("customer", customer);
            request.getRequestDispatcher("accounts.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error fetching accounts: " + e);
            request.setAttribute("error", "Unable to fetch accounts. Please try again later.");
            request.getRequestDispatcher("accounts.jsp").forward(request, response);
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(stmt != null) stmt.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

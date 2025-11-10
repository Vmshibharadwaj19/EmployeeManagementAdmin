package com.Banking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/CreateNewCustomer")
public class CreateNewCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CreateNewCustomer() { super(); }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cname = request.getParameter("cname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String accountType = request.getParameter("accountType");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DbConnection.getConnection();

            // Insert into users table
            String sqlUser = "INSERT INTO users(username,password,role) VALUES(?,?,?)";
            ps = con.prepareStatement(sqlUser);
            ps.setString(1, email);
            ps.setString(2, password); // hash in real app
            ps.setString(3, "customer");
            ps.executeUpdate();
            ps.close();

            // Insert into customers table (fixed: include email)
            String sqlCustomer = "INSERT INTO customers(name, phone, address, email) VALUES(?,?,?,?)";
            ps = con.prepareStatement(sqlCustomer, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cname);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, email); // <-- include email
            int rows = ps.executeUpdate();

            // Get generated customer_id
            ResultSet rs = ps.getGeneratedKeys();
            int custId = 0;
            if(rs.next()) custId = rs.getInt(1);
            rs.close();
            ps.close();

            // Insert into accounts table
            String sqlAccount = "INSERT INTO accounts(customer_id, account_type, balance) VALUES(?,?,?)";
            ps = con.prepareStatement(sqlAccount);
            ps.setInt(1, custId);
            ps.setString(2, accountType);
            ps.setDouble(3, 0.0);
            ps.executeUpdate();
            ps.close();

            request.setAttribute("result", rows);

        } catch(SQLIntegrityConstraintViolationException e) {
            request.setAttribute("error", "Email already exists! Please use a different email.");
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
        } finally {
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }

        request.getRequestDispatcher("Create.jsp").forward(request, response);
    }
}

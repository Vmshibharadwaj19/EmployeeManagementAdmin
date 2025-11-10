package com.Banking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class EditCustomerServlet
 */
@WebServlet("/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	          int cust_id=Integer.parseInt(request.getParameter("customer_id"));
	          Connection con=null;
	          List<Customers>customers=new ArrayList<>();
	          try
	          {
	        	  Class.forName("com.mysql.cj.jdbc.Driver");
	        	  con=DbConnection.getConnection();
	        	  PreparedStatement ps=con.prepareStatement("select * from customers where customer_id=?");
	        	  ps.setInt(1, cust_id);
	        	  ResultSet rs=ps.executeQuery();
	        	  while(rs.next())
	        	  {
	        			Customers c=new Customers(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getTimestamp(6));
	    				customers.add(c);
	        	  }
	        	  request.setAttribute("customer",customers);
	        	  request.getRequestDispatcher("edit.jsp").forward(request, response);
	        	  
	          }
	          catch(Exception e)
	          {
	        	  System.out.println(e);
	          }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int custId = Integer.parseInt(request.getParameter("customer_id"));
    String name = request.getParameter("custName");
    String email = request.getParameter("email");
    String phone = request.getParameter("mobno");
    String address = request.getParameter("address");

    int result = 0;

    try (Connection con = DbConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
                 "UPDATE customers SET name=?, email=?, phone=?, address=? WHERE customer_id=?")) {

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, phone);
        ps.setString(4, address);
        ps.setInt(5, custId);

        result = ps.executeUpdate();

    } catch (SQLIntegrityConstraintViolationException e) {
        request.setAttribute("error", "Email already exists! Please use a different email.");
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("error", "Something went wrong: " + e.getMessage());
    }

    // Pass result to JSP for SweetAlert
    request.setAttribute("result", result);

    // Forward back to edit page so SweetAlert can handle success/failure
    request.getRequestDispatcher("edit.jsp").forward(request, response);
}
}



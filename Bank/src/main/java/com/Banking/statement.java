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
 * Servlet implementation class statement
 */
@WebServlet("/statement")
public class statement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public statement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String query="select * from transactions  where account_id= (select account_id from accounts where customer_id=(select customer_id from customers where email=?))";
		Connection con=null;
		List<Transactions>transaction=new ArrayList<>();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			 Transactions t=new Transactions(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDouble(4),rs.getTimestamp(5),rs.getString(6));	
			 transaction.add(t);
			}
			request.setAttribute("history", transaction);
			request.getRequestDispatcher("statement.jsp").forward(request, response);
			
		}
		catch(Exception e) {
		System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

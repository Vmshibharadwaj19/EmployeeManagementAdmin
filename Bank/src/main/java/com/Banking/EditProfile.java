package com.Banking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.sql.*;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String username=request.getParameter("username");
		String query="select * from customers where email=?";
		Connection con=null;
		List<Users>user=new ArrayList();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Users u=new Users(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5));
				user.add(u);
				
			}
			request.setAttribute("user", user);
			request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
			
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");

	    Connection con = null;
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DbConnection.getConnection();
	        
	        String updateQuery = "UPDATE users SET username=?, =?, phone=? WHERE customer_id=?";
	        PreparedStatement ps = con.prepareStatement(updateQuery);
	        ps.setString(1, name);
	        ps.setString(2, email);
	        ps.setString(3, phone);
	        ps.setInt(4, id);
	        
	        int row = ps.executeUpdate();
	        if(row > 0) {
	            request.setAttribute("success", "Profile updated successfully!");
	        } else {
	            request.setAttribute("error", "Failed to update profile!");
	        }
	        
	        // Reload updated data
	        String selectQuery = "SELECT * FROM customers WHERE customer_id=?";
	        PreparedStatement ps2 = con.prepareStatement(selectQuery);
	        ps2.setInt(1, id);
	        ResultSet rs = ps2.executeQuery();
	        List<Users> user = new ArrayList<>();
	        if(rs.next()) {
	            Users u = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5));
	            user.add(u);
	        }
	        request.setAttribute("user", user);
	        request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
	        
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}


}

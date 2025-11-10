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
 * Servlet implementation class EditPassword
 */
@WebServlet("/EditPassword")
public class EditPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("EditPassword.jsp").forward(request, response);
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String current=request.getParameter("current");
		String newpwd=request.getParameter("new1");
		String newpwd1=request.getParameter("new2");
		
		  Connection con=null;
		  try
		  {
			  String pwd="";
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  con=DbConnection.getConnection();  
			  String query="select * from users where user_id=?";
			  PreparedStatement ps=con.prepareStatement(query);
			  ps.setInt(1, id);
			  ResultSet rs=ps.executeQuery();
			  if(rs.next())
			  {
				 pwd=rs.getString("password");  
			  }
			  if(!current.equals(pwd)) {
				  request.setAttribute("error", "Incorrect Current Password");
				  
			  }
			  else if(!newpwd.equals(newpwd1))
			  {
				  request.setAttribute("error1", "New Password Mismatch");
			  }
			  else
			  {
				  request.setAttribute("success", "Password change Success");
				  String UpdatePwd="Update users set password=? where user_id=?";
				  PreparedStatement ps1=con.prepareStatement(UpdatePwd);
				  ps1.setString(1, newpwd);
				  ps1.setInt(2, id);
				  int row=ps1.executeUpdate();
				  
			  }
			  request.getRequestDispatcher("EditPassword.jsp").forward(request, response);
			  
		  }catch(Exception e)
		  {
			System.out.println(e);
		  }
	}

}

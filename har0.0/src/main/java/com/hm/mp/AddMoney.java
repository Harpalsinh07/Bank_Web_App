package com.hm.mp;

import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class AddMoney
 */
@WebServlet("/AddMoney")
public class AddMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String acc = request.getParameter("account_no");
		String amn = request.getParameter("amount");
		
		if(add(acc,amn) >0) {
			request.setAttribute("p", "success");
			RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
			rd.include(request, response);

		}else {
			request.setAttribute("p", "fail");
			RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
			rd.include(request, response);

		}
		
	}
	
	public int add(String account,String amount) {
		int i=0;
		
		try {
			int j = Integer.parseInt(amount);

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM customer WHERE account_no=?");
			ps1.setString(1, account);

			ResultSet rs = ps1.executeQuery();
			rs.next();

			int k = rs.getInt("balance");
			int l = j + k;

			PreparedStatement ps2 = con.prepareStatement("UPDATE customer SET balance=? WHERE account_no=?");
			ps2.setInt(1, l);
			ps2.setString(2, account);

			i = ps2.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);

		}

		
		return i;
	}

}

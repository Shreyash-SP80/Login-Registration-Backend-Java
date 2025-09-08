package com.login;

import java.sql.*;
import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.util.PasswordUtil;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");
		HttpSession session = request.getSession();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			
			// Create an connection
		    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "dbms");
		    
		    ps = con.prepareStatement("SELECT * FROM users WHERE uemail = ?");
		    ps.setString(1, uemail);
		    
		    rs = ps.executeQuery();
			
		    if (rs.next()) {
                // Get the hashed password from database
                String storedHash = rs.getString("upwd");
				
                // ps = con.prepareStatement("SELECT * FROM users WHERE uemail = ? and upwd = ?");
                // ps.setString(1, uemail);
                // ps.setString(2, upwd);
                // rs = ps.executeQuery();
                if (PasswordUtil.verifyPassword(upwd, storedHash)) {
                	session.setAttribute("name", rs.getString("uname"));
                	session.setAttribute("email", rs.getString("uemail"));
                	// If user credentials are correct
                	response.sendRedirect("message.jsp?type=success&message=Login+Successful!&redirect=index.jsp");
                } else {
                    response.sendRedirect("message.jsp?type=error&message=Invalid+Email+or+Password!&redirect=login.jsp");
                }
			} else {
				response.sendRedirect("message.jsp?type=error&message=Invalid+Email+or+Password!&redirect=login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("message.jsp?type=error&message=Invalid+Email+or+Password!&redirect=login.jsp");
		} finally {
			try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
		}
	}
}

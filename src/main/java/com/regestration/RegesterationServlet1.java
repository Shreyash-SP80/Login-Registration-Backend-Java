package com.regestration;

import java.sql.*;
import java.io.PrintWriter;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.util.PasswordUtil;

// For password encription
// Go to: https://repo1.maven.org/maven2/org/mindrot/jbcrypt/0.4/

@WebServlet("/Regester")
public class RegesterationServlet1 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String umobile = request.getParameter("mobile");
		String upwd = request.getParameter("confirmPassword");
		
		
		// Hash the password with PBKDF2
        String hashedPassword = PasswordUtil.hashPassword(upwd);
		
		RequestDispatcher dispatcher = null;
		PreparedStatement checkStmt = null;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		
		// PrintWriter pw = response.getWriter();
		
		// pw.println(uname);
		// pw.println(uemail);
		// pw.println(umobile);
		// pw.println(upwd);
		
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "dbms");
			
			
			// Check if user already exists
            checkStmt = con.prepareStatement("SELECT * FROM users WHERE uemail = ?");
            checkStmt.setString(1, uemail);
            rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                // User already exists
            	// request.getRequestDispatcher("message.jsp?type=error&message=User+Already+exists+with+this+email!&redirect=register.jsp").forward(request, response);
            	response.sendRedirect("message.jsp?type=error&message=User+Already+exists+with+this+email!&redirect=register.jsp");
            } else {
            	ps = con.prepareStatement("INSERT INTO users (uname, upwd, umobile, uemail) VALUES (?, ?, ?, ?)");
    			
    			ps.setString(1, uname);
    			ps.setString(2, hashedPassword);
    			ps.setString(3, umobile);
    			ps.setString(4, uemail);
			
				int result = ps.executeUpdate();
				
				if (result > 0) {
					response.sendRedirect("message.jsp?type=success&message=Registered+Successfully!&redirect=login.jsp");
				} else {
					response.sendRedirect("message.jsp?type=error&message=Regestration+Unsuccessful!+tTryAgain.&redirect=register.jsp");
				}
            }
			
		} catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("message.jsp?type=error&message=Database+error!&redirect=register.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("message.jsp?type=error&message=Unexpected+error!&redirect=register.jsp");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}

}

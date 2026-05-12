package com.brainvault.servlet;

import java.io.IOException;
import java.sql.*;

import com.brainvault.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=?"
            );

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String role = rs.getString("role");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("user_id", rs.getInt("id"));

                // 🔥 ROLE BASED REDIRECT
                if ("admin".equals(role)) {
                    response.sendRedirect("dashboard.jsp");
                } else if ("student".equals(role)) {
                    response.sendRedirect("studentDashboard.jsp");
                }

            } else {
                response.sendRedirect("index.jsp?error=Invalid Credentials");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
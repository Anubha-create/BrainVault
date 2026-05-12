package com.brainvault.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.brainvault.dao.DBConnection;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username, password, role) VALUES (?, ?, ?)"
             )) {

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);

            ps.executeUpdate();

            resp.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("signup.jsp?error=true");
        }
    }
}
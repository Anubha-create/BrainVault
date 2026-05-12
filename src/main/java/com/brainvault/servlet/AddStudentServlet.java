package com.brainvault.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

import com.brainvault.dao.DBConnection;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String name = req.getParameter("name");
        String roll = req.getParameter("roll");
        String course = req.getParameter("course");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO students(name, roll_no, course) VALUES (?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, roll);
            ps.setString(3, course);

            ps.executeUpdate();

            resp.sendRedirect("view.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
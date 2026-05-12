package com.brainvault.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.brainvault.dao.DBConnection;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String roll = req.getParameter("roll");
            String course = req.getParameter("course");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE students SET name=?, roll_no=?, course=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setString(2, roll);
            ps.setString(3, course);
            ps.setInt(4, id);

            ps.executeUpdate();

            // ✅ IMPORTANT: redirect to view page
            resp.sendRedirect("view.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Update failed!");
        }
    }
}
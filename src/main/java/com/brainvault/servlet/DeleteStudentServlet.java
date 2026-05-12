package com.brainvault.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.brainvault.dao.DBConnection;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM students WHERE id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

            resp.sendRedirect("view.jsp?msg=Student Deleted Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
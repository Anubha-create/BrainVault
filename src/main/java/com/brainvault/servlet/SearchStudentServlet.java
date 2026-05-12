package com.brainvault.servlet;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.brainvault.dao.DBConnection;

@WebServlet("/searchStudent")
public class SearchStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String name = req.getParameter("name");

        resp.setContentType("text/html");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM students WHERE name LIKE ?"
            );

            ps.setString(1, "%" + name + "%");

            ResultSet rs = ps.executeQuery();

            resp.getWriter().println("<h2>Search Results</h2>");

            while(rs.next()) {
                resp.getWriter().println(
                    rs.getInt("id") + " - " +
                    rs.getString("name") + " - " +
                    rs.getString("roll_no") + " - " +
                    rs.getString("course") + "<br>"
                );
            }

            resp.getWriter().println("<br><a href='view.jsp'>Back</a>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
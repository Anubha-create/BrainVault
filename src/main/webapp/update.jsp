<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.brainvault.dao.DBConnection" %>

<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("admin")) {
    response.sendRedirect("index.jsp");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Student</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

</head>

<body>

<div class="container-fluid">
<div class="row">

<%@ include file="includes/sidebar.jsp" %>

<div class="col-md-10 main">

<h2 class="mb-4 animate__animated animate__fadeInDown">✏️ Update Student</h2>

<% if(rs.next()) { %>

<form action="updateStudent" method="post"
      class="card p-4 shadow animate__animated animate__fadeInUp">

<input type="hidden" name="id" value="<%= id %>">

<input type="text" name="name" class="form-control mb-3"
value="<%= rs.getString("name") %>" required>

<input type="text" name="roll" class="form-control mb-3"
value="<%= rs.getString("roll_no") %>" required>

<input type="text" name="course" class="form-control mb-3"
value="<%= rs.getString("course") %>" required>

<button class="btn btn-success w-100">Update Student</button>

</form>

<% } else { %>

<div class="alert alert-danger">Student not found!</div>

<% } %>

</div>
</div>
</div>

</body>
</html>
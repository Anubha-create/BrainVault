<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.brainvault.dao.DBConnection" %>

<%
String role = (String) session.getAttribute("role");
String username = (String) session.getAttribute("username");

if (role == null || !role.equals("student")) {
    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Student Panel</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>


</head>

<body>

<div class="container-fluid">
<div class="row">

<%@ include file="includes/sidebar.jsp" %>

<div class="col-md-10 main">

<!-- Welcome -->
<div class="welcome-card animate__animated animate__fadeInDown">
    <h4>Welcome, <%= username %> 👋</h4>
    <p>You can view and search student records</p>
</div>

<h3 class="mb-3 animate__animated animate__fadeInUp">Student Records</h3>

<table class="table table-striped table-hover shadow animate__animated animate__fadeInUp">

<tr class="table-dark">
<th>ID</th>
<th>Name</th>
<th>Roll</th>
<th>Course</th>
</tr>

<%
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM students");
ResultSet rs = ps.executeQuery();

while(rs.next()) {
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("roll_no") %></td>
<td><%= rs.getString("course") %></td>
</tr>

<% } %>

</table>

</div>
</div>
</div>

</body>
</html>
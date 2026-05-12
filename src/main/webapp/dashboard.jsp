<%@ page import="java.sql.*" %>
<%@ page import="com.brainvault.dao.DBConnection" %>

<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("admin")) {
    response.sendRedirect("index.jsp");
    return;
}

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM students");
ResultSet rs = ps.executeQuery();
rs.next();
int totalStudents = rs.getInt(1);
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="container-fluid">
<div class="row">

<%@ include file="includes/sidebar.jsp" %>

<div class="col-md-10 main">

<h2 class="mb-4 fw-bold">Admin Dashboard</h2>

<!-- STATS -->
<div class="row g-4">

<div class="col-md-4">
<div class="stat-card bg-blue shadow">
<h6>Total Students</h6>
<h2><%= totalStudents %></h2>
</div>
</div>

<div class="col-md-4">
<div class="stat-card bg-green shadow">
<h6>Active Users</h6>
<h2>Online</h2>
</div>
</div>

<div class="col-md-4">
<div class="stat-card bg-purple shadow">
<h6>System Status</h6>
<h2>Good</h2>
</div>
</div>

</div>

<!-- QUICK ACTIONS -->
<div class="card shadow p-4 rounded-4 mt-4">

<h5 class="mb-4 fw-semibold">Quick Actions</h5>

<div class="row g-4">

<div class="col-md-4">
    <a href="add.jsp" class="text-decoration-none">
        <div class="p-4 rounded-4 text-white" style="background:linear-gradient(135deg,#3b82f6,#6366f1);">
            <h6 class="fw-bold">Add Student</h6>
            <p class="mb-0">Create new record</p>
        </div>
    </a>
</div>

<div class="col-md-4">
    <a href="view.jsp" class="text-decoration-none">
        <div class="p-4 rounded-4 text-white" style="background:linear-gradient(135deg,#10b981,#059669);">
            <h6 class="fw-bold">View Students</h6>
            <p class="mb-0">Browse all data</p>
        </div>
    </a>
</div>

<div class="col-md-4">
    <a href="search.jsp" class="text-decoration-none">
        <div class="p-4 rounded-4 text-white" style="background:linear-gradient(135deg,#1e293b,#334155);">
            <h6 class="fw-bold">Search</h6>
            <p class="mb-0">Find instantly</p>
        </div>
    </a>
</div>

</div>

</div>
</body>
</html>
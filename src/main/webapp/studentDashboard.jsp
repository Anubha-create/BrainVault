<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("student")) {
    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title>

<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">



</head>

<body>

<div class="container-fluid">
<div class="row">

<%@ include file="includes/sidebar.jsp" %>

<div class="col-md-10 main">

<div class="welcome-card shadow mb-4">
<h2>Welcome, <%= session.getAttribute("username") %></h2>
<p>Your student dashboard</p>
</div>

<div class="row g-4">

<div class="col-md-6">
<div class="card feature-card shadow">
<h5>View Students</h5>
<p>See all available records</p>
<a href="view.jsp" class="btn btn-primary">Open</a>
</div>
</div>

<div class="col-md-6">
<div class="card feature-card shadow">
<h5>Search Students</h5>
<p>Find students quickly</p>
<a href="search.jsp" class="btn btn-dark">Search</a>
</div>
</div>

</div>

</div>
</div>
</div>

</body>
</html>
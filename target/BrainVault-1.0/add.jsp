<%@ page contentType="text/html;charset=UTF-8" %>

<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("admin")) {
    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<title>Add Student</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

</head>

<body>

<div class="container-fluid">
<div class="row">

<%@ include file="includes/sidebar.jsp" %>

<div class="col-md-10 main">

<h2 class="mb-4 animate__animated animate__fadeInDown">➕ Add Student</h2>

<form action="addStudent" method="post" class="card p-4 shadow animate__animated animate__fadeInUp">

<input type="text" name="name" class="form-control mb-3" placeholder="Name" required>
<input type="text" name="roll" class="form-control mb-3" placeholder="Roll No" required>
<input type="text" name="course" class="form-control mb-3" placeholder="Course" required>

<button class="btn btn-primary w-100">Add Student</button>

</form>

</div>
</div>
</div>

</body>
</html>
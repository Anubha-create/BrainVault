<%@ page import="java.sql.*" %>
<%@ page import="com.brainvault.dao.DBConnection" %>

<%
String role = (String) session.getAttribute("role");
if (role == null) {
    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Search Students</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>

<div class="container-fluid">
<div class="row">

<%@ include file="includes/sidebar.jsp" %>

<div class="col-md-10 main">

<h2 class="mb-4">Search Students</h2>

<div class="card p-3 shadow mb-3">
<input type="text" id="searchInput" class="form-control"
placeholder="Search by name, roll, course...">
</div>

<table class="table table-bordered shadow" id="studentTable">

<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Roll</th>
<th>Course</th>
</tr>
</thead>

<tbody>

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

</tbody>
</table>

</div>
</div>
</div>

<!-- 🔥 LIVE SEARCH SCRIPT -->
<script>
document.getElementById("searchInput").addEventListener("keyup", function() {
    let filter = this.value.toLowerCase();
    let rows = document.querySelectorAll("#studentTable tbody tr");

    rows.forEach(row => {
        let text = row.innerText.toLowerCase();

        if (text.includes(filter)) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
});
</script>

</body>
</html>
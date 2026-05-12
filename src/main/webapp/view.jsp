<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.brainvault.dao.DBConnection" %>

<%
String role = (String) session.getAttribute("role");
String username = (String) session.getAttribute("username");

if (role == null) {
    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>View Students</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

</head>

<body>

<div class="container-fluid">
<div class="row">

<%@ include file="includes/sidebar.jsp" %>

<div class="col-md-10 main">

<h2 class="mb-4 animate__animated animate__fadeInDown">All Students</h2>
<p class="text-muted">Welcome, <%= username %></p>

<div class="card shadow p-3 animate__animated animate__fadeInUp">

<table class="table table-hover align-middle">

<thead class="table-dark">
<tr>
<th>ID</th>
<th>Name</th>
<th>Roll</th>
<th>Course</th>

<% if("admin".equals(role)) { %>
<th>Action</th>
<% } %>

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

<% if("admin".equals(role)) { %>
<td>

<!-- DELETE BUTTON -->
<button class="btn btn-danger btn-sm deleteBtn"
        data-id="<%= rs.getInt("id") %>"
        data-name="<%= rs.getString("name") %>"
        data-bs-toggle="modal"
        data-bs-target="#deleteModal">
    <i class="fas fa-trash"></i>
</button>

<!-- UPDATE BUTTON -->
<a href="update.jsp?id=<%= rs.getInt("id") %>" 
   class="btn btn-warning btn-sm">
   <i class="fas fa-edit"></i>
</a>

</td>
<% } %>

</tr>

<% } 

// ✅ Close resources (important)
rs.close();
ps.close();
con.close();
%>

</tbody>
</table>

</div>

</div>
</div>
</div>

<!-- 🔥 DELETE MODAL -->
<div class="modal fade" id="deleteModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content rounded-4 shadow">

      <div class="modal-header">
        <h5 class="modal-title text-danger">
            <i class="fas fa-exclamation-triangle"></i> Confirm Delete
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        Are you sure you want to delete 
        <strong id="studentName"></strong>?
        <br><br>
        <small class="text-muted">This action cannot be undone.</small>
      </div>

      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <a id="confirmDeleteBtn" class="btn btn-danger">
            <i class="fas fa-trash"></i> Delete
        </a>
      </div>

    </div>
  </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
// ✅ Safe JS (no inline bugs)
document.querySelectorAll(".deleteBtn").forEach(btn => {
    btn.addEventListener("click", function () {
        let id = this.getAttribute("data-id");
        let name = this.getAttribute("data-name");

        document.getElementById("studentName").innerText = name;
        document.getElementById("confirmDeleteBtn").href = "deleteStudent?id=" + id;
    });
});
</script>

</body>
</html>
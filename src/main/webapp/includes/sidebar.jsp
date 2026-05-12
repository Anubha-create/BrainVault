<%@ page contentType="text/html;charset=UTF-8" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<div class="sidebar">

<h4>🚀 BrainVault</h4>

<div class="user">
    👤 <%= session.getAttribute("username") %>
</div>

<!-- DASHBOARD LINK -->
<% if("admin".equals(session.getAttribute("role"))) { %>
    <a href="dashboard.jsp">
        <i class="fas fa-home"></i> Dashboard
    </a>
<% } else { %>
    <a href="studentDashboard.jsp">
        <i class="fas fa-home"></i> Dashboard
    </a>
<% } %>

<a href="view.jsp">
    <i class="fas fa-table"></i> View Students
</a>

<a href="search.jsp">
    <i class="fas fa-search"></i> Search
</a>

<% if("admin".equals(session.getAttribute("role"))) { %>
<a href="add.jsp">
    <i class="fas fa-user-plus"></i> Add Student
</a>
<% } %>

<a href="logout">
    <i class="fas fa-sign-out-alt"></i> Logout
</a>

</div>
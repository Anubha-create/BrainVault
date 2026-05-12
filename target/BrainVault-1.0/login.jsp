<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css"></head>
<body><div class="card"><h2>Login</h2>
<form action="login" method="post">
<input name="username"><br>
<input type="password" name="password"><br>
<button class="btn">Login</button>
</form></div></body></html>
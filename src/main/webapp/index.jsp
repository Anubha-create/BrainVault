<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>BrainVault Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #60a5fa, #a5b4fc); /* lighter */
}

/* CARD */
.login-card {
    width: 380px;
    padding: 35px;
    border-radius: 20px;
    background: rgba(255,255,255,0.85); /* lighter glass */
    backdrop-filter: blur(10px);
    box-shadow: 0 15px 40px rgba(0,0,0,0.15);
    text-align: center;
}

/* TITLE */
.title {
    margin-bottom: 20px;
    font-weight: bold;
    color: #1e293b;
}

/* INPUT */
.form-control {
    border-radius: 12px;
    padding: 12px;
    border: 1px solid #e2e8f0;
}

/* BUTTON */
.btn-login {
    border-radius: 12px;
    padding: 12px;
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    border: none;
    color: white;
    font-weight: 600;
    transition: 0.3s;
}

.btn-login:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59,130,246,0.4);
}

/* LINK BUTTON */
.link-btn {
    display: inline-block;
    margin-top: 15px;
    color: #2563eb;
    font-weight: 500;
    text-decoration: none;
    transition: 0.2s;
}

.link-btn:hover {
    color: #1d4ed8;
    text-decoration: underline;
}
</style>

</head>

<body>

<form action="login" method="post" class="login-card">

<div class="title">
    <h3><i class="fas fa-rocket"></i> BrainVault</h3>
</div>

<input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

<input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

<button class="btn btn-login w-100">Login</button>

<a href="signup.jsp" class="link-btn">Create Account</a>

</form>

</body>
</html>
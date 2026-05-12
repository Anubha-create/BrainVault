<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Signup</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #6ee7b7, #34d399); /* lighter green */
}

.signup-card {
    width: 420px;
    padding: 35px;
    border-radius: 20px;
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(10px);
    box-shadow: 0 15px 40px rgba(0,0,0,0.15);
    text-align: center;
}

.title {
    margin-bottom: 20px;
    color: #065f46;
}

.form-control {
    border-radius: 12px;
    padding: 12px;
    border: 1px solid #d1fae5;
}

/* BUTTON */
.btn-signup {
    border-radius: 12px;
    padding: 12px;
    background: linear-gradient(135deg, #10b981, #059669);
    border: none;
    color: white;
    font-weight: 600;
    transition: 0.3s;
}

.btn-signup:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(16,185,129,0.4);
}

/* LINK */
.link-btn {
    display: inline-block;
    margin-top: 15px;
    color: #065f46;
    font-weight: 500;
    text-decoration: none;
}

.link-btn:hover {
    text-decoration: underline;
}
</style>

</head>

<body>

<form action="signup" method="post" class="signup-card">

<div class="title">
    <h3><i class="fas fa-user-plus"></i> Create Account</h3>
</div>

<input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

<input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

<select name="role" class="form-control mb-3" required>
    <option value="">Select Role</option>
    <option value="admin">Admin</option>
    <option value="student">Student</option>
</select>

<button class="btn btn-signup w-100">Signup</button>

<a href="index.jsp" class="link-btn">Back to Login</a>

</form>

</body>
</html>
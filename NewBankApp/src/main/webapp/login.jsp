<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.NewBank.dto.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background:
		url('https://png.pngtree.com/thumb_back/fh260/background/20230630/pngtree-d-illustration-of-a-blue-background-bank-building-featuring-spanish-text-image_3700313.jpg')
		no-repeat;
	backdrop-filter: blur(3px);
	background-size: cover;
}

.wrapper {
	width: 420px;
	background: rgba(255, 255, 255, 0.1);
	border: 1px solid rgba(255, 255, 255, 0.2);
	border-radius: 20px;
	backdrop-filter: blur(15px);
	-webkit-backdrop-filter: blur(15px);
	color: white;
	padding: 40px;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
}

.wrapper h1 {
	font-size: 32px;
	text-align: center;
	margin-bottom: 25px;
}

.input-box {
	position: relative;
	width: 100%;
	margin-bottom: 20px;
}

.input-box input {
	width: 100%;
	padding: 12px 20px;
	border: none;
	border-radius: 30px;
	background: rgba(255, 255, 255, 0.2);
	color: white;
	font-size: 16px;
	outline: none;
}

.input-box input::placeholder {
	color: #eee;
}

.remember-forgot {
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	margin-bottom: 20px;
}

.remember-forgot label {
	display: flex;
	align-items: center;
}

.remember-forgot a {
	color: #fff;
	text-decoration: none;
}

.remember-forgot a:hover {
	text-decoration: underline;
}

.btn {
	width: 100%;
	padding: 12px;
	background: white;
	color: #333;
	border: none;
	border-radius: 30px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease;
}

.btn:hover {
	background: #00ffff;
	color: #000;
}

.register-link {
	font-size: 14px;
	text-align: center;
	margin-top: 20px;
}

.register-link a {
	color: #fff;
	text-decoration: none;
}

.register-link a:hover {
	text-decoration: underline;
}

.message {
	font-size: 14px;
	text-align: center;
	color: #0f0;
	margin-bottom: 15px;
}

.error {
	font-size: 14px;
	text-align: center;
	color: #f66;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<form action="login" method="post">
			<% 
                Customer c = (Customer) session.getAttribute("customer");
                String success = (String) request.getAttribute("Success");
                String error = (String) session.getAttribute("error");
            %>

			<h1>Login</h1>
		
			
			
			<% if (success != null) { %>
			<div class="message">
				<h3><%= success %></h3>
			</div>
			<% } %>

			<% if (c != null) { %>

			<% } %>

			<% if (error != null) { %>
			<div class="error"><%= error %></div>
			<% } %>
			
			<div class="input-box">
				<input type="tel" name="accountnumber"
					placeholder="Enter your account number" required>
			</div>

			<div class="input-box">
				<input type="password" name="password" placeholder="Enter password"
					required>
			</div>

			<div class="remember-forgot">
				<label><input type="checkbox"> Remember me</label> <a
					href="forgot.jsp">Forgot password?</a>
			</div>

			<button type="submit" class="btn">Login</button>

			<div class="register-link">
				<p>
					Don't have an account? <a href="Register1.jsp">Register!</a>
				</p>
			</div>
		</form>
	</div>
</body>
</html>

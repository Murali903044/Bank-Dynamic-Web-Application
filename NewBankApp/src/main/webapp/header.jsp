<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bank Application</title>
<style>
/* General Styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	text-align: center;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #004080;
	color: white;
	padding: 15px 20px;
}

header h1 {
	margin: 0;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul li {
	display: inline;
	margin: 0 15px;
}

nav ul li a {
	color: white;
	text-decoration: none;
	font-size: 16px;
}

.auth-buttons {
	display: flex;
	gap: 10px;
}

button {
	padding: 10px 15px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
}

.login-btn {
	background-color: #00b300;
	color: white;
}

.register-btn {
	background-color: #ff6600;
	color: white;
}
</style>
</head>
<body>
	<header>
		<h1>My Bank</h1>
		<nav>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact Us</a></li>
				<li><a href="#">Logout</a></li>
			</ul>
		</nav>
		<div class="auth-buttons">
			<button class="login-btn">
				<a href="login.jsp">Login</a>
			</button>
			<button class="register-btn">
				<a href="Register.jsp">Register</a>
			</button>
		</div>
	</header>

</body>
</html>
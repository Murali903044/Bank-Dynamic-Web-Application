<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WhiteBank - Home</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body, html {
	height: 100%;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	position: relative;
	overflow-x: hidden;
}

body::before {
	content: "";
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background:
		url('https://t4.ftcdn.net/jpg/00/28/10/71/360_F_28107151_vcKMNLupiicDb5P7BrN7Gb3uZjvz0C9m.jpg')
		no-repeat center center fixed;
	background-size: cover;
	filter: blur(6px) brightness(0.8);
	z-index: -1;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 30px;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	backdrop-filter: blur(5px);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
}

header h1 {
	font-size: 28px;
	font-weight: bold;
}

nav ul {
	list-style-type: none;
	display: flex;
	gap: 25px;
}

nav ul li a {
	color: white;
	text-decoration: none;
	font-size: 16px;
	padding: 6px 12px;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

nav ul li a:hover {
	background-color: #4CAF50;
}

.auth-buttons {
	display: flex;
	gap: 10px;
}

.auth-buttons button {
	padding: 8px 18px;
	font-size: 14px;
	border-radius: 20px;
	border: none;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.login-btn {
	background-color: rgba(0, 123, 255, 0.85);
	color: white;
}

.register-btn {
	background-color: rgba(40, 167, 69, 0.85);
	color: white;
}

.auth-buttons button a {
	color: white;
	text-decoration: none;
	display: block;
}

.login-btn:hover {
	background-color: #007bff;
	transform: scale(1.05);
}

.register-btn:hover {
	background-color: #28a745;
	transform: scale(1.05);
}

main {
	text-align: center;
	color: white;
	padding: 100px 20px;
}

main h2 {
	font-size: 42px;
	margin-bottom: 20px;
	font-weight: bold;
}

main span {
	color: #00ffff;
}

main p {
	font-size: 20px;
	opacity: 0.9;
}

footer {
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
	text-align: center;
	padding: 15px 0;
	font-size: 14px;
	margin-top: 40px;
}

@media ( max-width : 768px) {
	header {
		flex-direction: column;
		gap: 15px;
	}
	nav ul {
		flex-direction: column;
		align-items: center;
		gap: 10px;
	}
	.auth-buttons {
		flex-direction: column;
		align-items: center;
		gap: 10px;
	}
}

.hero {
	margin-top: 80px;
	padding: 40px 20px;
}

.hero h2 {
	font-size: 42px;
	color: #ffffff;
}

.hero p {
	font-size: 18px;
	color: #e0e0e0;
	margin: 15px 0 30px;
}

.hero-actions {
	display: flex;
	justify-content: center;
	gap: 20px;
	flex-wrap: wrap;
}

.hero-btn {
	padding: 12px 25px;
	border-radius: 30px;
	font-size: 16px;
	font-weight: bold;
	text-decoration: none;
	transition: all 0.3s ease;
}

.hero-btn.login {
	background-color: #007bff;
	color: white;
}

.hero-btn.register {
	background-color: #28a745;
	color: white;
}

.hero-btn:hover {
	opacity: 0.9;
	transform: scale(1.05);
}

.features {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 30px;
	padding: 50px 20px;
}

.feature-card {
	background-color: rgba(255, 255, 255, 0.1);
	border: 2px solid rgba(255, 255, 255, 0.2);
	color: white;
	padding: 20px;
	width: 300px;
	border-radius: 15px;
	text-align: center;
	backdrop-filter: blur(5px);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
	transition: transform 0.3s ease;
}

.feature-card:hover {
	transform: translateY(-5px);
}

.feature-card h3 {
	font-size: 20px;
	margin-bottom: 10px;
}

.feature-card p {
	font-size: 14px;
	opacity: 0.9;
}

.page-section {
	background-color: rgba(255, 255, 255, 0.15);
	margin: 60px auto;
	padding: 60px 40px;
	max-width: 1000px;
	border-radius: 12px;
	color: white;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
	text-align: center;
}

.page-section h2 {
	font-size: 32px;
	margin-bottom: 20px;
	border-bottom: 2px solid #ccc;
	padding-bottom: 10px;
}

.page-section ul {
	list-style: none;
	padding: 0;
	font-size: 18px;
}

.page-section ul li {
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<header>
		<h1>🏦 WhiteBank</h1>
		<nav>
			<ul>
				<li><a href="#home">Home</a></li>
				<li><a href="#services">Services</a></li>
				<li><a href="#contact">Contact Us</a></li>
				<li><a href="#about">About Us</a></li>
			</ul>
		</nav>
		<div class="auth-buttons">
			<button class="login-btn">
				<a href="login.jsp">Login</a>
			</button>
			<button class="register-btn">
				<a href="Register1.jsp">Register</a>
			</button>
		</div>
	</header>

	<main>
		<section class="hero" id="home">
			<h2>
				Welcome to <span>WhiteBank</span>
			</h2>
			<p>Your trusted partner for modern, secure, and fast banking
				solutions.</p>
			<div class="hero-actions">
				<a href="login.jsp" class="hero-btn login">Login</a> <a
					href="Register1.jsp" class="hero-btn register">Register</a>
			</div>
		</section>

		<section class="features">
			<div class="feature-card">
				<h3>⚡ Fast Transfers</h3>
				<p>Send money to anyone instantly with our reliable banking
					network.</p>
			</div>
			<div class="feature-card">
				<h3>🔒 Secure Banking</h3>
				<p>Your data and transactions are protected with industry-grade
					encryption.</p>
			</div>
			<div class="feature-card">
				<h3>🕒 24/7 Support</h3>
				<p>Need help? Our customer care team is here for you around the
					clock.</p>
			</div>
		</section>

		<section id="services" class="page-section">
			<h2>🛠 Services</h2>
			<ul>
				<li>Online Banking</li>
				<li>Money Transfer</li>
				<li>24/7 Service</li>
				<li>Secure Bill Payments</li>
			</ul>
		</section>

		<section id="contact" class="page-section">
			<h2>📞 Contact Us</h2>
			<p>Email: support@whitebank.com</p>
			<p>Phone: +91 123456789</p>
			<p>Address: 123 Magadi road,Vijayanagar, Mumbai, India</p>
		</section>

		<section id="about" class="page-section">
			<h2>ℹ️ About Us</h2>
			<p>WhiteBank is committed to revolutionizing banking with
				security, speed, and simplicity. We are a digital-first bank that
				puts our customers at the heart of everything we do.</p>
		</section>
	</main>

	<footer>
		<p>&copy; 2025 WhiteBank. All rights reserved.</p>
	</footer>

</body>
</html>

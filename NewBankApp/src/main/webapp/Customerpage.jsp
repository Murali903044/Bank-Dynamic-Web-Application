
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.NewBank.dto.Customer"%>
<%@ page import="com.NewBank.dto.Transaction"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background:
		url(https://png.pngtree.com/thumb_back/fh260/background/20230630/pngtree-d-illustration-of-a-blue-background-bank-building-featuring-spanish-text-image_3700313.jpg)
		no-repeat center center fixed;
	background-size: cover;
	height: 100vh;
	backdrop-filter: blur(5px);
}

.header {
	background-color: #333;
	padding: 10px 20px;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	color: white;
	font-size: 24px;
	font-weight: bold;
}

.nav-links {
	list-style: none;
	display: flex;
	gap: 20px;
}

.nav-links li a {
	color: white;
	text-decoration: none;
	font-size: 16px;
	padding: 8px 12px;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.nav-links li a:hover {
	background-color: #4CAF50;
}

.logout .logout-btn {
	color: white;
	text-decoration: none;
	background-color: #e60000;
	padding: 8px 15px;
	border-radius: 5px;
	font-weight: 500;
	transition: background-color 0.3s ease;
}

.logout .logout-btn:hover {
	background-color: #ff1a1a;
}

.sub-main {
	background-color: rgba(255, 255, 255, 0.1);
	color: black;
	padding: 30px 40px;
	border: 2px solid #fff;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
	text-align: center;
	width: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.button-container {
	display: flex;
	justify-content: center;
	gap: 10px;
	flex-wrap: wrap;
	margin-top: 20px;
}

.btn {
	margin: 10px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	background-color: #d7f321a5;
	color: rgb(119, 99, 99);
	border: solid 0.8px #444;
	border-radius: 20px;
	transition: background-color 0.5s;
	width: 180px;
	text-align: center;
}

.btn a {
	text-decoration: none;
	color: inherit;
}

.btn a:hover {
	color: #fff;
}

.btn:hover {
	background-color: #45a049;
	color: #333;
}

.show {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 65vh;
}

.details {
	color: white;
	padding: 20px;
	border: 3px solid rgb(205, 28, 28);
	border-radius: 10px;
	background-color: green;
	text-align: center;
	width: 300px;
}

html {
	scroll-behavior: smooth;
}

.page-section {
	background-color: rgba(255, 255, 255, 0.8);
	margin: 60px auto;
	padding: 40px 20px;
	max-width: 800px;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.page-section h2 {
	color: #222;
	margin-bottom: 15px;
	text-align: center;
	font-size: 28px;
	border-bottom: 2px solid #ccc;
	padding-bottom: 10px;
}

.page-section p, .page-section ul {
	color: #333;
	font-size: 18px;
	line-height: 1.6;
	text-align: center;
}
</style>
</head>
<body>

	<%  Customer cus = (Customer) session.getAttribute("customer");%>

	<header class="header">
		<nav class="navbar">
			<div class="logo">WhiteBank</div>
			<ul class="nav-links">
				<li><a href="#home">Home</a></li>
				<li><a href="#services">Services</a></li>
				<li><a href="#contactus">Contact Us</a></li>
				<li><a href="#aboutus">About Us</a></li>
			</ul>
			<form action="logout" method="post">
				<div class="logout">
					<a href="login.jsp" class="logout-btn">Logout</a>
				</div>
			</form>
		</nav>
	</header>

	<main>
		<div class="sub-main">
			<h1 style="color: white; background-color: rgb(170, 170, 170);">
				Welcome,
				<%=cus.getName()%>
				👋
			</h1>
			<marquee style="text-size: 24px; font-weight: bold; color: skyblue">We're
				glad to have you here at WhiteBank.</marquee>
			<%
		      String suc = (String)session .getAttribute("Success");
		      if (suc != null) {
		    %>
			<h3><%=suc%></h3>
			<%} %>


			<%
		      String sucess = (String)request .getAttribute("success");
		      if (sucess != null) {
		    %>
			<h3><%=sucess%></h3>
			<%} %>

			<div class="button-container">
				<div class="btn">
					<a href="Deposit.jsp">Deposit</a>
				</div>
				<div class="btn">
					<a href="Transferamount.jsp">Transfer Amount</a>
				</div>
				<div class="btn">
					<a href="passbook.jsp">Passbook</a>
				</div>
				<div class="btn">
					<a href="updateaccount.jsp">Update Account</a>
				</div>
				<div class="btn">
					<a href="reset.jsp">Reset Pin</a>
				</div>
				<div class="btn">
					<a href="Homepage.jsp">Back</a>
				</div>
			</div>
		</div>

		<div class="show">
			<div class="details">
				<h2>
					Balance: ₹
					<%=cus.getBalance()%></h2>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>

		<div style="margin-top: 60px;"></div>

		<section id="home" class="page-section">
			<h2>Home</h2>
			<p>Welcome to WhiteBank. We provide reliable and secure banking
				solutions tailored to your needs.</p>
		</section>

		<section id="services" class="page-section">
			<h2>Services</h2>
			<ul>
				<li>Online Banking</li>
				<li>Money Transfer</li>
				<li>Deposits</li>
				<li>24/7 Support</li>
			</ul>
		</section>

		<section id="contactus" class="page-section">
			<h2>Contact Us</h2>
			<p>Email: support@whitebank.com</p>
			<p>Phone: +91 123456789</p>
			<p>Address: 123-A, Magadi main road Vijayanagar, Bengaluru</p>
		</section>

		<section id="aboutus" class="page-section">
			<h2>About Us</h2>
			<p>WhiteBank is a leading private bank in India focused on
				customer satisfaction and digital innovation in financial services.</p>
		</section>
	</main>

</body>
</html>

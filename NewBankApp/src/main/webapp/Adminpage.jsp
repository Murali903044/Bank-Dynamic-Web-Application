<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.NewBank.dto.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background:
		url(https://static.vecteezy.com/system/resources/previews/007/019/129/non_2x/businessman-holding-word-banking-in-hand-with-icon-network-connection-on-virtual-screen-dark-background-photo.jpg)
		no-repeat center center fixed;
	background-size: cover;
	backdrop-filter: blur(4px);
	color: #333;
}

header {
	background-color: #222;
	padding: 15px 0;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
}

.nav-links {
	list-style: none;
	display: flex;
	justify-content: center;
	gap: 30px;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-size: 18px;
	padding: 10px 25px;
	border-radius: 6px;
	transition: 0.3s ease-in-out;
}

.nav-links a:hover {
	background-color: #4CAF50;
	transform: scale(1.1);
}

.sub-main {
	background-color: rgba(255, 255, 255, 0.8);
	color: #333;
	text-align: center;
	margin: 20px auto;
	padding: 20px;
	width: 80%;
	border-radius: 8px;
	border: 1px solid #aaa;
	font-size: 22px;
	font-weight: bold;
}

.button-container {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 20px;
	margin: 30px 0;
}

.btn {
	background: linear-gradient(135deg, #f9d423, #ff4e50);
	border: none;
	border-radius: 25px;
	padding: 15px 30px;
	font-size: 16px;
	font-weight: 600;
	color: white;
	cursor: pointer;
	transition: 0.4s;
}

.btn a {
	text-decoration: none;
	color: white;
}

.btn:hover {
	background: linear-gradient(135deg, #4CAF50, #2E8B57);
	transform: translateY(-2px);
}

.show {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 30px;
	margin-bottom: 40px;
}

.details {
	background-color: rgba(255, 255, 255, 0.85);
	padding: 30px;
	border-radius: 15px;
	border: 2px solid #ff4e50;
	width: 250px;
	text-align: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease;
}

.details:hover {
	transform: scale(1.05);
}

.details h2 {
	font-size: 24px;
	color: #ff4e50;
}

@media ( max-width : 768px) {
	.nav-links {
		flex-direction: column;
	}
	.button-container {
		flex-direction: column;
		align-items: center;
	}
	.show {
		flex-direction: column;
		align-items: center;
	}
}
</style>
</head>
<body>
	<header class="header"> </header>

	<main>
		<div class="sub-main">
			<% Customer user = (Customer) session.getAttribute("customer");
               if (user != null) { %>
			Welcome Admin-
			<%= user.getName() %>!
			<% } else { %>
			Welcome, Admin!
			<% } %>
		</div>

		<div class="button-container">
			<button class="btn">
				<a href="Customerdetails.jsp">Customer Details</a>
			</button>
			<button class="btn">
				<a href="Transactiondetails.jsp">Transaction List</a>
			</button>
			<button class="btn">
				<a href="Customerpage.jsp">Access Your Account</a>
			</button>
			<button class="btn">
				<a href="Homepage.jsp">Back</a>
			</button>
		</div>

		<div class="show">
			<div class="details">
				<h2>Balance</h2>
				<p>
					₹
					<%=user.getBalance() %></p>
			</div>
			<div class="details">
				<h2>Transactions</h2>
				<p>15 Transactions</p>
			</div>
			<div class="details">
				<h2>Loan Info</h2>
				<p>No active loans</p>
			</div>
		</div>
	</main>
</body>
</html>

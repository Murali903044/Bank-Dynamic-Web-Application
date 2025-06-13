<%@page import="com.NewBank.dto.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.NewBank.DAO.CustomerDAO"%>
<%@page import="com.NewBank.DAO.CustomerDAOimpl"%>
<%@page import="com.NewBank.DAO.* "%>
<%@page import="com.NewBank.dto.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Details</title>
<style>
* {
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
}

body {
	background:
		url('https://png.pngtree.com/thumb_back/fh260/background/20230630/pngtree-d-illustration-of-a-blue-background-bank-building-featuring-spanish-text-image_3700313.jpg')
		no-repeat;
	backdrop-filter: blur(3px);
	background-size: cover;
	color: #000;
	padding: 40px 20px;
}

h1 {
	text-align: center;
	color: white;
	margin-bottom: 30px;
	font-size: 30px;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.7);
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: white;
	border-radius: 10px;
	overflow: hidden;
	backdrop-filter: blur(2px);
	background: transparent;
}

thead {
	background-color: #222;
	color: white;
}

thead th {
	padding: 15px;
	font-size: 16px;
	text-transform: uppercase;
}

tbody td {
	color: black;
	padding: 12px 15px;
	font-size: 20px;
	border-bottom: 1px solid #ccc;
}

tbody tr:hover {
	background-color: #f2f2f2;
}

.btn-delete {
	padding: 8px 16px;
	border: none;
	background-color: #e74c3c;
	color: white;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn-delete:hover {
	background-color: #c0392b;
}

@media ( max-width : 768px) {
	table, thead, tbody, th, td, tr {
		font-size: 14px;
	}
	h1 {
		font-size: 28px;
	}
	.btn-delete {
		padding: 6px 12px;
	}
}
</style>
</head>
<body>
	<h1>Transaction Details</h1>
	<%Customer c1=(Customer)session.getAttribute("customer"); %>
	<table>
		<thead>
			<tr>
				<th>Transaction ID</th>
				<th>Transaction Number</th>
				<th>Transaction Type</th>
				<th>Transaction Date</th>
				<th>Current Balance</th>
			</tr>
		</thead>
		<tbody>
			<%
        TransactionDAO tdao = new TransactionDAOimpl(); 
        ArrayList<Transaction> tlist = tdao.getTransaction(c1.getACC_NO());
        for(Transaction c : tlist) {
      %>
			<tr>
				<td><%= c.getTransactionId() %></td>
				<td><%= c.getUser()   %></td>
				<td><%= c.getTransaction() %></td>
				<td><%= c.getDate() %></td>
				<td><%= c.getBalance() %></td>

			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>

<%@page import="com.NewBank.dto.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.NewBank.DAO.TransactionDAO"%>
<%@page import="com.NewBank.DAO.TransactionDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transaction Details</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background:
		url(https://previews.123rf.com/images/sylverarts/sylverarts1701/sylverarts170100132/68942839-banking-conceptual-logo-unique-vector-symbol-banking-system.jpg)
		no-repeat center center fixed;
	background-size: cover;
	backdrop-filter: blur(6px);
	padding: 30px;
	color: #333;
}

h1 {
	text-align: center;
	font-size: 32px;
	margin-bottom: 30px;
	color: #222;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
	letter-spacing: 1px;
}

.main {
	width: 95%;
	max-width: 1200px;
	margin: auto;
	background: rgba(255, 255, 255, 0.95);
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
	overflow: hidden;
	border-radius: 8px;
}

thead {
	background-color: #000;
	color: #fff;
}

thead th {
	padding: 14px 20px;
	font-size: 15px;
	letter-spacing: 1px;
}

tbody td {
	padding: 12px 18px;
	border-bottom: 1px solid #ddd;
	font-size: 14px;
}

tbody tr:hover {
	background-color: #f9f9f9;
	transition: 0.3s ease;
}

@media ( max-width : 768px) {
	.main {
		padding: 15px;
	}
	h1 {
		font-size: 24px;
	}
	thead th, tbody td {
		padding: 10px;
		font-size: 13px;
	}
}
</style>
</head>
<body>
	<div class="main">
		<h1>Transaction Details</h1>
		<table>
			<thead>
				<tr>
					<th>Sender AC No</th>
					<th>Receiver AC No</th>
					<th>Date</th>
					<th>Transaction Type</th>
					<th>Amount</th>
					<th>Balance</th>
				</tr>
			</thead>
			<tbody>
				<%
          TransactionDAO tdao = new TransactionDAOimpl(); 
          ArrayList<Transaction> transactionlist = tdao.getTransaction();
          for(Transaction t : transactionlist) {
        %>
				<tr>
					<td><%= t.getUser() %></td>
					<td><%= t.getRec_acc() %></td>
					<td><%= t.getDate() %></td>
					<td><%= t.getTransaction() %></td>
					<td><%= t.getAmount() %></td>
					<td><%= t.getBalance() %></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>

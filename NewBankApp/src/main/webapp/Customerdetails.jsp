<%@page import="com.NewBank.dto.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.NewBank.DAO.CustomerDAO"%>
<%@page import="com.NewBank.DAO.CustomerDAOimpl"%>
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
		url(https://png.pngtree.com/thumb_back/fh260/background/20230630/pngtree-d-illustration-of-a-blue-background-bank-building-featuring-spanish-text-image_3700313.jpg)
		no-repeat center center fixed;
	background-size: cover;
	color: #000;
	backdrop-filter: blur(5px);
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
	background-color: transparent;
	border-radius: 10px;
	overflow: hidden;
	backdrop-filter: blur(2px);
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
	<h1>Customer Details</h1>
	<table>
		<thead>
			<tr>
				<th>Account No</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Mail</th>
				<th>Balance</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<%
        CustomerDAO cdao = new CustomerDAOimpl(); 
        ArrayList<Customer> customerlist = cdao.getCustomer();
        for(Customer c : customerlist) {
      %>
			<tr>
				<td><%= c.getACC_NO() %></td>
				<td><%= c.getName() %></td>
				<td><%= c.getPhone() %></td>
				<td><%= c.getMail() %></td>
				<td><%= c.getBalance() %></td>
				<td>
					<form action="delete" method="post">
						<input type="hidden" name="id" value="<%= c.getACC_NO() %>">
						<button type="submit" class="btn-delete">Delete</button>
					</form>
				</td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.NewBank.dto.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
* {
	margin: 0px;
	padding: 0px;
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
	background: transparent;
	color: white;
	border: 0.2px inset #fff;
	border-radius: 10px;
	padding: 30px 40px;
}

.wrapper h1 {
	font-size: 36px;
	text-align: center;
}

.wrapper .input-box {
	width: 100%;
	height: 50px;
	margin: 30px 0;
}

.input-box input {
	width: 100%;
	height: 100%;
	background: transparent;
	border: none;
	outline: none;
	border: 2px solid rgba(255, 255, 255, .2);
	border-radius: 40px;
	font-size: 16px;
	color: #fff;
	padding: 20px 45px 20px 20px;
}

.input-box input::placeholder {
	color: #fff;
}

.input-box i {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 20px;
}

.wrapper .remember-forgot {
	display: flex;
	justify-content: space-between;
	font-size: 14.5px;
	margin: -15px 0 15px;
}

.wrapper .btn {
	width: 100%;
	height: 45px;
	background: #fff;
	border: none;
	outline: none;
	border-radius: 40px;
	box-shadow: 0 0 10px rgba(0, 0, 0, .1);
	font-size: 16px;
	color: #333;
	font-weight: 600;
}

.wrapper .btn:hover {
	background-color: aqua;
	color: #333;
}

.wrapper .register-link {
	font-size: 14.5px;
	text-align: center;
	margin: 20px 0 15px;
}

.register-link p a {
	color: #fff;
	text-decoration: none;
	margin-top: 20px;
}

.register-link p a:hover {
	text-decoration: underline;
}

.btn a {
	text-decoration: none;
	color: #333;
}
</style>
</head>
<body>
	<div class="wrapper">
		<form action="update" method="post">
			<center>
				<h1>Update Account</h1>

				<%Customer user=(Customer)session.getAttribute("Customer"); 
			if(user!=null){%>

				<%String s=(String)session.getAttribute("success");
			if(s!=null){%>
				<h3><%=s%></h3>
				<%}%>

				<%String e=(String)session.getAttribute("fail");
			if(e!=null){%>
				<h3><%=e %></h3>
				<%} %>

				<%String es=(String)request.getAttribute("fail");
			if(es!=null){%>
				<h3><%=es %></h3>
				<%} %>
			</center>
			<div class="input-box">
				<input type="text" name="name" placeholder="Enter your Name"
					value=<%user.getName(); %> required> <i class='bx bxs-user'></i>
			</div>
			<div class="input-box">
				<input type="tel" name="phone" placeholder="Enter a number"
					value=<%user.getPhone(); %> required> <i
					class='bx bxs-lock-alt'></i>
			</div>
			<div class="input-box">
				<input type="text" name="mail" placeholder="Enter your mail"
					value=<%user.getMail(); %> required> <i
					class='bx bxs-lock-alt'></i>
			</div>
			<button type="submit" class="btn">
				<a href="dashboard.jsp">Update</a>
			</button>
			<div class="register-link">
				<p>
					<a href="dashboard.jsp">Back</a>
				</p>
			</div>
		</form>
	</div>
	<%} %>
</body>
</html>
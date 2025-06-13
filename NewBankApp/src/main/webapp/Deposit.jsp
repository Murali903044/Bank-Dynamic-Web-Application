<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.NewBank.dto.*"%>
<%@page import="com.NewBank.DAO.*"%>
<%@page import="com.NewBank.DAO.* "%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deposit</title>
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
	font-weight: 30px;
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

.remember-forgot label {
	accent-color: #fff;
	margin-right: 3px;
}

.remember-forgot a {
	color: #fff;
	text-decoration: none;
}

.remember-forgot a:hover {
	text-decoration: underline;
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
</style>
</head>
<body>
	<div class="wrapper">
		<form action="deposit" method="post">
			<h1>Desposit Amount</h1>
			<center>
				<%String fail=(String)request.getAttribute("customer");
            if(fail!=null){%>
				<%=fail%>
				<br>
				<%}%>

			</center>

			<div class="input-box">
				<input type="text" name="amount" placeholder="Enter Money" required>
				<i class='bx bxs-user'></i>
			</div>

			<button type="submit" class="btn">Deposit</button>

		</form>
	</div>
</body>
</html>
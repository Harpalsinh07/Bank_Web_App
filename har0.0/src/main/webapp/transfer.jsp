<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<style>
.fbody {
	margin: auto;
	width: 700px;
	height: 660px;
}

.nav {
	margin: auto;
	width: 700px;
	height: 180px;
	background-color: #34495e;
	/* display: inline-block; */
}

label.logo {
	font-size: 35px;
	font-weight: bold;
	color: white;
	padding: 0 100px;
	line-height: 80px;
}

ul {
	float: right;
	margin-right: 100px;
}

li {
	display: inline-block;
	margin: 0 8px;
	line-height: 80px;
	/* width: 20vh; */
	/* margin-right: 2px; */
}

a {
	color: white;
	font-size: 10px;
	text-transform: uppercase;
	border: 1px solid transparent;
	padding: 7px 10px;
	border-radius: 3px;
	text-decoration: none;
}

a:hover {
	border: 1px solid white;
	transition: .5s;
	color: rgb(192, 224, 245);
}

.div1 {
	margin: auto;
	text-align: center;
	padding: 70px 0;
	width: 700px;
	height: 425px;
	color: white;
	background: no-repeat url("C:/Users/Harpalsinh/Desktop/webprac/2.jpg");
}

.center {
	margin-left: auto;
	margin-right: auto;
}
</style>
<script type="text/javascript">
 function printMassage () {
	 <% String p = (String)request.getAttribute("p"); %>
	 var text = "<%=p%>";
	 if (text == "success"){
		 document.getElementById("massage").innerHTML = "Money Transfered Successfully";
	 }else if (text == "fail"){
		 document.getElementById("massage").innerHTML = "Something Went Wrong";
		 
	 }
	 
 }

</script>

</head>

<body onload="printMassage()">
	<div class="fbody">
		<div class="nav">

			<label class="logo">Bank</label>



			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="add.jsp">Add Money</a></li>
				<li><a href="transfer.jsp">Transfer Money</a></li>
				<li><a href="withdraw.jsp">Withdraw Money</a></li>
				<!-- <li><a href="login.html" style="font-weight: bold; ">Login</a></li> -->
			</ul>

		</div>
		<div class="div1">
		<h2 style="color: white;">Enter Following Details For Transfer Money</h2>
			<form action="Transfer" method="post">
				<table class="center" style="color:white;'">
					<tr>
						<td>Name of Customer</td>
						<td>:</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>Account No of Customer</td>
						<td>:</td>
						<td><input type="text" name="account1"></td>
					</tr>
					<tr>
						<td>Account No of Receiver</td>
						<td>:</td>
						<td><input type="text" name="account2"></td>
					</tr>
					<tr>
						<td>Enter Amount For Transfer</td>
						<td>:</td>
						<td><input type="text" name="amount"></td>
					</tr>
					<tr>
						<td colspan="3" align="center" ><input type="submit" value="Transfer"></td>
					</tr>

				</table>
			</form>
			
			<h2 style="color: white;" id="massage"></h2>




		</div>
	</div>
</body>

</html>
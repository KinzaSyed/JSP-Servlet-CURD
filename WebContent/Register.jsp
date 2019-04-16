<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.come/ajax/libs/jquery/3.3.1/jquery.min.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.css"></script>

<title>REGISTER</title>
</head>
<body>
	<center>
	<div class="container">
	<h2>Assignment CRUDS</h2>
		<form action="AdminController" method="post">
			<table class="table table-bordered" style="width:60%;">
				<thead>
					<tr>
					<th colspan="2"><center>Admin Registration</center></th>
					</tr>
				</thead>
			<tbody>
				<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">First Name</td>
			<td><input type="text" name="FirstName" required="required" placeholder="FirstName" class="form-control"></td>
				</tr>
				
				<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">Last Name</td>
			<td><input type="text" name="LastName" required="required" placeholder="LastName" class="form-control"></td>
				</tr>
				
				<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">UserName</td>
			<td><input type="text" name="UserName" required="required" placeholder="UserName" class="form-control"></td>
				</tr>
				
				<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">Password</td>
			<td><input type="password" name="Password" required="required" placeholder="*******" class="form-control"></td>
				
				</tr>
			
				<tr>
					<td></td>
					<td>
			<input type="submit" name="submit" value="register" class="btn btn-primary">
			<input style="text-align: center;" type="reset" value="Reset" class="btn btn-info">
			
					
					</td>
				</tr>
			
			</tbody>
	</table>
		<a href="Login.jsp" style="text-align: center;">Login</a>
		
		</form>
	</div>
</center>
	
</body>
</html>
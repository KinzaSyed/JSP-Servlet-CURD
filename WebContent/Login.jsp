<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.come/ajax/libs/jquery/3.3.1/jquery.min.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.css"></script>

<title>LOGIN HERE</title>
</head>
<body>
<center>
	<div class="container">
		<h2>Assignment CRUDS</h2>
		
		<%
			String error=(String) session.getAttribute("error");
			if(error == null){
				
			}
			else{
				out.print("<div class='alert alert-danger' style='width:50%;' >"+error+"</div>");
				session.removeAttribute("error");
			}
		
		%>
		
<form action="AdminController" method="post">
<h1>${message}</h1>
<h2>${successfullMessage}</h2>

	<table class="table table-bordered" style="width: 60%;">
			<thead>
			<tr>
				<th colspan="2"><center>Admin Login</center></th>
			</tr>
			</thead>
		<tbody>
			<tr>
			
				<td style="text-align: center; padding-top: 15px; font-weight: bold;">UserName</td>
				<td><input type="text" name="username" required="required" placeholder="UserName" class="form-control"></td>	
				
			</tr>
			
			<tr>
				<td style="text-align: center; padding-top: 15px; font-weight: bold;">Password</td>
				<td><input type="password" name="password" required="required" placeholder="******" class="form-control"></td>
			</tr>
			
			<tr>
				<td></td>
				<td>
					<input type="submit" name="submit" value="login" class="btn btn-primary">
					<input style="text-align: center;" type="reset" value="Reset" class="btn btn-info">
						
				</td>
			
			</tr>
		</tbody> 
	</table>	
		<a href="Register.jsp" style="text-align: center;">Register</a>
		
</form>

	</div>
</center>

</body>
</html>
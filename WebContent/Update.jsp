<%@page import="com.work.Model.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.come/ajax/libs/jquery/3.3.1/jquery.min.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.css"></script>

<title>UPDATE ADMIN</title>
</head>
<body>
<%
	
%>
	<center>
	<div class="container">
	<h2>Assignment CRUDS</h2>
		<form action="AdminController" method="post">
			<table class="table table-bordered" style="width:60%;">
				<thead>
					<tr>
					<th colspan="2"><center>Admin Update</center></th>
					</tr>
				</thead>
			<tbody>
				<tr>
				<td style="text-align: center; padding-top: 15px; font-weight: bold;">ID</td>
				<td><input type="text" readonly="readonly" class="form-control" name="AdminId" value="<c:out value="${update.getId()}" />" /></td> 
			</tr>
			<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">First Name</td>
			<td><input type="text" name="FName" required="required" class="form-control" value="<c:out value="${update.getFirstName()}" />" ></td>
				</tr>
				
				<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">Last Name</td>
			<td><input type="text" name="LName" required="required" class="form-control" value="<c:out value="${update.getLastName()}" />" ></td>
				</tr>
				
				<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">UserName</td>
			<td><input type="text" name="UName" required="required" class="form-control" value="<c:out value="${update.getUserName()}" />"></td>
				</tr>
				
				<tr>
			<td style="text-align: center; padding-top: 15px; font-weight: bold;">Password</td>
			<td><input type="password" name="Pwd" required="required" class="form-control" value="<c:out value="${update.getPassword()}" />" ></td>
				
				</tr>
			
				<tr>
					<td></td>
					<td>
			<input type="submit" name="submit" value="update" class="btn btn-primary">
			
			
					
					</td>
				</tr>
			
			</tbody>
	</table>
		
		
		</form>
	</div>
</center>
</body>
</html>
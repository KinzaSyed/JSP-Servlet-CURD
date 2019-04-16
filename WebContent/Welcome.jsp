<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Admins</title>

<meta name="viewport" content="width=device-width, initial-scale=1" >
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.css"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#myTable').dataTable();
	});
</script>

</head>
<body>
<%
	String Username = (String)session.getAttribute("username");
	if(Username!=null){
%>
	<center><h2>All Admins <br>[Welcome ,<%=Username%>]</h2></center>
	<table id="myTable" class="table table-striped">
	<thead>
		<tr>
			<th>ID</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>UserName</th>
			<th>DateCreated</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		
	<c:forEach items="${list}" var="admin">
		<tr>
			<td><c:out value="${admin.getId()}"></c:out></td>
			<td><c:out value="${admin.getFirstName()}"></c:out></td>
			<td><c:out value="${admin.getLastName()}"></c:out></td>
			<td><c:out value="${admin.getUserName()}"></c:out></td>
			<td><fmt:formatDate value="${admin.getDateCreated()}" pattern="yyyy-MMM-dd"/></td>
			<td><a href="AdminController?action=Edit&id=<c:out value="${admin.getId()}"/>">Edit |</a>
			<a href="AdminController?action=delete&id=<c:out value="${admin.getId()}"/>">Delete</a></td>
		 <%--    <td><a href="AdminController?action=edit&Id=<c:out value="${admin.Id()}"/>">Update</a></td>
            <td><a href="AdminController?action=delete&Id=<c:out value="${admin.Id()}"/>">Delete</a></td> --%>
		
		</tr>
		
	
	
	</c:forEach>
	
	

	</tbody>
	
	</table>
	<form action="AdminController" method="post">
	<input type="submit" name="submit" value="logout" class="btn btn-info" style="margin-left: 650px;">
	</form>
<%
	}
%>

</body>
</html>
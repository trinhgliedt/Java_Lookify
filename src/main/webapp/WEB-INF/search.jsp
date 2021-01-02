<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-3 text-right">
				Songs by artist: <c:out value="${artist}"/>
			</div>
			<div class="col-4">
				<form action="/search" method="post">
					<input type="search" name="artist" placeholder="${artist}"/> 
					<input class="btn btn-sm btn-info ml-2" type="submit"  value="New Search" />
				</form>
			</div>
			<div class="col-sm"><a href="/dashboard">Dashboard</a>
			</div>
		</div>



		<table class="table mt-5 col-8">
			<thead class="">
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Rating</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${songs}" var="song">
					<tr>
						<td><a href="/songs/${song.id}"><c:out
									value="${song.title}" /></a></td>
						<td><c:out value="${song.rating}" /></td>
						<td><a href="/delete/${song.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>
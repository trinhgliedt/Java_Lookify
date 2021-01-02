<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>Lookify</title>
<!-- <style>
* {outline: 1px solid yellow};
</style> -->

</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-3">
				<a class="mr-5 ml-2" href="/new">Add New</a> 
				<a class="" href="/search/topTen">Top
					Songs</a>
			</div>
			<div class="col-4">
				<form action="/search" method="post">
					<input  type="search" name="artist" /> 
					<input class="btn btn-sm btn-info ml-2" type="submit" value="Search Artists" />
				</form>
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
						<td><a href="/${song.id}"><c:out
									value="${song.title}" /></a></td>
						<td><c:out value="${song.rating}" /></td>
						<td>
						<form style="display:inline" class= "mt-0 pt-0" action="/delete/${song.id}" method="POST">
						    <input type="hidden" name="_method" value="delete">
						    <input class="btn btn-link" role="link"  type="submit" value="Delete">
				</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>
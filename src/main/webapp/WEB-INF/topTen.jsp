<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-8">
		<div class="row mt-4">
			<div class="col-sm">Top Ten Songs:</div>
			<div class="col-sm">
				<a href="/dashboard">Dashboard</a>
			</div>
		</div>
		<table class="table table-bordered mt-3">
			<tbody>
				<c:forEach items="${songs}" var="song">
					<tr>
						<td><c:out value="${song.rating}" /></td>
						<td><a href="/songs/${song.id}"><c:out
									value="${song.title}" /></a></td>
						<td><c:out value="${song.artist}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
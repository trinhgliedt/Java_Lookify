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
	<div class="container">
            <div class="col offset-6 my-2">
                <div class="col-2">
                    <a href="/dashboard">Dashboard</a>
                </div>
            </div>
            <div class="row my-2">
                <div class="col-4">Title</div>
                <div class="col-4">${song.title}</div>
            </div>
            <div class="row my-2">
                <div class="col-4">Artist</div>
                <div class="col-4">${song.artist}</div>
            </div>
            <div class="row my-2">
                <div class="col-4">Rating(1-10)</div>
                <div class="col-4">${song.rating}</div>
            </div>
            <div class="row">
                <div class="col">
                	<form action="/delete/${song.id}" method="post">
                		<input type="hidden" value="delete" name="_method">
                		<button type="submit" class="btn btn-link">Delete</button>
                	</form>
                </div>
            </div>
        </div>
</body>
</html>
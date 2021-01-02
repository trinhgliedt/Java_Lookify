<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Insert title here</title>
<!-- <style>
* {outline: 1px solid yellow};
</style> -->
</head>
<body>
	<div class="m-5 col-8">
            <div class="row my-2">
                   <a class="col-2 offset-8" href="/dashboard">Dashboard</a>
            </div>
            <form:form action="/dashboard" method="post" modelAttribute="song">
	            <div class="row my-2">
	                <div class="col-4 text-right">Title: </div>
	                <form:input path="title" type="text" name="title" class="col-4 form-control"/>
	                <form:errors path="title" class="text-danger col" />
	            </div>
	            <div class="row my-2">
	                <div class="col-4 text-right">Artist: </div>
	                <form:input path="artist" type="text" name="artist" class="col-4 form-control"/>
	                <form:errors path="artist" class="text-danger col" />
	            </div>
	            <div class="row my-2">
	                <div class="col-4 text-right">Rating(1-10): </div>
	                <form:input path="rating" type="number" name="rating" class="col-1 form-control" min="1" max="10" value="10"/> 
	                <form:errors path="rating" class="text-danger col" />
	            </div>
	            <div class="row">
	                <div class="col">
	                    <button type="submit" class="btn btn-primary btn-sm col-2 mt-3 offset-3">Add Song</button>
	                </div>
	            </div>
            </form:form>
        </div>
</body>
</html>
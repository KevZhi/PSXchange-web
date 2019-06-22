<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="findBook"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>搜索</title>
<link href="css/bootstrap-4.0.0.css" rel="stylesheet">
</head>
<body>

	<input class="form-control mr-sm-2" name="findContent" type="search" placeholder="" aria-label="Search">
			<select name="condition" size=1 style="display:none;">
				<!-- <option  value="bookISBN"> -->
				<option Selected value="ps4_Name">
				<!--  <option  value="bookAuthor"> -->
			</select>
			<input type="radio" name="findMethod" value="start" style="display:none"><input
				type="radio" name="findMethod" value="end" style="display:none"><input
				type="radio" name="findMethod" value="contains"  style="display:none" checked="checked"> 
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit" >搜索</button>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib tagdir="/WEB-INF/tags" prefix="delete"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<% 
			String delete = request.getParameter("delete");
		response.setHeader("refresh", " 0 ;myexchange.jsp");
			
	%>
	<delete:delete delete="<%=delete%>" />
	  <% out.print(backMess); %>
</body>
</html>
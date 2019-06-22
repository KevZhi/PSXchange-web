<%@ page pageEncoding="utf-8"%>

<html>
<head>
<title>退出登录</title>
<link href="css/format.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/head.jsp"%>
	<%
		if (sessionId != null) {
			session.invalidate();
	%>
	<%
			response.setHeader("refresh", "0;index.jsp");
		} else {
			response.setHeader("refresh", "0;index.jsp");
		}
	%>
</body>
</html>
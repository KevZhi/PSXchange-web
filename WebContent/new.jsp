<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="findBook"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">
<title>搜索结果</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">
  <h2 class="header"><a href="index.jsp">PSXchange</a></h2>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
          
          </ul>
          <form class="form-inline my-2 my-lg-0" action="new.jsp">
            <%@ include file="/findps4.jsp"%>
            &nbsp;&nbsp;&nbsp;&nbsp;
		<%@ include file="/WEB-INF/head.jsp"%>
		  </form>
              </div>
              <%
		boolean isAdd = false;
		if (sessionId != null) {
			isAdd = true;
		} else {
			response.sendRedirect("login.jsp");
		}
		%>
		</div>
            </nav>
<hr>
<%
		request.setCharacterEncoding("utf-8");
		String findContent = request.getParameter("findContent");
		String condition = request.getParameter("condition");
		String findMethod = request.getParameter("findMethod");
		if ((findContent != null) && (condition != null) && (findMethod != null)) {
	%>
	<findBook:FindBook findContent="<%=findContent%>" condition="<%=condition%>"
		findMethod="<%=findMethod%>" />
<nav class="col-lg-3 col-xl-9">
  <h2 class="offset-lg-2 col-lg-11 text-left offset-xl-1 col-xl-11">“<%=findContent%>”的搜索结果 </h2>
</nav>
<hr>

<%=giveResult%>

	<%
		}
	%>
	<hr>
<footer class="text-center">
  <div class="container">
        <div class="row">
          <div class="col-12">
            <p class=footer>免责声明：本网站为爱好者成立的游戏交换网站，仅提供信息展示服务，在本网站进行的一切交易出现纠纷本站概不负责</p>
            <p class=footer>本站与所提供的服务于Sony Interactive Entertainment无关</p>
          </div>
        </div>
      </div>
    </footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap-4.0.0.js"></script>
</body>
</html>
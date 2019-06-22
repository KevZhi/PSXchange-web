<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib tagdir="/WEB-INF/tags" prefix="gamedetail"%>
          <%@ taglib tagdir="/WEB-INF/tags" prefix="ShowBookByPage"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看详情</title>
<link href="css/bootstrap-4.0.0.css" rel="stylesheet">
    <link href="jQueryAssets/jquery.ui.core.min.css" rel="stylesheet" type="text/css">
    <link href="jQueryAssets/jquery.ui.theme.min.css" rel="stylesheet" type="text/css">
    <link href="jQueryAssets/jquery.ui.progressbar.min.css" rel="stylesheet" type="text/css">
    <link href="jQueryAssets/jquery.ui.slider.min.css" rel="stylesheet" type="text/css">
  <script src="jQueryAssets/jquery-1.11.1.min.js"></script>
  <script src="jQueryAssets/jquery.ui-1.10.4.progressbar.min.js"></script>
  <script src="jQueryAssets/jquery.ui-1.10.4.slider.min.js"></script>
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
      </div>
    </nav>
<hr>
<%
		boolean isAdd = false;
		if (sessionId != null) {
			isAdd = true;
		} else {
			response.sendRedirect("login.jsp");
		}
		%>

	
<nav class="col-lg-3 col-xl-9">
  <h2 class="offset-lg-2 col-lg-11 text-left offset-xl-1 col-xl-11"><a class="unselected" href="allgames.jsp" class="aheader">全部游戏</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="aheader" >游戏详情</a></h2>
</nav>
<hr>
<%
		request.setCharacterEncoding("utf-8");
     String findContent = request.getParameter("findContent");
     String condition = request.getParameter("condition");
     String findMethod = request.getParameter("findMethod");
	
	%>
	
	<gamedetail:gamedetail findContent="<%=findContent%>" condition="<%=condition%>"
		findMethod="<%=findMethod%>" />
	<p><%=giveResult%></p>
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
  <script type="text/javascript">
$(function() {
	$( "#Progressbar1" ).progressbar(); 
});
$(function() {
	$( "#Slider1" ).slider(); 
});
  </script>
</body>
</html>
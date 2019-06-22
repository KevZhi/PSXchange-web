<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link href="css/format.css" rel="stylesheet">

<title>修改信息</title>
<!-- Bootstrap core CSS -->
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
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
<div class="container" >

      <form class="form-signin" action="" Method="post">
        <h2 class="form-signin-heading text-left">修改密码</h2>
		  
        <br>
		  <p>用户名：<%=sessionId %></p>
		  <br>

       <div id="form_item">
   <input name="oldPassword" type="password" class="form-control" placeholder="旧密码" required>
        </div>
        <div id="form_item">
        <input type="password"  name="newPassword"  class="form-control" placeholder="新密码" required>
</div>
<div id="form_item">
		<input type="password" name="reNewPassword" class="form-control" placeholder="确认密码" required>
		  </div>
		  
		  <br>
		  
        <%
		boolean isModify = false;
		if (sessionId == null) {
			response.sendRedirect("login.jsp");
		}

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String reNewPassword = request.getParameter("reNewPassword");
		if(newPassword!=null){
			if (newPassword.equals(reNewPassword)) {
	%>
	<modifyPassword:ModifyPassword logid="<%=sessionId%>"
		oldPassword="<%=oldPassword%>" newPassword="<%=newPassword%>" />
		
	<h2><%=giveResult%></h2>
	
	<%
			}else {
	%>
		<h2>两次密码不同</h2>
		<%
			}
		}
		%>
        <div id="form_item">
        <button class="btn btn-lg btn-primary btn-block" type="submit">保存</button>
        </div>
      </form>

    </div> 
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

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap-4.0.0.js"></script>
</body>
</html>
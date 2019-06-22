<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="login"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
<script src="js/checkForm.js"></script>
<title>登入页面</title>

<!-- Bootstrap core CSS -->
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>



<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">
  <h2 class="header"><a href="index.jsp">PSXchange</a></h2>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <!--<li class="nav-item active">
              
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
           
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Disabled</a>
            </li>-->
          </ul>
          <form class="form-inline my-2 my-lg-0" action="new.jsp">
            <%@ include file="/findps4.jsp"%>
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  <%@ include file="/WEB-INF/head.jsp"%>
			     
          </form>
    </div>
      </div>
    </nav>
    
	
	
     <div class="container">

      <form class="form-signin" id="login" action="" method="post">
        <h2 class="form-signin-heading text-center">登录</h2>
		  <br>
		  <div id="form_item">
        <label for="logid" class="sr-only">username</label>
        <input type="text"  name="logid" class="form-control" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\_\.]/g,'')"
				onchange="checkForm()" 
				onload="checkForm()" placeholder="用户名" required autofocus>
        </div>
        
        <div id="form_item">
        <label for="password" class="sr-only">Password</label>
        <input type="password"  name="password" class="form-control" placeholder="密码" required>
        </div>
        <%
		request.setCharacterEncoding("utf-8");
		if (sessionId == null) { //尚未登录
			String logid = request.getParameter("logid");
			String password = request.getParameter("password");
			if ((logid == null) || (password == null)) { //未填写表单
%>
<%
			} else { //已提交表单
	%>
	<login:Login logid="<%=logid%>" password="<%=password%>" />
	
<div style="color:red; font-size:12px;">
		<%=backMess%>

		</div>
	
	
	
	<%
				sessionId = (String) session.getAttribute("logid");
				if (sessionId != null) {//登录成功
					response.setHeader("refresh", "0;index.jsp");
				} else { //登录失败
					response.setHeader("refresh","");
				}
			}
		} 
	%>
	
        <div class="checkbox">
          <label>
      
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">登录</button>
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
 
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="register"%>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
<title>注册页面</title>
<!-- Bootstrap core CSS -->
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

<script src="js/checkForm.js"></script>

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
    <div class="container">

      <form class="form-signin" action="" name="form" method="post" >
        <h2 class="form-signin-heading text-center">注册新用户</h2>
        <br>
        <div id="form_item">
        <label for="logid" class="sr-only">username</label>
        <input type="text" name="logid" class="form-control" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\_\@\.]/g,'')"
				onchange="checkForm()" onload="checkForm()" placeholder="用户名，长度4～16个字符之间" required autofocus>
		</div> 
		<!-- <div id="err_id_tip"
			style="display: none; color: red; font-size: 12px;">登录名称不能为空</div> -->
		
		<div id="form_item">
		<label for="password" class="sr-only">Password</label>
        <input type="password" name="password" onchange="checkForm()" class="form-control" placeholder="密码，长度6～16个字符之间" required>
		</div>
		
		<!-- <div id="err_pswd_tip" style="display:none; color:red; font-size:12px;">密码不能为空</div>
		 -->
		<div id="form_item">
		<input type="password" name="password2" onchange="checkForm()" class="form-control" placeholder="确认密码" required>
		</div>
	 <div id="err_repswd_tip" style="display:none; color:red; font-size:12px;">两次密码必须相同</div>
	 
		<div id="form_item">
		<input type="email"  required name="email" class="form-control" placeholder="邮箱" >
		</div>
		
		<div id="form_item">
		<input type="text" required name="phone" class="form-control" placeholder="手机号" onkeyup="this.value=this.value.replace(/\D|^0/g,'')" onafterpaste="this.value=this.value.replace(/\D|^0/g,'')" class="form-control" maxlength="11">
        </div>
        
          	  		   	
<%
	
		if (sessionId == null) {
		%>
		
		
		<% 
			String logid = request.getParameter("logid");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
	%>
	
	
	<register:Register logid="<%=logid%>" password="<%=password%>"
		email="<%=email%>" phone="<%=phone%>"/>
	  <div style="color:red; font-size:12px;">
	  <% 
	  if(logid!=null && !logid.equals("")){
		  out.print(backMess); %></div>
	<%
				
				if (regSucess.equals("1")) {
					response.setHeader("refresh", "3;login.jsp");
				}else{
					response.setHeader("refresh", " ");
				}
			}else {
	%>
	
	
	
    
     <%
			}
		} else {
			
			%>
			
			
			<%
		}
	%>
        <div class="checkbox">
          <label>
      
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit" >注册</button>
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
</HTML>
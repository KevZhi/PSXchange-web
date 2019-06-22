<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyRegister"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getRegister"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
<title>修改信息</title>

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
           
      <form class="form-signin" action="" name=form>
        <h2 class="form-signin-heading text-left">修改联系方式</h2>
		  
        <br>
		  <p>用户名：<%=sessionId %></p>
		  <br>
		  <getRegister:GetRegister logid="<%=sessionId%>" />
	
		  <p>变更邮箱：</p>
		  <div id="form_item">
		<input type="email" name="email" value="<%=oldEmail%>" class="form-control" required>
		  </div>
		  <br>
		  <p>变更手机：</p>
		  <div id="form_item">
		<input type="text" name="phone" value="<%=oldPhone%>" class="form-control" onkeyup="this.value=this.value.replace(/\D|^0/g,'')" onafterpaste="this.value=this.value.replace(/\D|^0/g,'')" class="form-control" required maxlength="11">
        </div>
        	<br>
        <%
        String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		if (email!=null && phone!=null) {
        %>
	<modifyRegister:ModifyRegister logid="<%=sessionId%>" email="<%=email%>" phone="<%=phone%>" />

	<h4><%=giveResult%></h4>
	
	<% } %>

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
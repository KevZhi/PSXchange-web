<%@ page pageEncoding="utf-8"%>

<div>
		<%
			String sessionId = (String) session.getAttribute("logid");
			if (sessionId == null) { //未登录
		%>
		<nav class="nav-item dropdown"><a href="login.jsp" >登陆</a>&nbsp;&nbsp;<a href="register.jsp">注册</a></nav>
		<%
			} else { //已登录
		%>
		<nav class="nav-item dropdown"><a class="nav-link dropdown-toggle" href=# id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=sessionId%></a>
			     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="myexchange.jsp">我的发布</a>
                <a class="dropdown-item" href="ModifyPassword.jsp">修改密码</a>
                <a class="dropdown-item" href="modifyRegister.jsp">修改信息</a>
                <a class="dropdown-item" href="exitLogin.jsp">退出登陆</a>
              </div>
            </nav>
		<%
			}
		%>
</div>
<hr>

<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="logid" required="true"%>
<%@ attribute name="password" required="true"%>
<%@ attribute name="email" required="true"%>
<%@ attribute name="phone" required="true"%>
<%@ variable name-given="regSucess" scope="AT_END"%>
<%@ variable name-given="backMess" scope="AT_END"%>
<%
	if (logid == null) {
		jspContext.setAttribute("backMess", "用户名不能为空");
		jspContext.setAttribute("regSucess", "0");
	} else if (password == null) {
		jspContext.setAttribute("backMess", "两次密码不匹配");
		jspContext.setAttribute("regSucess", "0");
	} else if (logid.contains(",") || logid.contains("，")) {
		jspContext.setAttribute("backMess", "注册失败(用户名中不能有逗号)");
		jspContext.setAttribute("regSucess", "0");
	} else {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			out.print(e);//response.sendRedirect("error.jsp");       
		}
		Connection con;
		Statement sql;
		ResultSet rs;
		String condition = "INSERT INTO user VALUES";
		condition += "(" + "'" + logid;
		condition += "','" + password;
		condition += "','" + phone;
		condition += "','" + email + "')";
		try {
			//byte [] b=condition.getBytes("iso-8859-1");
			//condition=new String(b);
			String uri = "jdbc:mysql://localhost/ps4?characterEncoding=utf-8";
			con = DriverManager.getConnection(uri, "root", "mysql");
			sql = con.createStatement();
			sql.executeUpdate(condition);
			con.close();
			//byte [] c=logid.getBytes("iso-8859-1");
			//logid=new String(c);
			String mess = logid + "注册成功；3秒后自动跳转到登陆页面！";
			jspContext.setAttribute("regSucess", "1");
			jspContext.setAttribute("backMess", mess);
			con.close();
		} catch (Exception e) {
			jspContext.setAttribute("backMess", logid+"用户名已经被注册");
			jspContext.setAttribute("regSucess", "0");
		}
	}
%>



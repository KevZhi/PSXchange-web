<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="logid" required="true"%>
<%@ attribute name="password" required="true"%>
<%@ variable name-given="backMess" scope="AT_END"%>
<%
	//byte [] a=logid.getBytes("iso-8859-1");
	//logid=new String(a);
	//byte [] b=password.getBytes("iso-8859-1");
	//password=new String(b);
	String mess = "";
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		out.print(e);
	}
	Connection con;
	Statement sql;
	ResultSet rs;
	String loginMess = (String) session.getAttribute("logid");
	if (loginMess == null) {
		loginMess = "************";
	}
	if (loginMess.equals(logid)) {
		mess = logid + "已经登录了";
	} else {
		String uri = "jdbc:mysql://localhost/ps4?characterEncoding=utf-8";
		if ((logid.length() > 0) && (password.length() > 0)) {
			try {
				con = DriverManager.getConnection(uri, "root", "mysql");
				String condition = "select * from user where logid = '" + logid + "' and password ='" + password
						+ "'";
				sql = con.createStatement();
				rs = sql.executeQuery(condition);
				if (rs.next()) {
					//mess = "登录成功！欢迎您，" + logid + "！";
					session.setAttribute("logid", logid);
				} else {

					mess = "您输入的用户名" + logid + "不存在，或密码不匹配！";
				}
				con.close();
			} catch (SQLException exp) {
				mess = "问题:" + exp;
			}
		} else {
			mess = "还没有登录或您输入的用户名不存在、或密码不匹配！";
		}
	}
	jspContext.setAttribute("backMess", mess);
%>
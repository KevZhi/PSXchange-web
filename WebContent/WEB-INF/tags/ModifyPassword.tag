<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="logid" required="true"%>
<%@ attribute name="oldPassword" required="true"%>
<%@ attribute name="newPassword" required="true"%>
<%@ variable name-given="giveResult"
	variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		out.print(e);
	}
	StringBuffer str = new StringBuffer();
	Connection con;
	Statement sql;
	ResultSet rs;
	String uri = "jdbc:mysql://localhost/PS4?characterEncoding=utf-8";
	try {
		con = DriverManager.getConnection(uri, "root", "mysql");
		sql = con.createStatement();
		String s = "SELECT * FROM user where logid='" + logid
				+ "'And password='" + oldPassword + "'";
		rs = sql.executeQuery(s);
		if (rs.next()) {
			String updateString = "UPDATE user SET password='"
					+ newPassword + "' where logid='" + logid + "'";
			int m = sql.executeUpdate(updateString);
			if (m == 1) {
				str.append("密码更新成功");
				response.setHeader("refresh", "3;index.jsp");
			} else {
				str.append("密码更新失败");
			}
		} else {
			str.append("密码更新失败");
		}
		con.close();
	} catch (SQLException exp) {
		str.append("密码更新失败" + exp);
	}
	jspContext.setAttribute("giveResult", str);
%>





<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="logid" required="true"%>
<%@ variable name-given="oldEmail" scope="AT_END"%>
<%@ variable name-given="oldPhone" scope="AT_END"%>
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
	String uri = "jdbc:mysql://localhost/ps4?characterEncoding=utf-8";
	try {
		con = DriverManager.getConnection(uri, "root", "mysql");
		String query = "select phone,email FROM user WHERE logid='"
				+ logid + "'";
		sql = con.createStatement();
		rs = sql.executeQuery(query);
		if (rs.next()) {
			System.out.println(rs.getString("email"));
			jspContext.setAttribute("oldPhone", rs.getString("phone"));
			jspContext.setAttribute("oldEmail", rs.getString("email"));
			
		} else {
			System.out.println("no record");
			jspContext.setAttribute("oldPhone", "");
			jspContext.setAttribute("oldEmail", "");
			
		}
		con.close();
	} catch (SQLException exp) {
		exp.printStackTrace();
		jspContext.setAttribute("oldPhone", "");
		jspContext.setAttribute("oldEmail", "");
		
	}
%>
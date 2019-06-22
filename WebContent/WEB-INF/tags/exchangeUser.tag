<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>


<%@ attribute name="logid" required="true"%>
<%@ attribute name="ps4Name" required="true"%>
<%@ attribute name="type" required="true"%>
<%@ attribute name="price" required="true"%>
<%@ attribute name="exchange" required="true"%>
<%@ attribute name="ps4_Name" required="true"%>
<%@ attribute name="words" required="true"%>

<%@ variable name-given="regSucess" scope="AT_END"%>
<%@ variable name-given="backMess" scope="AT_END"%>

<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			out.print(e);//response.sendRedirect("error.jsp");       
		}
		Connection con;
		Statement sql;
		ResultSet rs;
		String condition = "INSERT INTO new VALUES";
		String NO = logid +type + words + ps4_Name;
		condition += "(" + "'" + logid;
		condition += "','" + ps4Name;
		condition += "','" + type;
		condition += "','" + price;
		condition += "','" + exchange;
		condition += "','" + words;
		condition += "','" + ps4_Name;
				condition += "','" + NO + "')";
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
			String mess = "成功；3秒后自动跳转";
			jspContext.setAttribute("regSucess", "1");
			jspContext.setAttribute("backMess", mess);

			con.close();
		} catch (Exception e) {
			jspContext.setAttribute("backMess", "用户名已经被注册");
			jspContext.setAttribute("regSucess", "0");
		}

%>

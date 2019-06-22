<%@ tag import="java.sql.*"%>
<%@ tag import="com.sun.rowset.*"%>
<%@ tag pageEncoding="utf-8"%>


<%@ variable name-given="giveResult2"
	variable-class="java.lang.StringBuffer" scope="AT_END"%>
	<%@ variable name-given="image"
	variable-class="java.lang.StringBuffer" scope="AT_END"%>
	
	    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">
	    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		out.print(e);
	}
	Connection con;
	Statement sql;
	ResultSet rs;

	StringBuffer presentPageResult; //当前页上的内容
	presentPageResult = new StringBuffer();
	String uri = "jdbc:mysql://localhost:3306/ps4?characterEncoding=utf-8";
	try {
		con = DriverManager.getConnection(uri, "root", "mysql");
		sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		String s = "select * from ps4_form";
		rs = sql.executeQuery(s);
		if(rs.next()){
	
		int 字段个数 = 6;
		do {
			String bookISBN = "";
			for (int k = 1; k <= 字段个数; k++) {
				if (k == 1) {
					String bookPic = "<image src=ps4_image/" + rs.getString(k)
					+ " width=200/>";
	
					
				} else if (k == 2) {
					String ps4_Pic = rs.getString(k-1);
					String ps4_Name = rs.getString(k);
					//presentPageResult.append("<td>" + bookISBNLink + "</td>");
					presentPageResult.append("<option  value=ps4_image/" + ps4_Pic + ">" + ps4_Name +"</option>");
				} else if (k == 3) {
					String enName = rs.getString(k);
				
				} else if (k == 4) 
				{
					String zhName = rs.getString(k);
					String bookNameLink = "<a href=\"lookBookAbstract.jsp?bookISBN="
							+ bookISBN + "\">" + zhName + "</a>";
					
				} else if (k == 5) 
				{
					String ps4_Developer = rs.getString(k);
					String bookNameLink = "<a href=\"lookBookAbstract.jsp?bookISBN="
							+ bookISBN + "\">" + ps4_Developer + "</a>";
					
				} else {
					
				}

			}
		}while (rs.next());}
	
	
		//presentPageResult.append("</center>");

		jspContext.setAttribute("giveResult2", presentPageResult);
		con.close();
	} catch (SQLException exp) {
		jspContext.setAttribute("showPage", new Integer(1));
		jspContext.setAttribute("pageAllCount", new Integer(1));
		jspContext.setAttribute("giveResult2",
				new StringBuffer("" + exp));
	}
%>
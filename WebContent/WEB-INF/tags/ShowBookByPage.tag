<%@ tag import="java.sql.*"%>
<%@ tag import="com.sun.rowset.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="bookAmountInPage" required="true"%>
<%@ attribute name="page" required="true"%>
<%@ attribute name="zuduanAmount" required="true"%>
<%@ variable name-given="showPage" variable-class="java.lang.Integer"
	scope="AT_END"%>
<%@ variable name-given="pageAllCount"
	variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="giveResult"
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
	int pageSize = Integer.parseInt(bookAmountInPage); //每页显示的记录数
	int allPages = 0; //分页后的总页数
	int show = Integer.parseInt(page); //当前显示页 
	StringBuffer presentPageResult; //当前页上的内容
	CachedRowSetImpl rowSet;
	presentPageResult = new StringBuffer();
	String uri = "jdbc:mysql://localhost:3306/ps4?characterEncoding=utf-8";
	try {
		con = DriverManager.getConnection(uri, "root", "mysql");
		sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		String s = "select * from ps4_form";
		rs = sql.executeQuery(s);
		rowSet = new CachedRowSetImpl(); //创建行集对象
		rowSet.populate(rs);
		con.close(); //关闭连接 
		rowSet.last();
		int m = rowSet.getRow(); //总行数
		int n = pageSize;
		allPages = ((m % n) == 0) ? (m / n) : (m / n + 1);
		int p = Integer.parseInt(page);
		if (p > allPages)
			p = 1;
		if (p <= 0)
			p = allPages;
		jspContext.setAttribute("showPage", new Integer(p));
		jspContext.setAttribute("pageAllCount", new Integer(allPages));
		//presentPageResult.append("<center>");
		//presentPageResult.append("<table border=1>");
		//presentPageResult.append("<tr>");
		//presentPageResult.append("<th>封面</td>");
		//presentPageResult.append("<th>ISBN</td>");
		//presentPageResult.append("<th>图书名称</td>");
		//presentPageResult.append("<th>作者</td>");
		//presentPageResult.append("<th>价格</td>");
		//presentPageResult.append("<th>出版社</td>");
		//presentPageResult.append("</tr>");
		
		rowSet.absolute((p - 1) * pageSize + 1);
		presentPageResult.append("<div class=container>");
		presentPageResult.append("<table width=100% border=0 cellspacing=30 cellpadding=30>");
		presentPageResult.append("<tbody>");
		int 字段个数 = 6;
		double j=1;
	
		for (int i = 1; i <= pageSize; i++) {
			if(i%2 != 0){presentPageResult.append("<tr>" );}
			String bookISBN = "";
			for (int k = 1; k <= 字段个数; k++) {
				if (k == 1) {
					String bookPic = "<img src=ps4_image/"
							+ rowSet.getString(k)
							+ " width=200>";
					presentPageResult
							.append(  "<td>" + bookPic + "</td>" + "<td valign=middle>");
				} else if (k == 2) {
					String ps4Name = rowSet.getString(k);
					
					String bookISBNLink = "<a href=\"lookBookAbstract.jsp?bookISBN="
							+ bookISBN + "\">" + bookISBN + "</a>";
					//presentPageResult.append("<td>" + bookISBNLink + "</td>");
				} else if (k == 3) {
					String enName = rowSet.getString(k);
					
					presentPageResult.append("<h5>" + enName +"</h5>");
				} else if (k == 4) 
				{
					String zhName = rowSet.getString(k);
							presentPageResult.append("<h6>" + zhName +"</h6>");
				} else if (k == 5) 
				{
					String ps4_Developer = rowSet.getString(k);
							presentPageResult.append("<p>" + ps4_Developer +"</p>");
				} else if (k == 6) 
				{
					String number = rowSet.getString(k);
					presentPageResult.append("<form action=gamedetail.jsp><input class=form-control mr-sm-2 name=findContent type=search style=display:none value=" + number + " aria-label=Search>"
							+"<select name=condition style=display:none;>"
					+ "<option Selected value=number>" + "</select>"
                 + "<input	type=radio name=findMethod value=contains  style=display:none checked=checked>"+ "<button class=btn btn-lg btn-primary btn-block type=submit>查看详情</button></form></td>");
					
				}  else{
	
				}

			}
			j++;
			if(j%2 != 0){presentPageResult.append("</tr>");}
			boolean boo = rowSet.next();
			if (boo == false)
				break;
		}
		presentPageResult.append("</table>");
		//presentPageResult.append("</center>");
		jspContext.setAttribute("giveResult", presentPageResult);
		con.close();
	} catch (SQLException exp) {
		jspContext.setAttribute("showPage", new Integer(1));
		jspContext.setAttribute("pageAllCount", new Integer(1));
		jspContext.setAttribute("giveResult",
				new StringBuffer("" + exp));
	}
%>




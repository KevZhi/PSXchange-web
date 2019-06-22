<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="findContent" required="true"%>
<%@ attribute name="condition" required="true"%>
<%@ attribute name="findMethod" required="true"%>
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
	StringBuffer queryResult = new StringBuffer(); //查询结果
	String uri = "jdbc:mysql://localhost/ps4?characterEncoding=utf-8";
	try {
		con = DriverManager.getConnection(uri, "root", "mysql");
		sql = con.createStatement();
		String s = "";
		s = "select * from ps4_form where " + condition
					+ " Like '%" + findContent + "%'";
		rs = sql.executeQuery(s);
		if(rs.next()){
		//queryResult.append("<table border=0>");
		//queryResult.append("<tr>");
		//queryResult.append("封面");
		//queryResult.append("图书名称");
		queryResult.append("<div class=container>");
		queryResult.append("<table width=100% border=0 cellspacing=30 cellpadding=30>");
		queryResult.append("<tbody>");
		int 字段个数 = 6;
		double i=1;
		if(i%2 != 0){
			queryResult.append("<tr>");}
		do {
			
			String bookISBN = "";
			for (int k = 1; k <= 字段个数; k++) 
			{
				if (k == 1) 
				{
					String bookPic = "<image src=ps4_image/" + rs.getString(k)
							+ " width=200/>";
					queryResult.append("<td>"+ bookPic + "</td>");
					queryResult.append("<td valign=middle>");
				} else if (k == 2) 
				{
					
					
				
				} else if (k == 3) 
				{
					String enName = rs.getString(k);
					
					queryResult.append("<h5>" + enName +"</h5>");
				} else if (k == 4) 
				{
					String zhName = rs.getString(k);
		
					queryResult.append("<h6>" + zhName +"</h6>");
				} else if (k == 5) 
				{
					String ps4_Developer = rs.getString(k);
					queryResult.append("<p>" + ps4_Developer +"</p>");
				}  else if (k == 6) 
				{
					String number = rs.getString(k);
					queryResult.append("<form action=gamedetail.jsp><input class=form-control mr-sm-2 name=findContent type=search style=display:none value=" + number + " aria-label=Search>"
							+"<select name=condition style=display:none;>"
					+ "<option Selected value=number>" + "</select>"
                 + "<input	type=radio name=findMethod value=contains  style=display:none checked=checked>"+ "<button class=btn btn-lg btn-primary btn-block type=submit>查看详情</button></form></td>");
				}
				
			}
			i++;
			if(i%2 != 0){
				queryResult.append("</tr>");
				}
			
		}while (rs.next());
	
		queryResult.append("<tr style=visibility:hidden;>" + "<td>"+ "<img src=ps4_image/darksouls.jpeg width=200 alt=/>"
		        + "</td>" +
				"<td valign=middle>"
		        +"<h5>Dark Souls Remastered</h5>"
		        +"<h6>黑魂 重制版</h6>"
		        +"<p>BANDAI NAMCO</p>"
		        +"<p>%d个二手在售<br>%d个交换<br>%d个友情租借</p>"
		        +"</td>"
			      +"<td>"+"<img src=ps4_image/detroit.jpeg width=200 alt=/>"+"</td>"
			      +"<td valign=middle>"
			      
					  +"<h5>Detroit : Become Human</h5>"
			       +" <h6>底特律：成为人类</h6>"
			       +"<p>Quantic Dream</p>"
			       +"<p>%d个二手在售<br>%d个交换<br>%d个友情租借</p>"+"</td>"+"</tr>");
		
		queryResult.append("</table>");
		
		}
		
		else
		
		{
			queryResult.append("<div class=container>");
			queryResult.append("<table width=100% border=0 cellspacing=30 cellpadding=30>");
			queryResult.append("<tbody>");
			queryResult.append("<tr>" + "<td>"+ "<img src=ps4_image/exchange.png width=200 alt=/>"
			        + "</td>" +
					"<td valign=middle>" + "<h5>" + findContent
			        +"没有查寻结果</h5>"
			        //+"<h6>黑魂 重制版</h6>"
			        //+"<p>BANDAI NAMCO Entertainment Inc.</p>"
			        //+"<p>%d个二手在售<br>%d个交换<br>%d个友情租借</p>"
			        +"</td>"
				      +"<td style=visibility:hidden;>"+"<img src=ps4_image/detroit.jpeg width=200 alt=/>"+"</td>"
				      +"<td valign=middle style=visibility:hidden;>"
				      
						  +"<h5>Detroit : Become Human</h5>"
				       +" <h6>底特律：成为人类</h6>"
				       +"<p>Quantic Dream</p>"
				       +"<p>%d个二手在售<br>%d个交换<br>%d个友情租借</p>"+"</td>"+"</tr>");
			queryResult.append("</table>");
			//queryResult.append("<p>没有查寻结果！</p>");
		}
		queryResult.append("</table>");
		jspContext.setAttribute("giveResult", queryResult);
		con.close();
	} 
	catch (SQLException exp) 
	{
		jspContext.setAttribute("giveResult", new StringBuffer(
				"请给出查询条件"));
	}
%>
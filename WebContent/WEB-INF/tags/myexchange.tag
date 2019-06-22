<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="username" required="true"%>

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
		
		s = "select * from new where username " 
					+ " Like '%" + username + "%'";
		String type = "";
		String condition = "";
		rs = sql.executeQuery(s);
		if(rs.next()){
		//queryResult.append("<table border=0>");
		//queryResult.append("<tr>");
		//queryResult.append("封面");
		//queryResult.append("图书名称");
		queryResult.append("<div class=container>");
		queryResult.append("<table width=100% border=0 cellspacing=30 cellpadding=30>");
		queryResult.append("<tbody>");
		int 字段个数 = 8;
		double i=1;
		
		do {
			if(i%2 != 0){queryResult.append("<tr>" );}
			String bookISBN = "";
			for (int k = 1; k <= 字段个数; k++) 
			{
				if (k == 1) 
				{
					
					
				} else if (k == 2) 
				{
					String ps4Pic = "<image src=" + rs.getString(k)
							+ " width=200/>";
					queryResult.append("<td>"+ ps4Pic + "</td>");
					queryResult.append("<td valign=middle>");
				
				} else if (k == 3) 
				{
					type = rs.getString(k);

				} else if (k == 4) 
				{
					
				} else if (k == 5) 
				{
					
				} else if (k == 6) 
				{
					
				}else if (k == 7) 
				{
					String ps4_Name = rs.getString(k);
			         queryResult.append("<p>" + ps4_Name +"</p>");
			         if( type.equals("1") ){ queryResult.append("<p>等待售出<p>");}
			         if( type.equals("2") ){ queryResult.append("<p>等待交换<p>");}
			         if( type.equals("3") ){ queryResult.append("<p>等待转让<p>");}
				}
				else if (k == 8) 
				{
					
			         condition = "DELETE FROM new WHERE NO = '" + rs.getString(k) + "'";
			         queryResult.append("<form action=delete.jsp>" +"<input type=text name=delete value=\"" + condition + "\"style=display:none>" 
	                 + "<button class=btn btn-lg btn-primary btn-block type=submit>删除</button></form></td>");
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
					"<td valign=middle>" + "<h5>"
			        +"当前没有发布</h5>"
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
<%@ tag import="java.sql.*"%>
<%@ tag import="com.sun.rowset.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="findContent" required="true"%>
<%@ attribute name="condition" required="true"%>
<%@ attribute name="findMethod" required="true"%>

<%@ variable name-given="giveResult"
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
	Statement sql2;
	Statement sql3;
	ResultSet rs;
	ResultSet rs2;
	ResultSet rs3;
	
	int i=0;
	int h;
	StringBuffer queryResult = new StringBuffer(); //查询结果
	String uri = "jdbc:mysql://localhost/ps4?characterEncoding=utf-8";
	try {
		con = DriverManager.getConnection(uri, "root", "mysql");
		sql = con.createStatement();
		
		String s = "";
		s = "select * from ps4_form where " + condition
					+ " Like '%" + findContent + "%'";
		rs = sql.executeQuery(s);
		
		sql2 = con.createStatement();
		String text = " ";
		
		sql3 = con.createStatement();
		String name = " ";
		
		if(rs.next()){
		
		int 字段个数 = 8;
		do {
			
			String bookISBN = "";
			for (int k = 1; k <= 字段个数; k++) 
			{
				if (k == 1) 
				{
					String bookPic = "<div class=container>"
				  +"<table width=90% border=0 cellspacing=30 cellpadding=30>"
				  + "<tbody>"
				    + "<tr>"
				      + "<td width=300px valign=top><image src=ps4_image/" + rs.getString(k)
							+ " width=200/></td><td valign=top>";
					queryResult.append(bookPic);
				} else if (k == 2) 
				{
					String bookName = rs.getString(k);
					
					text = "select * from new where ps4_Name Like '%" + bookName + "%'";
					
				
				} else if (k == 3) 
				{
					String enName = rs.getString(k);
	
					queryResult.append("<h4>" + enName +"</h4>");
				} else if (k == 4) 
				{
					String zhName = rs.getString(k);
					String bookNameLink = "<a href=\"lookBookAbstract.jsp?bookISBN="
							+ bookISBN + "\">" + zhName + "</a>";
					queryResult.append("<h5>" + zhName +"</h5>");
				} else if (k == 5) 
				{
					String ps4_Developer = rs.getString(k);
				
					queryResult.append("<p>" + ps4_Developer +"</p>");
				} else if(k == 6 )
				{
					
				}
				else if(k == 7 )
				{
					String story = rs.getString(k);
					queryResult.append("<p>" + story +"</p><br>");
				}
				
			}
			
			
		}while (rs.next());
	
		
		}
		
		
		else
		
		{
			
		}
		
		rs2 = sql2.executeQuery(text);
		
		String type = " ";
		String exchange = " ";
		String userName = " ";
		String price = " ";
		String words = " ";

		if(rs2.next()){do {i++;}
		while (rs2.next());}
		
		queryResult.append("<h5>" + i + "条信息</h5><hr><br>");
		
		rs2 = sql2.executeQuery(text);
		if(rs2.next()){do {
			
			for (int k = 1; k <= 7; k++) 
			{
				if (k == 1) 
				{
					
					userName = "<div class=dropdown show><a href=# role=button data-toggle=dropdown aria-haspopup=true aria-expanded=false><h5>用户"
				                + rs2.getString(k)
							+ "希望以";
					name = "select * from user where logid Like '%" + rs2.getString(k) + "%'";
				} else if (k == 2) 
				{
					
				
				} else if (k == 3) 
				{
					type = rs2.getString(k);
			
				} else if (k == 4) 
				{
					
					price = rs2.getString(k)+"元的价格卖出这款游戏</h5></a>";

				} else if (k == 5) 
				{
					
						exchange = rs2.getString(k)+"交换这款游戏</h5></a>";

				} else if(k == 6 )
				{
					words = rs2.getString(k);
				}
				else if(k == 7 )
				{
	

				}
				
				
				
		   }if( type.equals("1") ){
			queryResult.append(userName + price);}
		   if( type.equals("2") ){
			   queryResult.append(userName + exchange);
		   }
		   if( type.equals("3") ){
			   queryResult.append(userName + "友情转让这款游戏</h5></a>");
		   }
			rs3 = sql3.executeQuery(name);
			if(rs3.next()){do {for (int k = 1; k <=4; k++) 
			{
				if (k == 1) 
				{
					
					
				} else if (k == 2) 
				{
					
				
				} else if (k == 3) 
				{
					String phone = rs3.getString(k);
					queryResult.append("<div class=dropdown-menu><h6 class=dropdown-header>联系方式</h6><a class=dropdown-item>电话："
						+ phone + "</a>");
			
				} else if (k == 4) 
				{
					String email = rs3.getString(k);
					queryResult.append("<a class=dropdown-item>邮箱："
						 +	email + "</a>");

				} 	
				
		   }queryResult.append("<h6 class=dropdown-header>附言</h6><a class=dropdown-item>" + words + "</a></div>");
			}
			while (rs3.next());}
			queryResult.append("</div>");
			
			}while (rs2.next());}
		
		queryResult.append("</td></tbody></table></div>");
		jspContext.setAttribute("giveResult", queryResult);
		con.close();
	} 
	catch (SQLException exp) 
	{
		jspContext.setAttribute("giveResult", new StringBuffer(
				"请给出查询条件"));
	}
%>
<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="logid" required="true"%>
<%@ attribute name="email" required="true"%>
<%@ attribute name="phone" required="true"%>
<%@ variable name-given="giveResult" scope="AT_END"%>
<%
   try{
	   Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException e){
         out.print(e);       
    }
    StringBuffer str=new StringBuffer();
    Connection con;
    Statement sql; 
    ResultSet rs;
    String uri="jdbc:mysql://localhost/ps4?characterEncoding=utf-8";
    try{ 
            con=DriverManager.getConnection(uri,"root","mysql");
            String updateCondition="UPDATE user SET phone='"+phone+"',email='"+
            email +"' WHERE logid='"+logid+"'";
            sql=con.createStatement();
            int m=sql.executeUpdate(updateCondition);
            if(m==1) {
                str.append("修改信息成功");
                response.setHeader("refresh", "3;index.jsp");
            }
            else {
                str.append("更新失败");
            }
            con.close();
    }
    catch(SQLException exp){
        str.append("更新失败"+exp);
    }
    jspContext.setAttribute("giveResult",new String(str));
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib tagdir="/WEB-INF/tags" prefix="exchange"%>
       <%@ taglib tagdir="/WEB-INF/tags" prefix="exchange2"%>
    <%@ taglib tagdir="/WEB-INF/tags" prefix="exchangeUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>发布新交换</title>
<link href="css/bootstrap-4.0.0.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">
  <h2 class="header"><a href="index.jsp">PSXchange</a></h2>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
          
          </ul>
          <form class="form-inline my-2 my-lg-0" action="new.jsp">
            <%@ include file="/findps4.jsp"%>
		
			     &nbsp;&nbsp;&nbsp;&nbsp;
			     <%@ include file="/WEB-INF/head.jsp"%>
			     </form>
    </div>
      </div>
    </nav>
   <%
		boolean isAdd = false;
		if (sessionId != null) {
			isAdd = true;
		} else {
			response.sendRedirect("login.jsp");
		}
		%>
<hr>
<script type="text/javascript">
function test1(obj){
    var src = obj.value;    //获取索引值
    var obj1 = document.getElementById("ps4Name");
    var index = obj1.selectedIndex;
    var text = obj1.options[index].text;
   var img = document.createElement("img");
   imgs1.src= src;  
  document.body.appendChild(img);
  document.getElementById('ps4_Name').value= text;
  
  }
  
function test2(obj){
    var src = obj.value;    //获取索引值
    var obj1 = document.getElementById("exchange1");
    var index = obj1.selectedIndex;
    var text = obj1.options[index].text;
   var img = document.createElement("img");
   imgs2.src= src;  
  document.body.appendChild(img);
  document.getElementById('exchange').value= text;
  
  }
  
</script>

<exchange:exchange />
<exchange2:exchange2 />

<nav class="col-lg-3 col-xl-9">
  <h2 class="offset-lg-2 col-lg-11 text-left offset-xl-1 col-xl-11">发布新交换</h2>
</nav>
<hr>

<div class="container">
    <table width="80%" border="0" cellspacing="30" cellpadding="30">
  <tbody>
    <tr>
      <td width="250px" valign="top">
		  <img  id="imgs1" src="ps4_image/gtav.jpeg" width="150" alt=""/>
		  <img src="ps4_image/swapicon.png" width="150"/>
		  <img  id="imgs2" src="ps4_image/gtav.jpeg" width="150"/>
		</td>
      <td >
		  <form action=" ">
		  <p>请选择你有的游戏：</p><select id="ps4Name" name="ps4Name" width="300px" class="form-control" onchange="test1(this)">
		  <%=giveResult%>
		  </select>
		  <input type="text" name="ps4_Name" id="ps4_Name" value="Grand Theft Auto V 侠盗猎车手 5" style="display:none">
        <br>
		 <p>请选择你想要交换到的游戏：</p><select id="exchange1" name="exchange1" width="300px" class="form-control" onchange="test2(this)">
		  <%=giveResult2%>
		  </select>
		  <input type="text" name="exchange" id="exchange" value="Grand Theft Auto V 侠盗猎车手 5" style="display:none">
			  <br>
			  <p>留言：</p>
			  <textarea name="words" class="form-control" style="height:100px" required></textarea><br>
			  <input type="text" name="type" value="2"  style="display:none"> 	  
			  <%
			  request.setCharacterEncoding("utf-8");
			  String logid = sessionId;
			String words = request.getParameter("words");
			String ps4Name = request.getParameter("ps4Name");
			String type = request.getParameter("type");
			String price = request.getParameter("price");
			String exchange = request.getParameter("exchange");
			String ps4_Name = request.getParameter("ps4_Name");
			
		if (words != null) {
			%>
			
<exchangeUser:exchangeUser logid="<%=logid%>" exchange="<%=exchange %>" type="<%=type %>" price="<%=price%>" words="<%=words%>" ps4Name="<%=ps4Name%>" ps4_Name="<%=ps4_Name %>" />

		
		<%
	
	                out.print(backMess);
					response.setHeader("refresh", "3;index.jsp");
	}
					%>
			  <button class="btn btn-lg btn-primary btn-block" type="submit">发布</button>
		  </form></td>
  
  </tbody>
</table>
</div>
<hr>
<footer class="text-center">
  <div class="container">
        <div class="row">
          <div class="col-12">
            <p class=footer>免责声明：本网站为爱好者成立的游戏交换网站，仅提供信息展示服务，在本网站进行的一切交易出现纠纷本站概不负责</p>
            <p class=footer>本站与所提供的服务于Sony Interactive Entertainment无关</p>
          </div>
        </div>
  </div>
  </footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap-4.0.0.js"></script>


</body>
</html>
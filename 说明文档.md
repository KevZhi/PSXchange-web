# PSXChange PS4游戏交易交换平台

JSP 大学课程作业作业项目，非常简易
前端：KevZhi
后端：confeather

##项目说明

>如需在本地运行，请确保数据库名为ps4，用户名为root，密码为mysql
&emsp;&emsp;PSXchange 是由我们开发的一个PS4二手游戏交易交换信息网站，向用户提供了发布自己的闲置游戏信息的平台。用户可发布**二手售卖**、**游戏交换**、**友情租借**这三种类型的信息。同时，在登陆后也可浏览全部游戏列表，查看别人发布的信息，查看其联系方式与附言，并与其取得联系。因为技术水平限制，目前只支持选择库中已有的20款游戏。
&emsp;&emsp;此项目前端使用了 Bootstrap 4 框架，部分页面参考了 Bootstrap 官方示例。后端使用了JSP编写。
## 数据库设计
本网站的数据库使用MySQL 5.6，数据库名为**ps4**，共有三个表 **user**、**ps4_form**、**new**。
* **user**表负责记录用户登录信息与个人信息，结构如下

logid |password|email|phone
----|-----|-----|----
用户名|密码|邮箱|手机号

其中邮箱和手机号在用户发布交易信息时会显示在网页上

* **ps4_form**表负责记录游戏信息（商品信息），结构如下

ps4_Pic|ps4_Name|enName|cnName|ps4_Developer|number|story
---|---|---|---|---|---|---
游戏封面<br>图片路径|游戏中英文名<br>（便于搜索）|英文名|中文名|开发商|游戏编号|游戏<br>介绍

发布、游戏详情、全部游戏等页面均使用了本数据库的信息。

* **new**表负责记录用户发布的每一条交易信息（包括二手、交换、友情转让），结构如下

username|ps4Name|type|price|exchange|words|ps4_Name|NO
---|---|---|---|---|---|---|---
发布信息<br>的用户名|图片路径|交易类型<br>1:二手<br>2.交换<br>3.友情转让|售价|交换标的|附言|游戏名称|特殊<br>标记

其中，ps4Name和ps4_Name两个列，是因为在发布页面显示图片时，调出图片功能的图片路径会占用ps4Name这一列，NO一列用于展示交易信息时定位，后续会提到。


## 网站框架

* 主页（最近正流行的三个游戏）
* 全部游戏
* 搜索
* 发布新二手（新交换、友情转让）
* 单个游戏页面（浏览交易信息）
* 查看个人发布
* 注册、登录、修改个人信息


*** 


## 一、主页



* 主页主要显示手动选荐的三个游戏，并提供发布信息的链接。也可通过链接浏览**全部游戏**或**搜索**。

* 三个游戏卡片以及下方的链接使用了Bootstrap自带的`Card`样式

* 用户名处的下拉菜单使用了Bootstrap自带的`Dropdown`样式


* “查看详情”按钮实际上提交了一个隐藏的表单，功能与查找类似，但是其直接定位到某个游戏的页面，代码如下。

```html
<form action="gamedetail.jsp">
	<input class="form-control mr-sm-2" name="findContent" type="search" style="display:none;" value="？" //此处vaule是数据库中游戏特殊编号
	 aria-label="Search">
	<button type="submit">查看详情</button>
</form>
```
## 二、全部游戏


* 前端方面，**全部游戏**页面简单地使用了`<table>`分为四列，即`图片|文字与按钮|图片|文字与按钮`的形式，并固定列宽。
* 后端修改使用了`ShowBookByPage.tag`。使用`k`控制读取数据库的每一条记录，`presentPageResult.append`循环生成每一条`<td>``</td>`中的内容，并进行分页。并且使用变量`i`控制奇偶，生成`<tr>``</tr>`进行分行。“查看详情”同样使用首页中的方法提交隐藏表单

``` java
double j=1
        for (int i = 1; i <= pageSize; i++) {
            if(j%2 != 0){presentPageResult.append("<tr>" );}
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
                  ······
                }

            }
            j++;
            if(j%2 != 0){presentPageResult.append("</tr>");}
            boolean boo = rowSet.next();
            if (boo == false)
                break;
        }
```
## 三、搜索结果


* 搜索结果页面使用了全部游戏页面相同的排版，所以展示页面的原理与**全部游戏**页面基本相同。

* 搜索结果先通过`findContent`接受搜索框输入，通过`s = "select * from ps4_form where ps4_Name Like '%" + findContent + "%'";`从数据表**ps4_Name**（也就是中英文名的一列）中选择出含有指定关键词记录，并展示，即完成搜索。

## 四、发布新二手（新交换、友情转让）
### 新二手


* 下拉菜单中的每一条选项`<option>`是由读取**ps4_form**里面的游戏名称一列生成，代码如下。此处读取的数据可在下方显示图片过程中使用。
```
if (k == 2)
 {
    String ps4_Pic = rs.getString(k-1);
    String ps4_Name = rs.getString(k);
    presentPageResult.append("<option  value=ps4_image/" + ps4_Pic + ">" + ps4_Name +"</option>");
  }
```

* 发布页面左侧的图片，可以随着右侧选择要发布的游戏变化而变化。是通过如下Javascript实现的。首先通过`<select>`的`onchange`来调用下方的test函数。然后通过`test`函数显示图片。

```html
<select  id="ps4Name" name="ps4Name" width="300px" class="form-control" onchange="test(this)">
           <%=giveResult%>
      </select>
```

```javascript
function test(obj)
{
   var src = obj.value;    //变量src得到了option选择的value，自动读取了图片路径
   ······
   var img = document.createElement("img");     //创建img元素
   imgs.src= src;      //将id为imgs的图像元素的路径替换为src
  document.body.appendChild(img); //显示图片
    }
```
* 提交功能，表单`<form>`直接提交到了本页面，直接给`String`赋值。
``` 

      String logid = sessionId;
      String words = request.getParameter("words");
      String ps4Name = request.getParameter("ps4Name");
      String type = request.getParameter("type");
      String price = request.getParameter("price");
      String exchange = request.getParameter("exchange");
      String ps4_Name = request.getParameter("ps4_Name");
      
```
* 使用tag接收`String`的值
```
<exchangeUser:exchangeUser logid="<%=logid%>" exchange="<%=exchange %>" type="<%=type %>" price="<%=price%>" words="<%=words%>" ps4Name="<%=ps4Name%>" ps4_Name="<%=ps4_Name %>" />
```
* 然后写入**new**数据库，其中的变量`NO`的内容是包含用户名、类型、留言的一个字符串，可以认为是每条交易信息唯一且便于搜索的编号，在游戏详情中显示交易信息时，可以定位每一条信息。
```
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
```


### 新交换


* 原理与二手交易相同，只不过交易价格变成了交易的标的物（就是要交换到的游戏），两个游戏的图片都可以实时显示是通过两个id实现的。提交到数据库时，二手与交换的类型**type**不同。

### 友情转让
* 友情转让页面原理与前两个相同，友情转让就是白送，不需要输入价格、标的游戏。只是在入库的时候**type**不同

## 四、游戏详情页面


* **上半部分详情信息**：

全部游戏中页面中，查看详情时提交了一个`findCondition`，value等于**ps4_form**里的**number**字段，用于定位，游戏介绍从**story**字段读取。该页上半部分展示游戏详情的原理，与全部游戏页面的原理基本相同，只不过本页面展示单个游戏。

* **下半部分交易信息**：

``` java

if(rs2.next()){do {i++;} //开始在new数据库中检索对应游戏名的信息，每检索到一条i+1，可以展示出共有多少条信息。
        while (rs2.next());}
        queryResult.append("<h5>" + i + "条信息</h5><hr><br>"); 
if(rs2.next()){do {
            for (int k = 1; k <= 7; k++) 
```
下方代码逐条读取读取new数据库，根据`type`（交易类型）数字不同，输出不同的定型文。
如:`用户%user%希望以%price%的价格【%game某款游戏】来交换【购买】这款游戏。`
``` java
            {
                if (k == 1) 
                { userName = "<div class=dropdown show><a href=# role=button data-toggle=dropdown aria-haspopup=true aria-expanded=false><h5>用户"+ rs2.getString(k)+ "希望以";
                    name = "select * from user where logid Like '%" + rs2.getString(k) + "%'";
                } else if (k == 2) {} 
                else if (k == 3) {type = rs2.getString(k);} 
                else if (k == 4) {price = rs2.getString(k)+"元的价格卖出这款游戏</h5></a>";}
                 else if (k == 5) {exchange = rs2.getString(k)+"交换这款游戏</h5></a>";} 
                 else if(k == 6 ){words = rs2.getString(k);}
                else if(k == 7 ){}
           }if( type.equals("1") ){
            queryResult.append(userName + price);}
           if( type.equals("2") ){
               queryResult.append(userName + exchange);
           }
           if( type.equals("3") ){
               queryResult.append(userName + "友情转让这款游戏</h5></a>");
           }
            rs3 = sql3.executeQuery(name);
```
点击某一条交易信息时，会弹出用户资料的卡片，包括用户在注册时留的手机与邮箱、附言。其通过前面已经读取出的数据库内容按照格式填写。卡片同样是使用Bootstrap的`Dropdown`样式。           
 
``` java
if(rs3.next()){do {for (int k = 1; k <=4; k++) 
           {
                ······
                } else if (k == 3) 
                {
                    String phone = rs3.getString(k);
                    queryResult.append("<div class=dropdown-menu><h6 class=dropdown-header>联系方式</h6><a class=dropdown-item>电话："
                        + phone + "</a>");
                } else if (k == 4) 
                {
                    String email = rs3.getString(k);
                    queryResult.append("<a class=dropdown-item>邮箱："
                         +  email + "</a>");
                }}
                queryResult.append("<h6 class=dropdown-header>附言</h6><a class=dropdown-item>" + words + "</a></div>");
            }
            while (rs3.next());}
            queryResult.append("</div>");
                        }while (rs2.next());}
 
```

## 五、个人发布页面

![](/Users/kevin/Desktop/屏幕快照 2018-06-19 17.29.17.png)

* 个人发布页面的前端结构仍然和**搜索结果**页面相同。其内容为筛选到特定用户在new中的记录并展示。
* 首先从登录状态得到用户ID，然后提交到myexchange.jsp的myexchange的tag里username，通过如下语句选择出数据库中的对应内容。即为该用户发布的所有交易
``` 
s = "select * from new where username " + " Like '%" + username + "%'";         
```
* 在用户交易完成后，可手动删除发布过的交易，删除后交易信息在所有页面不再可见。通过如下语句完成。主要通过提交隐藏表单至delete.jsp并执行SQL语句来完成。

```
condition = "DELETE FROM new WHERE NO = '" + rs.getString(k) + "'";
queryResult.append("<form action=delete.jsp>" +"<input type=text name=delete value=\"" + condition + "\"style=display:none>" + "<button class=btn btn-lg btn-primary btn-block type=submit>删除</button></form></td>");
```





## 六、注册与登录、修改个人信息

本页面基本使用现有的框架，修改了CSS样式。没有什么特别之处。




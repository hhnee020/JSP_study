<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="conn.Cookies" %>
<%@ include file="../include/dbcon.jsp" %>

<%
String sql = " SELECT code,title FROM pollmain "
		   + "    WHERE use='Y'  "
		   + "		AND to_date(sdate,'yyyy/mm/dd') <= to_date(sysdate,'yyyy/mm/dd')  "
		   + "		AND to_date(edate,'yyyy/mm/dd') >= to_date(sysdate,'yyyy/mm/dd')  ";
ResultSet rs = stmt.executeQuery(sql);
%>


<%
Cookies cookies = new Cookies(request);
String cookie_id = cookies.getValue("cookie_userid");

if( cookie_id == null ) cookie_id=""; 
%>

<!DOCTYPE html>
<html lang="kr">
 <head>
  <meta charset="UTF-8">
	<title>Document</title>
  	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">
 </head>

<style>

.main_container {
	width:1000px;
	height:500px;
}

.main_div1 {
	width:1000px;
	height:200px;
	background-color:#fbf7fb;
	margin-bottom:10px;
}
.main_left_space {
	width:130px;
	height:300px;
	float:left;
}

.main_div2 {
	width:250px;
	height:300px;
	border:1px solid #ccc;
	float:left;
	margin-right:5px;
}
.main_div3 {
	width:250px;
	height:300px;
	border:1px solid skyblue;
	float:left;
	margin-right:5px;
}
.main_div4 {
	width:250px;
	height:300px;
	border:1px solid #ccc;
	float:left;
}
.main_right_space {
	width:100px;
	height:300px;
	float:left;
}

.btn_span {
	padding : 5px;
	background-color: orange;
}
</style>

<script>

function fn_pollEnter(v) {
	
	var url = "pollEnter.jsp?code="+v;
	var w   = window.screen.width/2 - 200;
	var h   = window.screen.height/2 - 200;
	window.open(url,"popup","width=400,height=400,left="+w+",top="+h);
	
}

function fn_pollret(v) {
	
	
	var url = "pollret.jsp?code="+v;
	var w   = window.screen.width/2 - 200;
	var h   = window.screen.height/2 - 200;
	window.open(url,"popup","width=400,height=400,left="+w+",top="+h);
	
}

</script>

<body>

<header>
Header
</header>

<nav>
	<!-- 탑 메뉴 시작 -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- 탑 메뉴 종료 -->
</nav>

<section>
	<article>
	
	<div class="main_container">
		<div class="main_div1"></div>
		<div class="main_left_space"></div>
   		<div class="main_div2">
   		- 공지사항 -
   		</div>
   		<div class="main_div3">
   		
   		<table style="width:98%;">
   			<tr>
   				<td width="60%" height="50">온라인투표</td>
   				<td width="40%">+</td>
   			</tr>
   			
   			
   		   <%
   			while(rs.next()) {
   				String code = rs.getString("code");
   				String title = rs.getString("title");
   			%>	
   			<tr>
   				<td align="left" height="24">
	   				<%=title %>
	   			</td>
	   			<td>
	   				<span class="btn_span"><a href="javascript:fn_pollEnter('<%=code %>')">응모</a></span>
	   				<span class="btn_span"><a href="javascript:fn_pollret('<%=code %>')">결과</a></span>
   				</td>
   			</tr>
   			<%
   			}
   			%>
   			
   			
   		</table>
   		
   		
   		</div>
   		<div class="main_div4"></div>
   		<div class="main_right_space"></div>
	</div>
	
	</article>
</section>

<footer>
	<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
 <head>
  <meta charset="UTF-8">
	<title>Document</title>
  	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">
 </head>

<style>

</style>

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
	<aside>
		<!-- 좌 메뉴 시작 -->
		<%@ include file="../include/leftmenu.jsp" %>
		<!-- 좌 메뉴 종료 -->
	</aside>
	<article>

<form name="frm" method="post" action="loginWriteSub.jsp">

<table class="table1" align="center" style="width:400px;"> 
	<caption class="caption1">로그인 화면</caption>
	<tr>
		<th class="th1">아이디</th>
		<td class="td2">
			<input type="text" name="userid" class="input1">
		</td>
	</tr>
	<tr>
		<th class="th1">암호</th>
		<td class="td2"><input type="password" name="userpw" class="input1"></td>
	</tr>
	<tr>
		<th class="th1" colspan="2">
			<input type="submit" value="로그인" class="button1">
		</th>
	</tr>
</table>

</form>


	</article>
</section>

<footer>
	<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

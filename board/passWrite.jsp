<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String unq = request.getParameter("n");
// n 줄때 변수이름을 받는 것 ;
if( unq == null || unq.trim().equals("") ) {
%>
		<script>
		alert("잘못된  접근!!!");
		location="boardList.jsp";
		</script>
<%
	return;
}
%>


<!DOCTYPE html>
<html lang="kr">
 <head>
  <meta charset="UTF-8">
	<title>Document</title>
  	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">
 </head>

<script>
function fn_submit() {
	if( document.frm.pass.value == "" ) {
		alert("암호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	document.frm.submit();
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
	<aside>
	<!-- 좌 메뉴 시작 -->
	<%@ include file="../include/leftmenu.jsp" %>
	<!-- 좌 메뉴 종료 -->
	</aside>
	
	<article>

		<div style="width:600px; margin:0 auto;">
		
<form name="frm" method="post" action="boardDelete.jsp">

	<input type="hidden" name="n" value="<%=unq %>"> 

<table class="table1">
<caption class="caption1">암호입력</caption>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>

	<tr>
		<th class="th1">암호</th>
		<td class="td1" style="text-align:left;">
			<input type="password" name="pass" class="input2">
		</td>
	</tr>
	<tr>
		<th colspan="2" height="40">
			<button type="submit" class="button1" onclick="fn_submit(); return false;">삭제</button>
			<button type="reset" class="button1">취소</button>

		</th>
	</tr>
</table>
</form>
		</div>

	</article>
</section>

<footer>
	<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

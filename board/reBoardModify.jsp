

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- -------------db 연결 -->

<%@ page import="java.sql.ResultSet" %>
<%@ include file="../include/dbcon.jsp" %>

<!-- ----------파라미터 값---->
<%
String unq = request.getParameter("n");
 %>
 
 
 
<!-- ----------null 값---->
<%
if( unq == null || unq.trim().equals("")){
%>
	<script>
	alert("잘못된 경로 접근!!");
	location = "reBoardList.jsp";
	</script>
<%
	return;
}
%>


<!-- ----------sql---->

<%
String sql1 = "SELECT "
		+ "		 title, nvl(name,' ') name ,content"								
		+ "	   FROM reboard "
		+ "			WHERE unq='"+unq+"'";
		
ResultSet rs = stmt.executeQuery(sql1);


String title = "";
String name = "";
String content = "";

///데이터 읽기;
if(rs.next()){
	
	title = rs.getString("title");
	name = rs.getString("name");
	content = rs.getString("content");
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


function fn_submit(){
	
	if( document.frm.title.value == "" ){
		
		alert("제목을 입력해 주세요;");
		 document.frm.title.focus();
		 return false; 
		 
	}
	
	
	
	if( document.frm.pass.value == "" ){
			
			alert("암호를 입력해 주세요;");
			 document.frm.pass.focus();
			 return false;
			 
	}
	
///////////		
	document.frm.submit();
	
}


</script>

<style>

</style>

<body>

<header>
Header
</header>

<nav>
<%@ include file="../include/topmenu.jsp" %>
</nav>

<section>
	<aside>
	<%@ include file="../include/leftmenu.jsp" %>
	</aside>
	<article>

<form name="frm" method="post" action="reBoardModifysave.jsp">

<input type="hidden" name="n" value="<%=unq%>">


<table class="table1" align="center">

<caption class="caption1">답변게시판 수정화면</caption>

	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>

	<tr>
		<th class="th1">제목</th>
		<td class="td1" style="text-align:left;">
			<input type="text" name="title"  value="<%=title%>" class="input1">
		</td>
	</tr>

	<tr>
		<th class="th1">글쓴이</th>
		<td class="td1" style="text-align:left;"><input type="text" name="name" value="<%=name%>" class="input2"></td>
	</tr>
	
	<tr>
		<th class="th1">암호</th>
		<td class="td1" style="text-align:left;">
			<input type="password" name="pass" class="input2">
		</td>
	</tr>
	<tr>
		<th class="th1">내용</th>
		<td class="td1" style="text-align:left;">
			<textarea name="content" class="textarea1" ><%=content%></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2" height="40">

			<!--<input type="submit" value="저장"/>
			<input type="reset" value="취소"> -->

			<button type="submit" class="button1"  onclick="fn_submit();return false;" >수정</button>
			<button type="reset" class="button1">취소</button>

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

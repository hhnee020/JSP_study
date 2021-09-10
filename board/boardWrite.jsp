

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

<form name="frm" method="post" action="boardWriteSave.jsp">



<table class="table1" align="center">

<caption class="caption1">일반게시판 등록화면</caption>

	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>

	<tr>
		<th class="th1">제목</th>
		<td class="td1" style="text-align:left;">
			<input type="text" name="title" class="input1">
		</td>
	</tr>
	<tr>
		<th class="th1">암호</th>
		<td class="td1" style="text-align:left;">
			<input type="password" name="pass" class="input2">
		</td>
	</tr>
	<tr>
		<th class="th1">글쓴이</th>
		<td class="td1" style="text-align:left;"><input type="text" name="name" class="input2"></td>
	</tr>
	<tr>
		<th class="th1">내용</th>
		<td class="td1" style="text-align:left;">
			<textarea name="content" class="textarea1"></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2" height="40">

			<!--<input type="submit" value="저장"/>
			<input type="reset" value="취소"> -->

			<button type="submit" class="button1"  onclick="fn_submit();return false;" >저장</button>
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

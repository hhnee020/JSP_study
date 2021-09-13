<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 파라메터 값 받기 list 에서 클릭시에 넘어오는 값 -->
<%
String unq = request.getParameter("unq");
%>

<!-- 널값 체크 널이거나 공백이거나 -->
<%
if( unq == null || unq.trim().equals("") ) {
%>
	<script>
	alert("잘못된 경로 접근!!");
	location = "boardList.jsp";
	</script>
<%
	return;
}
%>
<!-- SQL 작성 및 적용--//nvl 공백 대처>
<%
String sql1 = "SELECT "
			+ "		 title, nvl(name,' ') name ,content,rdate, udate "								
			+ "	   FROM nboard "
			+ "			WHERE unq='"+unq+"'";
ResultSet rs1 = stmt.executeQuery(sql1);

///// sql 변수 값 초기화

String title = "";
String name = "";
String content = "";
String rdate = "";
String udate = "";


// sql 값 존재여부 
if( rs1.next() ) {
	
	title = rs1.getString("title");
	name = rs1.getString("name");
	content = rs1.getString("content");
	rdate = rs1.getString("rdate");
	udate = rs1.getString("udate");
	/// 변경일이 null일때 
	if( udate == null ){
		udate ="---";
		
	}
	// 내용이 not null   replace 텍스트 바꾸기
	if(content !=null ){
		content =content.replace("\n", "<br>");
		content =content.replace(" ", "$nbsp;");
	}
}

if( title.equals("") ) {
	 // 재목이 공백인가
%>
<script>
alert("잘못된 경로 의 접근!!");
location = "boardList.jsp";
</script>
<%
	return;	
}

//조회수 증가; ++  a=a+1
String sql2 = " UPDATE nboard SET hits=hits+1  WHERE unq='"+unq+"'";
stmt.executeUpdate(sql2);

%>


<!-- 출력 -->


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
	if( document.frm.title.value == "" ) {
		alert("제목을 입력해주세요.");
		document.frm.title.focus();
		return false;
	}
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
		

<table class="table1">
<caption class="caption1">일반게시판 등록화면</caption>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>

	<tr>
		<th class="th1">제목</th>
		<td class="td1" style="text-align:left;">
		<%=title %>
		</td>
	</tr>

	<tr>
		<th class="th1">글쓴이</th>
		<td class="td1" style="text-align:left;">
		<%=name %>
		</td>
	</tr>
	<tr>
		<th class="th1">내용</th>
		<td class="td1" style="text-align:left;">
		<%=content %>
		</td>
	</tr>
	<tr>
		<th class="th1">등록일</th>
		<td class="td1" style="text-align:left;">
		<%=rdate %>
		</td>
	</tr>
	<tr>
		<th class="th1">변경일</th>
		<td class="td1" style="text-align:left;">
		<%=udate %>	
		</td>
	</tr>
	<tr>
		<th colspan="2" height="40">

			<!--<input type="submit" value="저장"/>
			<input type="reset" value="취소"> -->

			<button type="button" class="button1 " onclick="location='boardModify.jsp?n=<%=unq%>'">수정</button>
			<button type="button" class="button1" onclick="location='passWrite.jsp?n=<%=unq%>'">삭제</button>
			<!-- -------페이지 이동 ;---- -->
		</th>
	</tr>
</table>

		</div>

	</article>
</section>

<footer>
	<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

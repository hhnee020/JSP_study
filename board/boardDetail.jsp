<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 파라메터 값 받기 -->
<%
String unq = request.getParameter("unq");
%>

<!-- 널값 체크 -->
<%
if( unq == null || unq.trim().equals("") ) {
%>
	<script>
	alert("잘못된 경로로의 접근!!");
	location = "boardList.jsp";
	</script>
<%
	return;
}
%>
<!-- SQL 작성 및 적용-->
<%
String sql1 = "SELECT "
			+ "		 title,nvl(name,' ') name,content,rdate, "
			+ "        udate  "
			//+ "      nvl(to_char(udate,'yyyy-mm-dd'),' ') udate "
			+ "	   FROM nboard "
			+ "			WHERE unq='"+unq+"'";
ResultSet rs1 = stmt.executeQuery(sql1);

String title = "";
String name = "";
String content = "";
String rdate = "";
String udate = "";

if( rs1.next() ) {
	title = rs1.getString("title");
	name = rs1.getString("name");
	content = rs1.getString("content");
	rdate = rs1.getString("rdate");
	udate = rs1.getString("udate");
	if( udate == null ) {
		udate = "---";
	}
	if( content != null ) {
		content = content.replace("\n","<br>");
		content = content.replace(" ","&nbsp;");
	}
}

if( title.equals("") ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location = "boardList.jsp";
		</script>
<%
	return;	
}

// ++  a=a+1
String sql2 = " UPDATE nboard SET hits=hits+1  WHERE unq='"+unq+"'";
stmt.executeUpdate(sql2);

//int  b_unq= Integer.parseInt(unq)-1;
//int  n_unq= Integer.parseInt(unq)-1;
int b_unq = 0;
int n_unq = 0;

// 이전 unq를 얻는 상황
//select max(unq) from nboard where unq <8; --- 8보다 작은 데이터중에 가장 큰  :7
String sql3 = "select nvl(max(unq),0) b_unq from nboard where unq < " + unq;
ResultSet rs3 = stmt.executeQuery(sql3);
if( rs3.next() ) {
	b_unq = rs3.getInt("b_unq");
}

// 다음 unq를 얻는 상황
//select min(unq) from nboard where unq >8; --- 8보다 큰 데이터중에 가장 작은 :9
String sql4 = "select nvl(min(unq),0) n_unq from nboard where unq > " + unq;
ResultSet rs4 = stmt.executeQuery(sql4);
if( rs4.next() ) {
	n_unq = rs4.getInt("n_unq");
}
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
		<div style="width:99%;height:70px;overflow:auto;">
			<%=content %>
		</div>
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
		
			<%
			////// 이전 버튼 ;
			if(b_unq > 0) {
			%>
				<button type="button" onclick="location='boardDetail.jsp?unq=<%=b_unq %>'" ><<</button>
			<%
			}
			////// 다음 버튼 ;
			if(n_unq > 0) {
			%>
			
				<button type="button" onclick="location='boardDetail.jsp?unq=<%=n_unq %>'" >>></button>
			<%
			}
			%>
			<button type="button" class="button1" onclick="location='boardModify.jsp?n=<%=unq %>'" >수정</button>
			<button type="button" class="button1" onclick="location='passWrite.jsp?n=<%=unq %>'" >삭제</button>

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

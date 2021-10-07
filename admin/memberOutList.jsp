<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="adminCertify.jsp" %>

<%



String sql = " select count(*) total from memberexit";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
int total = rs.getInt("total");

String sql2= " select unq, userid, content, regdate, state"
       
          +"   from memberexit ";

ResultSet rs1 = stmt.executeQuery(sql2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
body {
	font-size:12px;
	font-family:'맑은 고딕';
}
.div_top {
	width:100%; 
	text-align:center;
	background:#cccccc;
	padding-top:10px;
	padding-bottom:10px;
}
.div1 {
	width:1200px;
}
.div2 {
	float:left;width:200px;height:500px;
	background:yellow;
}
.div3 {
	float:left;width:1000px;height:500px; 
	background:#fff;
}

table {
	width:600px;
	border-collapse:collapse;
}
th {
	border:1px solid #ccc;
	padding:5px;
} 
td {
	border:1px solid #ccc;
	padding:3px;
	text-align:center;
}
</style>

<script>
function fn_action(a,b) {
	document.frm.ord.value=a;
	document.frm.desc.value=b;
	
	document.frm.submit();
}

</script>


<body>

<div class="div1">

	<div class="div_top">
		<h2>관리자모드</h2>
	</div>
	<div class="div2">
	<!-- left menu S -->
		<div style="position:relative; left:10px; top:30px;">
			<a href="memberlist.jsp">회원관리</a> <br>
			<a href="memberOutList.jsp">탈퇴회원</a> <br>
			<a href="boardList.jsp">게시판관리</a> <br>
			<a href="main.jsp">메인화면관리</a>
		</div>
	<!-- left menu E -->
	</div>
	<div class="div3">
	
		<div style="position:relative; left:20px; top:30px; margin-bottom:10px;">
		
		</div>


		<div style="position:relative; left:20px; top:30px; margin-bottom:5px;">
			(총) 검색개수 :<%=total %> 
		</div>

		<div style="position:relative; left:20px; top:30px;">
	
	<table>
		<tr bgcolor="#cffccc">
			<th width="10%"> 번호</th>
			<th width="15%"> 아이디</th>
			<th width="15%"> 신청일</th>
			<th>내용</th>
			<th width="10%">처리</th>
		</tr>
		
			<%
				while( rs1.next() ) {
					
					String unq= rs1.getString("unq");
					String userid= rs1.getString("userid");
					String regdate= rs1.getString("regdate");
					String content= rs1.getString("content");
					String state = rs1.getString("state");

				%>
				
		
		<tr>
		<th class="td1"><%=unq%></th>
		<th class="td1"><%=userid %></th>
		<th class="td1"><%=regdate %></th>
		<th class="td1"><%=content %></th>
		<th class="td1"><%=state %></th>
		</tr>
		<% 	
				}
			
			%>			
	
	</table>
	
		</div>
	</div>
</div>
</body>
</html>












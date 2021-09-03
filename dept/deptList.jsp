<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<%
String sql = "select deptno,dname,loc from dept "
			 + " order by dname asc";
ResultSet rs = stmt.executeQuery(sql);
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
table {
   width:400px;
   border:1px solid #ccc;
   border-collapse:collapse;
}
th, td {
   border:1px solid #ccc;
   padding:5px;
   text-align:center;
}
button {
	font-size:12px;
    font-family:'맑은 고딕';
    background-color:skyblue;
}
</style>

<script>
function fn_delete(n) {
	if(  confirm("정말 삭제하시겠습니까?")  ) {
		location="deptDelete.jsp?deptno="+n;
	}
}
</script>

<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>부서이름</th>
		<th>부서번호</th>
		<th>부서위치</th>
		<th>삭제</th>
	</tr>

	<%
	int cnt = 0;
	while( rs.next() ) {
		cnt++;
		String deptno = rs.getString("deptno");
		String dname = rs.getString("dname");
		String loc = rs.getString("loc");
	%>
	
	<tr>
		<td><%=cnt %></td>
		<td><a href="deptModify.jsp?deptno=<%=deptno %>"><%=dname %></a></td>
		<td><%=deptno %></td>
		<td><%=loc %></td>
		<td><a href="javascript:fn_delete('<%=deptno%>')">삭제</a></td>
	</tr>
	
	<%
	}
	%>
</table>

<div style="width:400px; text-align:right; margin-top:10px;">
<button type="button" onclick="location='deptWrite.jsp'">글쓰기</button>
</div>

</body>
</html>






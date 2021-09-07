<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<%
String sql2 = "select count(*) total from empJsp";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int total = rs2.getInt("total");

int rownum = total;

// date_format(날짜데이터, '%Y-%m-%d'); -> 2021-09-07 
String sql = "select empno,ename,deptno,"
			 + "    date_format(hiredate,'%Y')  year "
			 + " from empJsp "
			 + " 	order by hiredate desc";
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
		location="empDelete.jsp?empno="+n;
	}
}
</script>

<body>
<table>
	<tr>
		<th>번호</th>
		<th>사원이름</th>
		<th>부서번호</th>
		<th>입사년도</th>
		<th>삭제</th>
	</tr>

	<%
	while( rs.next() ) {
		String deptno = rs.getString("deptno");
		String ename = rs.getString("ename");
		String empno = rs.getString("empno");
		String year = rs.getString("year");
	%>
	
	<tr>
		<td><%=rownum %></td>
		<td><a href="empModify.jsp?empno=<%=empno %>"><%=ename %>(<%=empno %>)</a></td>
		<td><%=deptno %></td>
		<td><%=year %></td>
		<td>	<img src="../images/del.PNG" 
					 width="20" 
					 height="20" 
					 alt="삭제이미지"
					 style="cursor:pointer" 
					 onclick="fn_delete('<%=empno %>')"> </td>
	</tr>
	
	<%
		rownum--;// 행번호 큰수에서 점점 빼기 위해 ;
	}
	%>
</table>

<div style="width:400px; text-align:right; margin-top:10px;">
<button type="button" onclick="location='empWrite.jsp'">사원등록</button>
</div>

</body>
</html>






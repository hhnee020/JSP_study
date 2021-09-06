<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<%
String sql = "select grade , lowsal , hisal  from salgrade "
				+" order by grade desc"; 
ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 급여 정보 목록 </title>
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
		location="SalDel.jsp?grade="+n;// n 변수 
	}
}
</script>

<body>
<table >
	<tr>
		<th>번호</th>
		<th>급여 등급 </th>
		<th>최저 급여 </th>
		<th>최고 급여 </th>
		<th>삭제 </th>
	</tr>

	<%
	int rownum = 0;
	while( rs.next() ) { //존재 유뮤 ;
		rownum++;
		int grade = rs.getInt("grade");
		int lowsal = rs.getInt("lowsal");
		int hisal = rs.getInt("hisal");
		
	%>
	
	<tr>
		<td><%=rownum %></td><!--  행번호 -- -->
		<td><a href="salModify.jsp?grade=<%=grade %>"><%=grade %> 등급 </a></td> <!-- 수정  -->
		<td><%=lowsal %></td>
		<td><%=hisal %></td>
		<td><a href="javascript:fn_delete(<%=grade %>)">삭제 </a></td> <!-- -삭제  -->
	</tr>
	
	<%
	}
	%>
</table>

<div style="width:400px; text-align:right; margin-top:10px;">
<button type="button" onclick="location='SalWrite.jsp'"> 급여 등록 </button> <!-- -새로 글쓰기  --> 
</div>

</body>
</html>






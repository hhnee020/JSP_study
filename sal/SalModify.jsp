<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 파라메터값 받기 -->
<%
String grade = request.getParameter("grade");
%>

<!-- SQL 작성/적용 -->
<%
String sql = "select lowsal,hisal from salgrade where grade='"+grade+"' ";
ResultSet rs = stmt.executeQuery(sql);
%>

<!-- 변수 세팅 -->

<%
int lowsal = 0;
int hisal = 0;
if( rs.next() ) {
	lowsal = rs.getInt("lowsal");
	hisal = rs.getInt("hisal");
}

if( lowsal == 0 && hisal == 0 ) {
%>
	<script>
	alert("잘못된 경로로의 접근!!");
	location="SalList.jsp";
	</script>
<%
	return; // jsp 종료
}

%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여등급 등록화면</title>
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
}
</style>

<script>
function fn_submit() {
	if(document.frm.grade.value == "") {
		alert("급여등급을 입력해주세요!");
		document.frm.grade.focus();
		return false;
	}
	if(document.frm.lowsal.value == "") {
		alert("최저급여를 입력해주세요!");
		document.frm.lowsal.focus();
		return false;
	}
	document.frm.sumbit();
}
</script>


<body>

<form name="frm" method="post" action="salModifySave.jsp">
<table>
   <tr>
      <th>급여등급</th>
      <td><input type="text" name="grade"  value="<%=grade %>" readonly></td>
   </tr>
   <tr>
      <th>최저급여</th>
      <td><input type="text" name="lowsal" value="<%=lowsal %>"></td>
   </tr>
   <tr>
      <th>최고급여</th>
      <td><input type="text" name="hisal" value="<%=hisal %>"></td>
   </tr>
   <tr>
      <th colspan="2">
      <button type="button" onclick="location='SalList.jsp'">목록</button>
      <button type="submit" onclick="fn_submit();return false;">수정</button>
      <button type="reset">취소</button>
      </th>
   </tr>
</table>

</form>

</body>
</html>
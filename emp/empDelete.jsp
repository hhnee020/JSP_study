<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 파라메터값 세팅 -->
<%
String empno = request.getParameter("empno");

if( empno == null ) {
%>
	<script>
	alert("잘못된 경로로의 접근");
	location="empList.jsp";
	</script>
<%
	return;
}

%>

<!-- SQL 작성 후 적용 -->
<%
String sql = "delete from empJsp where empno='"+empno+"' ";
int result = stmt.executeUpdate(sql);
%>
<!-- 메세지 출력 -->

<%
if ( result == 1 ) {
%>
   <script>
   alert("삭제완료");
   location='empList.jsp';
   </script>
<%   
} else {
%>
   <script>
   alert("삭제실패");
   history.back();      //이전화면으로 이동
   </script>
<%
}
%>













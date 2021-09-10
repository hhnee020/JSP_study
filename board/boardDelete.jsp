<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>
<%
String unq = request.getParameter("n");
String pass = request.getParameter("pass");
if( unq == null || unq.trim().equals("") ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!!");
		location="boardList.jsp";
		</script>
<%
	return;
}
String sql = "DELETE FROM nboard WHERE unq='"+unq+"' AND pass='"+pass+"' ";
int result = stmt.executeUpdate(sql);

if( result == 1 ) {
%>
		<script>
		alert("삭제완료");
		location="boardList.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("암호를 다시 확인해주세요.");
		history.back();
		</script>
<%
}
%>












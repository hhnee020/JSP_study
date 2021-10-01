<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 파라메터 값 받기 (unq,pass) -->
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%>

<!-- admin_info의 암호(pass) 비교 -->
<%
String sql1 = "select count(*) cnt from admin_info  where userpw="+pass+" "; 
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int cnt = rs1.getInt("cnt");
if( cnt == 0 ) {
%>
		<script>
		alert("다시 시도해주세요. (암도오류) ");
		history.go(-1);
		</script>
<%
		return;
}
%>

<!-- post3 데이터 삭제(unq) -->
<%
String sql2 = "DELETE FROM post3 WHERE rn='"+unq+"'";
int result = stmt.executeUpdate(sql2);
if( result == 1 ) {
%>
		<script>
		alert("삭제완료!");
		location="addrList.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("삭제실패!");
		location="addrList.jsp";
		</script>
<%
}
%>

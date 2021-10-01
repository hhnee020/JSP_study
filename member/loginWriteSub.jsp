<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>
<%
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");

if( userid == null || userpw == null ) {
%>
		<script>
		alert("잘못된 접근입니다!");
		location="/";
		</script>
<%
		return;
}

String sql = "select count(*) cnt from member_info "
			+ " where userid='"+userid+"' and userpw='"+userpw+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");
if( cnt == 0 ) {
%>
		<script>
		alert("다시 확인해주세요!");
		history.back();
		</script>
<%
		return;
}
session.setAttribute("USER_ID",userid);
//session.setMaxInactiveInterval(10);

%>
<script>
alert("<%=userid %>님 로그인 되었습니다.");
location="../board/boardList.jsp";
</script>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>
    
<%
String grade = request.getParameter("grade");

String sql = "delete from salgrade where grade = '"+grade+"'";
int result = stmt.executeUpdate(sql);

if(result == 1) {
%>
	<script>
	alert("삭제완료!");
	location="SalList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("삭제실패!");
	history.back();
	</script>
<%
}
%>

    
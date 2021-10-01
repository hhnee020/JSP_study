<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>
<%
String admin_id = (String) session.getAttribute("admin_user_id");
if( admin_id == null ) {
%>    
		<script>
		location="login.jsp";
		</script>
<%
		return;
} else {
	String QUERY = " SELECT COUNT(*) admin_cnt FROM admin_info "
				 + "	WHERE "
				 +"			userid='"+admin_id+"' ";
	ResultSet RS = stmt.executeQuery(QUERY);
	RS.next();
	int admin_cnt = RS.getInt("admin_cnt");
	if( admin_cnt == 0 ) {
		out.print("<script> location='login.jsp'; </script>");
		return;
	}
}
%>
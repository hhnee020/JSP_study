<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
    	    
<%@ include file ="../include/dbcon.jsp" %>
 
<% 
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");


String sql=" select count(*) cnt from admin_info "
			+"  where userid='"+userid+"' and userpw='"+userpw+"'  ";


ResultSet rs = stmt.executeQuery(sql);

rs.next();
int cnt = rs.getInt("cnt");

if( cnt == 0){

	
	%>
	<script>
	alert("계정을 다시 확인해주세요.");
	history.back();
	</script>
	
	<%
	
	return;
}

%>
<%
session.setAttribute("admin_user_id", userid);

// memberlist.jsp  이동
//<meta http-equiv='refresh' content='0 url='memberlist.jsp'>
/// 로그인 후
response.sendRedirect("memberlist.jsp");
//<script>location="memberlist.jsp";</script>

 %>
 
 
 
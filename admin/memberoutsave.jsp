<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String user_id = (String)session.getAttribute("USER_ID");
%>   

<%@ include file ="../include/dbcon.jsp" %>

<%

String content = request.getParameter("content");

String sql=" insert into memberexit( unq ,userid ,content, regdate,state)"
+"values (memberexit_seq.nextval , '"+user_id+"' ,  '"+content+"' , sysdate,'N' )"  ;


int ret= stmt.executeUpdate(sql);
if( ret== 1){
	%>
	
	self.close();
<% 	
};
%>
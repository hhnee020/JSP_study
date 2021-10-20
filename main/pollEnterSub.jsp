<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<%
String chk_value = request.getParameter("chk_value");

String result_msg = "fail";

// update pollsub set vote=vote+1 where code='100301';
String sql = "update pollsub set vote=vote+1 where code='"+chk_value+"'";
int result_cnt = stmt.executeUpdate(sql);

if( result_cnt == 1 ) result_msg = "ok";
%>
{"result":"<%=result_msg %>"}
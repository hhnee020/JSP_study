<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
session.removeAttribute("USER_ID");
%>    
<script>
alert("로그아웃 됬습니다.");
location="../board/boardList.jsp";
</script>

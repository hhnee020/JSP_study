<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post</title>
</head>
<body>

<%
// 전송된 데이터가 보이지 않는다
String username= request.getParameter("username"); //인풋의 네임값
String useraddr= request.getParameter("useraddr");
String year= request.getParameter("year");
%>
전송된 이름 : <%=username %>
전송된 주소 : <%=useraddr %>
년도 : <%=year %>
</body>
</html>

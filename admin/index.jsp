<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
/// 로그인전= 로그인 페이지, 로그인후= 회원 목록 페이지;
String admin_id = (String)session.getAttribute("admin_user_id");

if(  admin_id == null ){
	%>
	
	<script>

	location="login.jsp";
	</script>
	
	
	<%
	
	
	
}else{
	
	%>
	<script>

	location="memberlist.jsp";
	</script>
	
	<%

}

%>   


 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<body>

</body>
</html>
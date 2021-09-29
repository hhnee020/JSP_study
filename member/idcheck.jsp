<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/dbcon.jsp" %>
 
 
<!-- ---파라미터값 받기----- -->
 <%  
 String userid= request.getParameter("userid");

// null 값


if( userid == null|| userid.trim().equals("") ){
%>
	<script>
	alert(" 잘못 된 경로 로  접근 ");
	self.close();
	</script>
<%
		return;
}


String sql= " select count(*) cnt from member_info where userid='"+userid+"'";

ResultSet rs= stmt.executeQuery(sql);

rs.next();
int cnt=  rs.getInt("cnt");
String msg="";


if( cnt ==0  ){
	
	msg=" 사용가능한 아이디 입니다.";
	out.print("<script> opener.document.frm.idcheck.value='Y'; </script>");
	
} else{
	
	msg=" 이미 사용 중인 아이디 입니다.";
	out.print("<script> opener.document.frm.idcheck.value='N'; </script>");
}

%>


	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:280px; 
			height:100px;
			font-size:12px; 
			background-color:skyblue;
			text-align:center;">
	<br><br>
	<%=msg %>
	<br><br>
	<button type="button" onclick="self.close()">닫기</button>
</div>	
</body>
</html>



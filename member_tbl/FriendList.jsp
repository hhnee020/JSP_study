<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon.jsp" %>
<% String no =request.getParameter("member_no");

  ///  친구 요청 리스트 
String sql = " select m.member_id, m.member_name, "
				+" to_char(REQ_DATE,'yyyy-mm-dd') as REQ_DATE,"
				+" decode(ALLOW_YN,'Y','허락','N','대기중','') as ALLOW_YN"
				+" from friend_tbl f , member_tbl m "
				+" where f.REQ_MEMBER_NO = m. member_no ";

ResultSet rs = stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
</head>

<body>
<div>
	<header>
		<h1>친구관리</h1>
	</header>
	<nav>
<%@ include file="topMenu.jsp" %>
	</nav>
	<section>
		<br>
		<h2 align="center">친구 요청 목록</h2>
		
		<div>
		
		<table border="1" align="center" width="600">
			<tr>
				
				<th>회원ID</th>
				<th>회원명</th>
				<th>요청일자</th>
				<th>수락여부</th>
				
			</tr>
	 	<%
	 	while( rs.next() ) {
	 		
	 		String id = rs.getString("member_id");
	 		String name = rs.getString("member_name");
	 		String REQ_DATE = rs.getString("REQ_DATE");
	 		String ALLOW_YN = rs.getString("ALLOW_YN");
	 		
	 		

	 	%>
	 		<tr align="center">
	 			<td><%=id %></td>
	 			<td><%=name %></td>
	 			<td><%=REQ_DATE %></td>
	 			<td><%=ALLOW_YN %></td>
	 		
	 		</tr>
	 	<%
	 	}
	 	%>

		</table>

		</div>
	</section>
	<footer>
<%@ include file="footer.jsp" %>
	</footer>
</div>
</body>
</html>





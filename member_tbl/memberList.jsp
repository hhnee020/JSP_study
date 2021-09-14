<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon.jsp" %>
<%
// date_format(member_date, '%Y-%m-%d') 
/*String sql = " SELECT ";
       sql += "    member_no        no, ";
       sql += "    member_id        id, ";
       sql += "    member_name    name, ";
       sql += "    if(member_grade='S','특별',if(member_grade='A','우수','일반')) grade, ";
       sql += "    ifnull(member_hobby,' ')  hobby, ";
       sql += "    date_format(member_date, '%Y.%m.%d') date";
       sql += " FROM ";
       sql += "    member_tbl ";
       sql += "     ORDER BY member_no DESC";*/
       
       /*  decode ('데이터값','비교값1','출력설정1','비교값2','출력설정2','출력설정3' )
        *
        */
  
String sql = " SELECT ";
       sql += "    member_no        no, ";
       sql += "    member_id        id, ";
       sql += "    member_name    name, ";
       sql += "    decode(member_grade,'S','특별','A','우수','B','일반',' ')  grade, ";
       sql += "    nvl(MEMBER__HOBBY,' ')  hobby, ";
       sql += "    to_char(member_date,'yyyy.mm.dd') date1";
       sql += " FROM ";
       sql += "    member_tbl ";
       sql += "     ORDER BY member_no DESC";
       
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
		<h2 align="center">친구목록 조회/수정</h2>
		
		<div>
		
		<table border="1" align="center" width="600">
			<tr>
				<th>회원번호</th>
				<th>회원ID</th>
				<th>이름</th>
				<th>등급</th>
				<th>취미</th>
				<th>날짜</th>
			</tr>
	 	<%
	 	while( rs.next() ) {
	 		String no = rs.getString("no");
	 		String id = rs.getString("id");
	 		String name = rs.getString("name");
	 		String grade = rs.getString("grade");
	 		String hobby = rs.getString("hobby");
	 		String date = rs.getString("date1");
	 		
	 		// S,A,B
	 		/*if(grade.equals("S")) grade = "특별";
	 		else if(grade.equals("A")) grade = "우수";
	 		else grade = "일반";*/
	 		
	 		if(hobby == null) hobby = "";
	 		
	 		//date = date.replace("-", ".");
	 			 		
	 	%>
	 		<tr align="center">
	 			<td><%=no %></td>
	 			<td><a href="memberModify.jsp?no=<%=no %>"><%=id %></a></td>
	 			<td><%=name %></td>
	 			<td><%=grade %></td>
	 			<td><%=hobby %></td>
	 			<td><%=date %></td>
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





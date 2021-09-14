<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon.jsp" %>

<%
String sql = " select nvl(max(member_no),1000)+1 member_no from member_tbl";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int member_no = rs.getInt("member_no");

Calendar cal = Calendar.getInstance();
int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH)+1;
int dd = cal.get(Calendar.DATE);

String date = yy + "/" + ((mm<10)?"0"+mm:mm) + "/" + ((dd<10)?"0"+dd:dd);

%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구관리 프로그램</title>
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
		<h2 align="center">친구(회원)등록</h2>
		
		<div>
		<form name="frm" method="post" action="memberWritesave.jsp">
		<table border="1" width="600" align="center">
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="member_no" value="<%=member_no %>"></td>
			</tr>
			<tr>
				<th>회원ID</th>
				<td><input type="text" name="member_id"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
				<select name="member_grade" size="3">
					<option value="S">특별회원</option>
					<option value="A">우수회원</option>
					<option value="B">일반회원</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
		<input type="checkbox" name="MEMBER__HOBBY" value="독서">독서 
		<input type="checkbox" name="MEMBER__HOBBY" value="운동">운동 
		<input type="checkbox" name="MEMBER__HOBBY" value="영화">영화 
				</td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td><input type="text" name="member_date" value="<%=date %>" ></td>
			</tr>
		</table> 
		<p align="center">
			<button type="submit">등록</button>
			<button type="reset">취소</button>
		</p>
		</form>
		</div>
	</section>
	<footer>
<%@ include file="footer.jsp" %>
	</footer>
</div>
</body>
</html>





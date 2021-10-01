<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="adminCertify.jsp" %>

<%
String sql1 = "SELECT COUNT(*) total FROM member_info ";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt("total");

String sql2 = "  SELECT userid,"
			+"			name,"
			+"			decode(gender,'M','남','F','여') gender  ,"
			+"			(to_char(sysdate,'yyyy') - to_char(birth,'yyyy')) age,"
			+"			addr1,"
			+"			phone,"	
			+"			to_char(rdate,'yyyy-mm-dd') rdate "
			+"	  FROM "
			+"		member_info ";

ResultSet rs2 = stmt.executeQuery(sql2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
body {
	font-size:12px;
	font-family:'맑은 고딕';
}
.div_top {
	width:100%; 
	text-align:center;
	background:#cccccc;
	padding-top:10px;
	padding-bottom:10px;
}
.div1 {
	width:1200px;
}
.div2 {
	float:left;width:200px;height:500px;
	background:yellow;
}
.div3 {
	float:left;width:1000px;height:500px; 
	background:#fff;
}

table {
	width:800px;
	border-collapse:collapse;
}
th {
	border:1px solid #ccc;
	padding:5px;
} 
td {
	border:1px solid #ccc;
	padding:3px;
	text-align:center;
}
</style>

<body>

<div class="div1">

	<div class="div_top">
		<h2>관리자모드</h2>
	</div>
	<div class="div2">
		<div style="position:relative; left:10px; top:30px;">
			회원목록
		</div>
	</div>
	<div class="div3">
	
		<div style="position:relative; left:20px; top:30px;">
	
	<table>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>핸드폰</th>
			<th>지역</th>
			<th>등록일</th>
		</tr>
		<%
		while( rs2.next()  ) {
			
			String userid = rs2.getString("userid");
			String name = rs2.getString("name");
			String gender = rs2.getString("gender");
			String phone = rs2.getString("phone");
			String addr1 = rs2.getString("addr1");
			String RDATE = rs2.getString("RDATE");
			String age = rs2.getString("age");
			
			String[] array = addr1.split(" ");
		%>
		<tr>
			<td></td>
			<td><%=userid %></td>
			<td><%=name %></td>
			<td><%=gender %></td>
			<td><%=age %></td>
			<td><%=phone %></td>
			<td><%=array[0] %></td>
			<td><%=RDATE %></td>
		</tr>
		<%
		}
		%>
	
	</table>
		</div>
	
	</div>

</div>


</body>
</html>












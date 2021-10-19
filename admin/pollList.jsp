<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="adminCertify.jsp" %>

<%
String search_field = request.getParameter("search_field");
String search_text = request.getParameter("search_text");
// search_field -> "content" or "title" or null
// search_text -> "홍길동";

String str = "";

if( search_field != null && search_text != null ) { 
	str = " where "+search_field +" like '%"+search_text+"%' ";	
}

%>

<% 
// 출력단위 
int unit = 10;

// 출력페이지 번호
String page_no = request.getParameter("page_no");
if( page_no == null || page_no.trim().equals("") ) {
	page_no = "1";
}
if( !page_no.matches("[0-9]+") ) {
	page_no = "1";
}

// SQL에 적용할 시작번호, 끝번호
// page_no -> (1-1)x10+1 : (1), (2-1)*10+1 : (11), (3-1)x10+1 : (21)
int rn_sno = (Integer.parseInt(page_no)-1)*unit + 1;
int rn_eno = rn_sno + (unit-1);

String sql1 = "select count(*) total from pollmain "+str;
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();

// 총 데이터 개수
int total = rs1.getInt("total");

// 총 페이지 수
int totalpage = (int)Math.ceil((double)total/unit);

String sql2 = "select b.* from ( "
    		+ "		select rownum rn, a.* from ( "
        	+ "			select code,title,sdate,edate, decode(use,'Y','사용','비사용') use "
        	+ "				from pollmain order by code desc ) a ) b "
			+ "	where rn between "+rn_sno+" and "+rn_eno;

ResultSet rs2 = stmt.executeQuery(sql2);

//  1 -> 0 ,, 2 -> 10,, 3 -> 20 ,, 4 -> 30
// 출력할 화면의 행 시작번호
int rownum = total - ( (Integer.parseInt(page_no)-1) * unit );

// page_no -> 11,12 ~ 20 -> p_sno:11,p_eno:20  -->  ((17-1)/10)*10 + 1 --> 11;
int p_sno = ((Integer.parseInt(page_no)-1)/10)*10 + 1;
int p_eno = p_sno+9;

if(p_eno > totalpage) {
	p_eno = totalpage;
}

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>설문등록화면</title>
	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../script/jquery-1.12.4.js"></script>
  	<script src="../script/jquery-ui.js"></script>
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
	width:600px;
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
	
	<!-- left menu S -->
	<div class="div2">
	
	<%@ include file="include/left_menu.jsp" %>

	</div>
	<!-- left menu E -->
	
	<div class="div3">
	
		<div style="position:relative; left:20px; top:30px; margin-bottom:10px;">
		</div>

		<div style="position:relative; left:20px; top:30px;">
		<!-- 목록출력 S -->
		

<table class="table1">

<caption class="caption1">목록화면</caption>

	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="13%"/>
		<col width="10%"/>
	</colgroup>

	<tr>
		<th class="th1">번호</th>
		<th class="th1">제목</th>
		<th class="th1">기간</th>
		<th class="th1">결과보기</th>
		<th class="th1">사용여부</th>
	</tr>
	<%
	while( rs2.next() ) {
		String code = rs2.getString("code");
		String title = rs2.getString("title");
		String sdate = rs2.getString("sdate").substring(0,10);
		String edate = rs2.getString("edate").substring(0,10);
		String use = rs2.getString("use");
	%>
	<tr>
		<td class="td1"><%=rownum %></td>
		<td class="td1" style="text-align:left;">&nbsp;
			<a href="pollModify.jsp?code=<%=code %>"><%=title %></a>
		</td>
		<td class="td1"><%=sdate %> ~ <%=edate %></td>
		<td class="td1">[결과보기]</td>
		<td class="td1"><%=use %></td>
	</tr>
	<%
		rownum--;
	}
	%>
</table>

		
			
			
			
		<!-- 목록출력 E -->
		</div>
	</div>
</div>
</body>
</html>












<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<%
String pageNo = request.getParameter("pageNo");
if( pageNo == null || pageNo.equals("") ) {
	pageNo = "1";
}

// 1->1, 2->21, 3->31 
int rn_sno = (Integer.parseInt(pageNo)-1)*10 + 1;
int rn_eno = rn_sno+9;

String sql1 = "select count(*) total from post3";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt("total");

int rownum = total - (Integer.parseInt(pageNo)-1)*10 ;

String sql2 = "select b.* from ( "
    		+ "  select rownum rn, a.* from ( "
    		+ "	    select   rn unq, "
    		+ "              a1 zipcode, "
    		+ "              (a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7||' '||a8) addr"
    		+ "      from post3 ) a ) b "
 			+ " where " 
      		+ "      rn between "+rn_sno+" and "+rn_eno;

ResultSet rs = stmt.executeQuery(sql2);
%>

<!DOCTYPE html>
<html lang="kr">
 <head>
	<meta charset="UTF-8">
	<title>Document</title>

	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">

 </head>

<style>



</style>

<body>

<header>
Header
</header>

<nav>
<%@ include file="../include/topmenu.jsp" %>
</nav>

<section>
	<aside>
	<%@ include file="../include/leftmenu.jsp" %>
	</aside>
	<article>
<div style ="width:600px; margin:0 auto; ">

<table class="table1">

<caption class="caption1">주소</caption>

	<colgroup>
		<col width="10%"/>
		<col width="10%"/>
		<col width="70%"/>
		<col width="10%"/>
		
	</colgroup>

	<tr>
		<th class="th1">번호</th>
		<th class="th1">우편번호</th>
		<th class="th1">주소</th>
		<th class="th1">삭제</th>
	</tr>
	
<%	
while( rs.next() ) {
	

String rn= rs.getString("rn");
String zipcode= rs.getString("zipcode");
String addr= rs.getString("addr");

%>
<tr>
		<td class="td1"><%=rownum %></td>
		<td class="td1"><%=zipcode %></td>
		<td class="td1" style="text-align:left;">&nbsp; <%=addr %> </td>
		<td class="td1"></td>
	</tr>
	<%
		rownum--;
	}
	%>
</table>
<!-- --- -->
	<div>
	<%
	for(int i=1; i<10 ; i++){
		%>
		
		<a href="addrList.jsp"><%=i %></a>
		<%
	}
	
	 %>
	
	
	</div>
	
	<div style="width:600px; margin-top:10px; text-align:right;">
	
	<form name="frm" method="post" action="boardList.jsp" >
	<div style ="float:left; width:50%; text-align:left">
	<select name="search_field">
	
	<option value="">선택</option>
	<option value="title"> 제목 </option>
	<option value="content"> 내용 </option>
	
	</select>
	<input type ="text" name ="search_text">
	<button type="submit" class="btn1"> 검색 </button>
	</div>
	</form>
	<div style ="float:left; width:50%; text-align:right">
	<button type="button" class="button1" onclick="location='boardWrite.jsp';" >글쓰기</button>
	</div>
	</div>
	</div>
	<!-- ------검색 처리-------- -->
	</article>
</section>

<footer>
<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

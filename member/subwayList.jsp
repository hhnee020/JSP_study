<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>
<%

//// 총 데이터의 갯수;
String cnt= "select count(*) cnt from subway1 ";

ResultSet rs= stmt.executeQuery(cnt);
rs.next();
int total = rs.getInt("cnt");


String pageno = request.getParameter("pageno");
/////////////////////////////////////////////////////// 처음 페이지 출력 1 페이지;

if( pageno == null || pageno.equals("") ) {
	pageno = "1";
}

//////////////////////////////////////////////////
/// 첫 페이지, 마지막 페이지;
int pg_start = (Integer.parseInt(pageno)-1)*10+1;
int pg_end = pg_start+(10-1);

/////////////////////////////////////////////////////

int rownum = total -(Integer.parseInt(pageno)-1)*10;

String sql= " select b.* FROM (  "            
			+" select rownum rn , "
			+" a.* from( "
   			+" SELECT LINE , LPAD(time,4,0) time , ENTER ,GETOFF from subway1 "
			+" ) a ) b " 
 			+ " where rn between "+pg_start+" and "+pg_end+" " ;
ResultSet rs2 = stmt.executeQuery(sql);

///////////////////////////////////////////////
int totalpage = (int)Math.ceil((double)total/10);



%>

<!DOCTYPE html>
<html lang="kr">
 <head>
	<meta charset="UTF-8">
	<title>Document</title>

	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">

 </head>

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
		<col width="30%"/>
		<col width="30%"/>
		<col width="30%"/>
	</colgroup>

	<tr>
		<th class="th1">행번호</th>
		<th class="th1">호선</th>
		<th class="th1">시간</th>
		<th class="th1">첫차시간</th>
		<th class="th1">막차시간</th>
	</tr>
	
<%	

while(rs2.next()){
	
	String rn = rs2.getString("rn");
	String line =rs2.getString("line");
	String time =rs2.getString("time");
	String enter =rs2.getString("enter");
	String getoff =rs2.getString("getoff");
	%>
	
	<tr>
	<th class="th1"><%=rownum %></th>
	<th class="th1"><%=line %></th>
	<th class="th1"><%=time %></th>
	<th class="th1"><%=enter %></th>
	<th class="th1"><%=getoff %></th>
</tr>

	
		<% 	
		rownum--; /// 행번호 역순 출력
		}
%>
</table>



	
	</div>
	<div>
	
		<%
		for(int i= 1; i<totalpage ; i++){
			%>
			
			<a href="subwayList.jsp?pageno=<%=i %>"><%=i %></a>
			<%
		}
		
		%>
	
	</div>
	<div style="width:600px; margin-top:10px; text-align:right;">
	
	<form name="frm" method="post" action="boardList.jsp" >
	
	
	
	<!-- ------검색 처리-------- -->
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

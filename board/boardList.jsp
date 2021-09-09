<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<%
//처음 페이지 설정 ; 출력페이지 번호;
String page_no =request.getParameter("page_no"); //사용자가 클릭한 페이지;

if (page_no == null || page_no.trim().equals("") ){
	page_no ="1";
	
}
// 공백인 경우 ,숫자가 아닌경우 

if(!page_no.matches("[0-9]+") ){
	//1개이상 아닌경우
	page_no ="1";
}

int unit=5;

//(1-1)*10+1; +1는 1부터 시작  
//시작 번호;
int rn_sno = (Integer.parseInt(page_no)-1)*unit+1;

//끝번호 ;
int rn_eno =  rn_sno+ (unit-1);


String sql_Total= "select count(*) total from nboard ";
ResultSet rs_Total = stmt.executeQuery(sql_Total);

rs_Total.next();
//총 데이터 수
int total = rs_Total.getInt("total");


int totalpage = (int)Math.ceil((double)total/unit);

String sql2= " select b.* from ("
			+" select rownum rn, a.* from ("
			+" select unq, title, name, to_char(rdate, 'yyy-mm-dd') rdate , hits "
			+" from nboard order by unq desc ) a ) b"
			+" where rn BETWEEN "+rn_sno+" and "+rn_eno+""; 
										// 11,20
										// 21,30
ResultSet rs2 = stmt.executeQuery(sql2);
										
int rownum = total- ( (Integer.parseInt(page_no)-1)*unit );
//행번호 역순 1-0 2-10 3-20
//페이지 수마다 행번호  ; total -10; 전체 게시글 수 - ( ( 현재 페이지 - 1 ) * 페이지 당 게시글 수 )

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

<table class="table1" align="center">

<caption class="caption1">일반게시판 목록화면</caption>

	<colgroup>
		<col width="10%"/>
		<col width="55%"/>
		<col width="10%"/>
		<col width="15%"/>
		<col width="10%"/>
	</colgroup>

	<tr>
		<th class="th1">번호</th>
		<th class="th1">제목</th>
		<th class="th1">글쓴이</th>
		<th class="th1">작성일</th>
		<th class="th1">조회수</th>
	</tr>
	<%
	while(rs2.next() ){
		
		String unq= rs2.getString("unq");
		String title= rs2.getString("title");
		String name= rs2.getString("name");
		String rdate= rs2.getString("rdate");
		String hits= rs2.getString("hits");
	%>
	<tr>
		<th class="td1"><%=rownum %></th>
		<th class="td1" style="text-align:left;">&nbsp;<%=title %></th>
		<th class="td1"><%=name %></th>
		<th class="td1"><%=rdate %></th>
		<th class="td1"><%=hits %></th>
	</tr>
	
	
	<%
		rownum--;
		}
	%>
	
</table>
</form>

	<div style="width:600px; margin-top:10px; text-align:center;">
		<%
		
		for(int i=1; i<= totalpage; i++){
		
		%>
		
			<a href="boardList.jsp?page_no=<%=i %>"><%=i %></a>
		
		<%
		
		}
		
		%>
	<div style="width:600px; margin-top:10px; text-align:right;">
		<button type="button" class="button1" onclick="location='boardWrite.jsp';" >글쓰기</button>
	</div>
	</div>
</div>
	</article>
</section>

<footer>
<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

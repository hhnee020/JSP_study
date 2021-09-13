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



////검색
String search_field = request.getParameter("search_field");
String search_text = request.getParameter("search_text");

String nullfield ="";

/// 검색을 안했을때 필드에 아무것도 없을때 , 있을때만 나오게

if( search_field !=null && search_text !=null ){

nullfield ="  where "+search_field+" like '%"+search_text+"%'" ;

}
///////////////////////////////////////////////


int unit=10;

//(1-1)*10+1; +1는 1부터 시작  
//시작 번호;
int rn_sno = (Integer.parseInt(page_no)-1)*unit+1;

//끝번호 ;
int rn_eno =  rn_sno+ (unit-1);


String sql_Total= "select count(*) total from nboard "+ nullfield ;
ResultSet rs_Total = stmt.executeQuery(sql_Total);

rs_Total.next();
//총 데이터 수
int total = rs_Total.getInt("total");


int totalpage = (int)Math.ceil((double)total/unit);


String sql2= " select b.* from ("
			+" select rownum rn, a.* from ("
			+" select unq, title, name, to_char(rdate, 'yyy-mm-dd') rdate , hits "
			+" from nboard  "+nullfield+" order by unq desc ) a ) b"
			+" where rn BETWEEN "+rn_sno+" and "+rn_eno+""; 
										// 11,20
										// 21,30

// 처음으로 조건문을 쓰면(가장 안쪽 select에 where조건문을 써야  ) 행번호( rownum )가 제대로 출력; 행번호를 맨 마지막으로 출력하기 때문에;										
//sql : 검색을 안하면(null 일때 ) 전체 게시글을 다 보여주게 해야한다; where 조건


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

<table class="table1">

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
		<th class="td1" style="text-align:left;">&nbsp;
			<a href="boardDetail.jsp?unq=<%=unq %>"><%=title %></a>
		</th>
		<th class="td1"><%=name %></th>
		<th class="td1"><%=rdate %></th>
		<th class="td1"><%=hits %></th>
	</tr>
	<%
		rownum--;
		}
	%>
	
</table>
	<!----- 페이징 숫자 처리---------->
	<div style="width:600px; text-align:center;">
		 <%
		 for(int i=1; i<=totalpage; i++) {
		 %>
		 		<a href="boardList.jsp?page_no=<%=i %>"><%=i %></a>
		 <%
		 }
		 %>
	</div>
	<!----- 페이징 숫자 처리---------->
	
	<!-- ------검색 처리-------- -->
	
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

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



///////////////////////////////////////////////



//(1-1)*10+1; +1는 1부터 시작  
//시작 번호;
int rn_sno = (Integer.parseInt(page_no)-1)*10+1;

//끝번호 ;
int rn_eno =  rn_sno+ (10-1);


String sql_Total= "select count(*) total from reboard " ;
ResultSet rs_Total = stmt.executeQuery(sql_Total);

rs_Total.next();
//총 데이터 수
int total = rs_Total.getInt("total");


int totalpage = (int)Math.ceil((double)total/10);



String sql2 = "select b.* from ( "
    		+ "		select rownum rn, a.* from ( "
        	+ "			select unq,title,name,to_char(rdate,'yyyy-mm-dd') rdate, hits , thread "
        	+ "				from reboard order by gid desc , thread asc ) a ) b "
			+ "	where rn between "+rn_sno+" and "+rn_eno;

//select *from reboard order by gid desc, thread asc;
//gid 숫자 높은순 thread 숫자(a부터) 적은순

ResultSet rs2 = stmt.executeQuery(sql2);

int rownum = total- ( (Integer.parseInt(page_no)-1)*10 );
//행번호 역순 1-0 2-10 3-20
//페이지 수마다 행번호  ; total -10; 전체 게시글 수 - ( ( 현재 페이지 - 1 ) * 페이지 당 게시글 수 )

/// 나오게할 페이지번호 갯수;
int pg_sno =  ((Integer.parseInt(page_no)-1)/10)*10+1;
int pg_eno = pg_sno+9;

if(pg_eno > totalpage){
	
	pg_eno = totalpage;
}




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

<caption class="caption1">답변 게시판 목록화면</caption>
		<select name="page_no" onchange="location='reBoardList.jsp?page_no='+this.value ">
		<!-- ---this.value-- -->
		<%
		for(int i=1; i<=totalpage; i++){
			%>
			
			<option value="<%=i %>" <%if (i == Integer.parseInt(page_no) ) { out .print("selected"); } %>><%=i %>page</option>
		<%	
		}
		%>
		
		</select>
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
		String thread = rs2.getString("thread");
		
		String space="";
		for( int i=1 ; i<thread.length(); i++){
			space +="&nbsp;&nbsp;";
			
		}
		if(thread.length()>1){ space += "<img src='../img/re.png' width='25' height='25'>";
			
	}
	%>
	<tr>
		<th class="td1"><%=rownum %></th>
		<th class="td1" style="text-align:left;">&nbsp;
			
			<%=space %><a href="reBoardDetail.jsp?unq=<%=unq %>"><%=title %></a>
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
	
	
	<div>
	
	<a href ="<%=request.getRequestURI() %>?page_no=1">[처음으로]</a>
	
	<% 
	if(  pg_sno == 1 ){ 
		%>
		<span style="color:#6666">[이전으로]</span> 
		<%
		
		}else{
	%>
	<a href ="reBoardList.jsp?page_no=<%=pg_sno-1 %>">[이전으로]</a>
	<%
	}
	 
	 %>
	 
	<%
	for( int i=pg_sno; i<=pg_eno; i++){
	
	%>
	
	<a href ="<%=request.getRequestURI() %>?page_no=<%=i %>">
	
	<%
	if( i == Integer.parseInt(page_no)){
		%>
		<span style="color:green;font-size:14px;font-wight:bold;"><%=i %></span> 
	
	<%
	}else{ out.print( i+ "");
		
	}
	
	%>
									
	</a>
	<%
	}
	%>

	<%
	if( pg_eno == totalpage ){
	%>
		<span style="color:#6666">[다음으로] </span>
		
	
	<%
	
	}else{
	%>
		<a href="<%=request.getRequestURI() %>?page_no=<%=pg_eno+1 %>">[다음으로]</a> 	
	
	<%
	}
	%>
	
	
	
	<a href ="<%=request.getRequestURI() %>?page_no=<%=totalpage %>">[끝으로]</a>
	
	
	
	</div>
	<!----- 페이징 숫자 처리---------->
	
	<!-- ------검색 처리-------- -->
	
	<div style="width:600px; margin-top:10px; text-align:right;">
	
	<form name="frm" method="post" action="reBoardList.jsp" >
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
	<button type="button" class="button1" onclick="location='reBoardWrite.jsp';" >글쓰기</button>
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

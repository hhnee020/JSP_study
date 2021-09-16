<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB conn -->
<%@ include file="../include/dbcon.jsp" %>

<%
String search_field = request.getParameter("search_field");
String search_text = request.getParameter("search_text");

String pageNo = request.getParameter("pageNo");
if(pageNo == null) {
	pageNo = "1";
}

if( search_field == null ) search_field = "";
if( search_text == null ) search_text = "";

String str = " ";

if(     search_field != null && search_text != null 
    && !search_field.equals("") && !search_text.trim().equals("") ) {

	search_text = search_text.replace("'","''");
	str = " WHERE "+search_field+" like '%"+search_text+"%' ";
}

%>

<!-- 전체 데이터 개수 SQL작성 적용 -->
<%

int unit = 10;

// 총 데이터 개수 SQL 작성
String sqlTot = "select count(*) total from post3 " + str;
ResultSet rsTot = stmt.executeQuery(sqlTot);

rsTot.next();
int total = rsTot.getInt("total");

int total_page = (int)(Math.ceil((double)total/unit)); //  (double)51/10 -> ceil(5.1) -> 6 

//(초기)행번호 얻기
int rownum = total - ((Integer.parseInt(pageNo)-1)*unit);

// pageNo 1:1, 2:11, 3:21
int start_no = (Integer.parseInt(pageNo)-1)*unit + 1;
int end_no = (start_no+ (unit-1) );

// 1~10(1) , 11~20(11) , 21~30(21)
// 3->1, 7->1, 10/10->1        , 12/10->11, 15->11, 22->21, 29->21
// 페이징 번호의 초기값 세팅
int page_sno = ((Integer.parseInt(pageNo)-1)/unit)*unit + 1;
// 페이징 번호의 마지막값 세팅
int page_eno = page_sno + (10-1);

if( total_page < page_eno ) {
	page_eno = total_page;
}
%>

<!-- 전체 데이터 목록 SQL작성 적용 -->
<%
String sql = "   SELECT b.* FROM ( "
			+" 		SELECT rownum rn, a.* FROM ( "
			+" 	  		SELECT rn unq, a1 zipcode,(a2||a3||a4||a5||a6||a7||a8) addr "
			+" 				FROM post3 " + str + " ORDER BY a2 ASC, a4 ASC ) a ) b"
			+"	WHERE rn between " + start_no + " AND "+ end_no;
ResultSet rs = stmt.executeQuery(sql);

search_text = search_text.replace("''", "'");
%>
    
<!DOCTYPE html>
<html lang="kr">
 <head>
  <meta charset="UTF-8">
	<title>Document</title>
  	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/emp_style.css">
 </head>

<style>

td {
	text-align:center;
	height:25px;
}
.div_top_button {
	width:600px;
	text-align:right;
	margin-bottom:10px;
}
</style>

<script>
function fn_location(v) {
	
	document.frm.pageNo.value = v;
	document.frm.submit();

}
</script>


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
		<!-- 본문 시작 -->
		<div style="margin:0 auto; width:600px;">
		
			<div style="text-align:left;margin-top:10px;">
			  <form name="frm" method="post" action="<%=request.getRequestURI() %>">
			  
			     <input type="hidden" name="pageNo" value="1">
			  
				 <select name="search_field">
				 	<option value="a1" <%if(search_field.equals("a1")){ out.print("selected"); } %> >우편번호</option>
				 	<option value="a2" <%if(search_field.equals("a2")){ out.print("selected"); } %> >시도</option>
				 	<option value="a3" <%if(search_field.equals("a3")){ out.print("selected"); } %> >구군</option>
				 	<option value="a4" <%if(search_field.equals("a4")){ out.print("selected"); } %> >동리</option>
				 	<option value="a8" <%if(search_field.equals("a8")){ out.print("selected"); } %> >건물명</option>
				 </select>
				 <input type="text" name="search_text" value="<%=search_text %>">
				 <button type="submit">검색</button>
			  </form>
			</div>
			<div class="div_top_button">
				<button type="button" onclick="location='addrWrite.jsp'">등록</button>
			</div>
		
			<table class="tbl1">
				<colgroup>
					<col width="15%" />
					<col width="10%" />
					<col width="*" />
					<col width="10%"/>
				</colgroup>
				<tr bgcolor="#ffcccc">
					<th>번호</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>삭제</th>
				</tr>
				<!-- 출력 -->
				<%
				while( rs.next() ) {
					String zipcode = rs.getString("zipcode");
					String addr = rs.getString("addr");
					String unq = rs.getString("unq");
				%>
					<tr>
						<td><%=rownum %></td>
						<td><%=zipcode %></td>
						<td style="text-align:left;"><%=addr %></td>
						<td>
						
						<a href="passWrite.jsp?unq=<%=unq %>"><img src="../img/del.png" width="20" height="17"></a>
						
						</td>
					</tr>
				<%
					rownum--;
				}
				%>
			</table>
			
			<div style="text-align:center;padding-top:10px;">
				<a href="javascript:fn_location('1')">[처음으로]</a> 
				
				<% 
				if( (page_sno-1) > 0) { 
				%>
					<a href="javascript:fn_location('<%=page_sno-1 %>')">[이전]</a> 
				<%
				}
				%>
				&nbsp;&nbsp;
			<%
			// 취약점 점검
			for(int i=page_sno; i<=page_eno; i++) {
			%>
				<a href="javascript:fn_location('<%=i %>')">
				<%
				if( i == Integer.parseInt(pageNo) ) {
				%>
					<span style="font-size:14px;color:green;font-weight:bold;">
				<%
				} else {
				%>
					<span>
				<%
				}
				%>
				<%=i %>
				</span></a>
			<%
				
			}
			%>
			
			&nbsp;&nbsp; 
			<%
			if(page_eno < total_page) {
			%>
				<a href="javascript:fn_location('<%=page_eno+1 %>')">[다음]</a> 
			<%
			}
			%>
				<a href="javascript:fn_location('<%=total_page %>')">[마지막으로]</a>
			</div>
			
		</div>
	<!-- 본문 종료 -->
	
		</article>
</section>

<footer>

<%@ include file="../include/footmenu.jsp" %>

</footer>

</body>
</html>

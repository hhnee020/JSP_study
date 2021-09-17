<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>



<%





String sql=  "select unq, title , name ,content ,to_date(rdate,'yyyy-mm-dd') rdate , hit  from notice_tbl "
		 + " order by unq asc"; 
ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/main_content.css">
    <link rel="stylesheet" href="css/Notice.css">
    <title>Document</title>
</head>
<style>
.th1{background: #d8d8d8; }
.td1{padding: 0; }

</style>
<script>
function fn_submit() {
	if( document.frm.title.value ==""){
		
		alert();
		document.frm.title.focus();
		return false;
	}
	
	if( document.frm.name.value ==""){
		
		alert();
		document.frm.name.focus();
		return false;
	}

//////
document.frm.submit();


String sql2= "";
				
}

</script>



<body>
    
    <div class="bg_top">
    </div>
    <div class="wrap">

    
    <header>
       <%@ include file="../include/HEADER.jsp" %>

    </header>
    <nav>
         <%@ include file="../include/TOPMENU.jsp" %>
    </nav>
    
    
    <section>
        <article>
     
 <form name="frm" method="post" action="NoticeList.jsp">    
  
<div style ="width:800px; margin:0 auto; ">
<table  style ="width:100%; border-top: 1px solid #666 ">

<caption class="" style = "text-align:left; "><h3>공지사항 등록화면</h3> </caption>

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
	
	while( rs.next() ) { 
	
		String unq = rs.getString("unq");
		String title = rs.getString("title");
		String name = rs.getString("name");
		String rdate = rs.getString("rdate");
		String hit = rs.getString("hit");
	%>
	

	<tr>
		<th class="td1"><%=unq %></th>
		<th class="td1" style="text-align:left;"><%=title %></th>
		<th class="td1"><%=name %></th>
		<th class="td1"><%=rdate %></th>
		<th class="td1"><%=hit %></th>
		
	</tr>
	<%
	}
	%>
</div>
	


</table>
</form>
  
        </article>

    </section>
    <footer>
       <%@ include file="../include/BOTTOM.jsp" %>
    </footer>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>
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

<script>
function fn_submit() {
	if( document.frm.title.value ==""){
		
		alert("제목을 입력해주세요");
		document.frm.title.focus();
		return false;
	}
	
	if( document.frm.name.value ==""){
		
		alert("이름을 입력해주세요");
		document.frm.name.focus();
		return false;
	}

//////
document.frm.submit();
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
     
 <form name="frm" method="post" action="Noticesave.jsp">    
  
 <div style ="width:800px; margin:0 auto; ">
<table  style ="width:100%; border-top: 1px solid #666 ">

<caption class="" style = "text-align:left; "><h3>공지사항 등록화면</h3> </caption>

	<colgroup>
		
		<col width="30%"/>
		
		<col width="*"/>
	</colgroup> 

	<tr>
		<th class="text1">제목</th>
		<td class="td2" style="text-align:left;">
			<input type="text" name="title" class="input1">
		</td>
	</tr>
	
	<tr>
		<th class="text1">이름</th>
		<td class="td2" style="text-align:left;">
		<input type="text" name="name" class="input2"></td>
	</tr>
	
	<tr class="con" style="height: 200px; " >
	
	<th class="text1"  >내용</th>
		<td class="td2" style="text-align:left;">
			<textarea  style="width:50%; height: 200px; "  name="content" class="con2"></textarea>
		</td>
	</tr>
	
	<tr>
		<th colspan="2" height="40">


			<button type="submit" class="button1"  onclick="fn_submit();return false;" >저장</button>
			<button type="reset" class="button1">취소</button>

		</th>
	</tr>

</table>
</div>
</form>
  
        </article>

    </section>
    <footer>
       <%@ include file="../include/BOTTOM.jsp" %>
    </footer>
</body>
</html>
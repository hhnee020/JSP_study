<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/loginCertify.jsp" %>
  
<%
String appdate = request.getParameter("appdate");
if( appdate == null || appdate.trim().equals("") ) {
%>
		<script>
		alert("잘못된 경로로의 접근");
		self.close();
		</script>
<%
		return;
}
String sql = " select title,content from schedule  "
		   + "   where userid='"+LOGIN_USERID+"' "
		   + "     and to_char(appdate,'yyyy-mm-dd') = '"+appdate+"' ";
ResultSet  rs = stmt.executeQuery(sql);

String title = "";
String content = "";
String gubun = "IN";

if( rs.next() ) {
	title = rs.getString("title");
	content = rs.getString("content");
	gubun = "UP";
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>일정(변경)등록</title>

  <link rel="stylesheet" href="../css/jquery-ui.css">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">

  <script src="../script/jquery-1.12.4.js"></script>
  <script src="../script/jquery-ui.js"></script>
  
  <script>
  $( function() {
     $( "#appdate" ).datepicker({
        changeMonth: true,
        changeYear: true
     });
  });
  
  function fn_submit() {
	  if( $("#title").val() == "" ) {
		  alert("제목을 입력해주세요.");
		  $("#title").focus();
		  return false;
	  } 
	  $("#frm").submit();
  }
  </script>
</head>

<style>

.abc1{     /* class="abc1" */
	font-size:12px;
	font-family:'맑은 고딕';
	color:#0f0000;
}
#abc2 {    /* id="abc2" */
	font-size:12px;
	font-family:'맑은 고딕';
	color:#0f0000;
}

body {
	font-size:12px;
	font-family:'맑은 고딕';
	color:#0f0000;
}
table {
	width:98%;
	border-collapse:collapse; /*여백제거*/
}
th, td {
	padding:5px;
	border:1px solid #ccc;
}

</style>

<body>

<form name="frm" id="frm"  method="post" action="planModifySave.jsp" >

	<input type="hidden" name="appdate" value="<%=appdate %>">
	<input type="hidden" name="gubun" value="<%=gubun %>">

<div>
	<table>
		<caption style="font-size:20px;
						font-weight:bold;
						color:#777777;
						margin-bottom:5px;">일정(변경)등록</caption>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" 
								   value="<%=title %>" style="width:98%;"></td>
		</tr>
		<tr>
			<th>적용일</th>
			<td>
			<%=appdate %>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="content" 
					style="width:96%;height:150px;"><%=content %></textarea></td>
		</tr>
	</table>
	
	<div style="width:98%; text-align:center; margin-top:10px;">
		<button type="submit" onclick="fn_submit();return false;" >저장</button>
		<button type="button" onclick="self.close();">닫기</button>
	</div>

</div>
</form>
</body>
</html>




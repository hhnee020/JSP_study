<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>

  <link rel="stylesheet" href="../css/jquery-ui.css">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
  
  <script src="../script/jquery-1.12.4.js"></script>
  <script src="/jsp_study/script/jquery-ui.js"></script>
  
  <!----script src="http://localhost:9080/jsp_study/script/jquery-ui.js"></script>
   <!-- -- --<script src="../script/jquery-ui.js"></script> - -->
  <script>
  $( function() {
    $( "#sdate" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
    $( "#edate" ).datepicker({
        changeMonth: true,
        changeYear: true
      });
  });
  
  function fn_submit() {
	  
	  /*var f = document.frm;
	  if( f.title.value == "" ) {
		  alert("제목을 입력해주세요.");
	  }
	  if( f.sdate.value == "" ) {
	  }
	  if( f.edate.value == "" ) {  
	  }
	  f.submit();*/
	  
	  if(document.frm.title.value == "") { 
	  }
	  if(document.getElementById("title").value == "" ) {
	  } 
	  
	  if( $("#title").val() == "" ) {
		  alert("제목을 입력해주세요.");
		  $("#title").focus();
		  return false;
	  } 
	  if( $("#sdate").val() == "" ) {
		  alert("시작날짜를 입력해주세요.");
		  $("#sdate").focus();
		  return false;
	  } 
	  if( $("#edate").val() == "" ) {
		  alert("종료날짜를 입력해주세요.");
		  $("#edate").focus();
		  return false;
	  } 
	  
	  // document.frm.submit();
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

<form name="frm" id="frm"  method="post" action="planWriteSave.jsp" >
<div>
	<table>
		<caption>일정등록</caption>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" style="width:98%;"></td>
		</tr>
		<tr>
			<th>적용기간</th>
			<td>
			<input type="text" name="sdate" id="sdate">
			~
			<input type="text" name="edate" id="edate">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="content" style="width:96%;height:150px;"></textarea></td>
		</tr>
	</table>
	
	<div style="width:98%; text-align:center; margin-top:10px;">
		<button type="submit" onclick="fn_submit();return false;" >등록</button>
		<button type="button" onclick="self.close();">닫기</button>
	</div>

</div>
</form>
</body>
</html>




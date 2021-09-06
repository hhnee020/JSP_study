<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
body {
   font-size:12px;
   font-family:'맑은 고딕';
}
table {
   width:400px;
   border:1px solid #ccc;
   border-collapse:collapse;
}
th, td {
   border:1px solid #ccc;
   padding:5px;
}
</style>

<script>
/// 공백이 저장되는 걸 막는 것을 막는것을 처리;
function fn_submit(){
	
	if( document.frm.deptno.value == "" ){
		
		alert("부서번호를 입력해 주세요;");
		 document.frm.deptno.focus();
		 return false; 
		 
	}
	
	
	
	if( document.frm.dname.value == "" ){
			
			alert("부서이름을 입력해 주세요;");
			 document.frm.dname.focus();
			 return false;
			 
	}
	
///////////		
	document.frm.submit();
	
}

</script>


<body>

<form name="frm" method="post" action="deptWriteSave.jsp">

<table>
   <tr>
      <th>부서번호</th>
      <td><input type="text" name="deptno"></td>
   </tr>
   <tr>
      <th>부서이름</th>
      <td><input type="text" name="dname"></td>
   </tr>
   <tr>
      <th>부서위치</th>
      <td><input type="text" name="loc"></td>
   </tr>
   <tr>
      <th colspan="2">
      <button type="submit" onclick="fn_submit(); return false">등록</button>
       <!-- -- return false  : 저장 기능 을 없앤다;  저장을 막기 위해 --> 
      <button type="reset">취소</button>
      </th>
   </tr>
</table>

<div style="width:400px; text-align:right; margin-top:10px;">
	<button type="button" onclick="location='deptList.jsp'">목록으로</button>
</div>
</form>
</body>
</html>






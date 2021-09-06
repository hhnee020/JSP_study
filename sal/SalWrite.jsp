<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 테이블 </title>
</head>


<script>
/// 공백이 저장되는 걸 막는 것을 막는것을 처리;
function fn_submit(){
	
	if( document.frm.grade.value == "" ){
		
		alert("급여 등급 을  입력해 주세요;");
		 document.frm.grade.focus();
		 return false; 
		 
	}
	
	
	
	if( document.frm.lowsal.value == "" ){
			
			alert("최저 급여를  입력해 주세요;");
			 document.frm.lowsal.focus();
			 return false;
			 
	}
	

	if( document.frm.hisal.value == "" ){
			
			alert(" 최고 급여를  입력해 주세요;");
			 document.frm.hisal.focus();
			 return false;
			 
	}
///////////		
	document.frm.submit();
	
}
</script>

<body>




<form name="frm" method="post" action="SalWriteSave.jsp">

<table>
   <tr>
      <th> 급여 등급 </th>
      <td><input type="text" name="grade"></td>
   </tr>
   <tr>
      <th> 최저 급여  </th>
      <td><input type="text" name="lowsal"></td>
   </tr>
   <tr>
      <th> 최고 급여  </th>
      <td><input type="text" name="hisal"></td>
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
	<button type="button" onclick="location='SalList.jsp'">목록으로</button>
</div>
</form>


</body>
</html>
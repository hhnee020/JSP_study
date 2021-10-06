<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
    
     }
  
  
    function fn_submit() {
		var f = document.frm;
		if( f.title.value ==""){
			
			
		}
		
		if(  f.sdate.value =="" ){
			
			
		}
		
		if(  f.edate.value =="" ){
			
			
		}
		if(  f.content.value  =="" ){
			
			
		}
	}
    
 
</script>

</head>

<style>



</style>
<body>

<form name="frm"  action=""></form>
	<div>
	
	 <table>
	 <caption>일정등록</caption>
	 <tr>
	 <th>제목 </th>
	 	
	 	<td> <input type="text" name="title" id="title">
	 	</td>
	 
	 
	 </tr>
	 
	  <tr>
	 <th>적용기간 </th>
	 	<td>  <input type="text" name="sdate" id="sdate">
	 		<input type="text" name="edate" id="edate"> 
	 	</td>

	 
	 </tr>
	 
	   <tr>
	 <th>내용 </th>
	 	<td>  <textarea name="content" id="content" style="width" >
	 		 </textarea>
	 	</td>
	 
	
	 </table>
	
	<div style="width:98%; text-align:center; magin-top:10px">
	
		<button type="submit"> 등록</button>
		<button type="button"> 닫기 </button>
	</div>
	
	
	</div>
</body>
</html>
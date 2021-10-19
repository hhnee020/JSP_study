<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<script>
$(function(){
	
	$("#btn_save").click(function(){
		
		var eng = $("#eng").val();
		var kor =$("#kor").val();
		
		$.ajax({  
			type : "get",
			data : "eng="+eng+"&kor=" +kor,
			url  : "ajaxWritesave.jsp",
			
			datatype : "json",

			success : function(data) {
				var datas= JSON.parse(data); // 데이터를 가져올때;
				var str= datas.msg +",";
				 str += datas.kor+",";
				 str += datas.eng;
				
				$("#parse_area").html(str);
				
				
			},
			error : function() {
				alert("전송실패");
			}
		});
	});
});

</script>

<body>


영어점수 : <input type="text" name="eng" id="eng"> 
국어점수 : <input type="text" name="kor" id="kor"> 
<button type="button" id="btn_save">전송</button>
<br>
결과 : <span id="parse_area"></span>

</body>
</html>





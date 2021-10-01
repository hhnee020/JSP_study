<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>     
<%@ include file ="../include/dbcon.jsp" %>

<%

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

//3기지 요소공백 체크
///유효성 체크
//신규 ==  재설정
//전송

function fn_submit() {
	
	var f= doument.frm;
	
	
	if( f.pass1.value ="" || f.pass2.value ="" || f.pass3.value ="" ){
		
		alert("");
		
		return false;
	}
	
	f.pass2.value= f.pass2.value.replace(" ","");
	
	if( f.pass2.value.lenght<6 || f.pass2.value.lenght >12  ){
		
		alert("");
		f.pass2.focus();
		return false;
	}
	
	if( f.pass2.value != f.pass3.value  ){
		
		alert("");
		
		return false;
	}
	
	f.submit();
	
	
}


</script>

<body>
<form name ="frm" method="post" action="passChangeSub.jsp">
<table>

<tr>
<th>기존 암호 입력</th>
<td> <input type ="password" name ="pass1"> </td>
</tr>

<tr>
<th>신규 암호 입력</th>
<td> <input type ="password"  name ="pass2"> </td>
</tr>


<tr>
<th>신규 암호 재 입력</th>
<td> <input type ="password"  name ="pass3"> </td>
</tr>



</table>

<div>
	<button type="submit" onclick="fn_submit();">전송</button>
	<button type="button"  onclick="self.close();">닫기</button>
	</div>

</form>
</body>
</html>
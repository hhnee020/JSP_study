<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ex1 --> 
<%
String address = "  123456 서울시 강남구 논현동77  ";
String addr = address.trim();
String[] array = addr.split(" ");
%>
<p>전송 데이터 : <%=addr %></p>
<ol>
	<li>문자열의 길이 : <%=addr.length() %> </li>
 	<li>우편번호 : <%=array[0] %> </li>
 	<li>주소 : <%=addr.replace(array[0],"").trim() %> </li>
 	<li>검색단어 : <%=(addr.indexOf("논현")>-1)?"존재함":"못찾음" %> </li>
</ol>


<!-- ex2 --> 
<%
 String birthday = "20100115 20011225 19981102";
 array = birthday.split(" ");
%>
<table width="500" cellpadding="5" cellsapcing="0">
	<tr>
		<td> <h2>[분석결과]</h2> </td>
	</tr>
	<tr>
		<td> 전송데이터 : <%=birthday %> </td>
	</tr>
	<%
	for(int i=0; i<array.length; i++) {
		String str = array[i];
		String yy = str.substring(0,4);
		String mm = str.substring(4,6);
		String dd = str.substring(6);
		
		int age = 2021 - Integer.parseInt(yy);
	%>
	<tr>
		<td> 데이터 <%=i+1 %> : 나이(만 <%=age %>세), 생일(<%=mm %>월 <%=dd %>일) </td>
	</tr>
	<%
	}
	%>

</table>


<%
String bir ="20100115 20011225 19981102";
array= bir.split(" ");
%>

<%=bir %>

<%
int a=0;
int g=0;

for(a=0; a< array.length; a++){
	
	String str =  array[a];
	
	String b = str.substring(0,4);
	String c = str.substring(4,6);
	String d = str.substring(6);
	
	g = 2021 - Integer.parseInt(b);
}

%>








</body>
</html>





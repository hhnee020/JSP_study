<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// year = 2021; month = 5;
String year = request.getParameter("year"); 
String month = request.getParameter("month");
%>  

<%
// 달력클래스의 인스턴스(객체)화
Calendar cal = Calendar.getInstance();

int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH);
int dd = cal.get(Calendar.DATE);

if(		year != null && 
		month != null  &&
 	    !year.equals("") && 
 	    !month.equals("")  ) {
	yy = Integer.parseInt(year);
	mm = Integer.parseInt(month)-1;  // 5 
} 

// 출력 달의 1일날의 요일
cal.set(yy,mm,1);
int wday = cal.get(Calendar.DAY_OF_WEEK);  // 일(1) ~ 토(7) , 결과 : 4

// 출력 달의 마지말 날
int lastday = cal.getActualMaximum(Calendar.DATE); // 마지막날짜 , 결과 : 30

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
body {
	font-size:12px;
	font-family:'맑은 고딕','arail';
	color:#1a1a1a;
}
table {
	width:500px;
	border:1px solid #ccc;
	border-collapse:collapse;
}
th,td {
	text-align:center;
	height:50px;
	border:1px solid #ccc;
}
.div1 {
	width:500px;
	text-align:center;
	font-size:20px;
	font-weight:bold;
	margin-bottom:5px;
}

.div2 {
	width:500px;
	text-align:right;
	font-size:12px;
	margin-bottom:15px;
}

</style>

<body>

<div class="div2">
	<form name="frm" method="post" action="cal2.jsp">
	<input type="text" name="year" style="width:50px;">년
	<input type="text" name="month" style="width:50px;">월
	<button type="submit">달력보기</button>
	</form>
</div>

<div class="div1">
	<%=yy %>년 <%=mm+1 %>월	
</div>

<table>
	<colgroup>
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="*" />
	</colgroup>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	
	<tr>
	<%
	/*
	 * cnt : 줄바꿈의 요소로 이용 */
	int cnt = 0;
	for(int i=1; i<wday; i++) {
		cnt++;
		out.print("<td></td>");
	}
	%>

	<%
	String color = "";
	for(int d=1; d<=lastday; d++) {
		cnt++;
		
		if(cnt%7==0) color="blue"; 
		else if(cnt%7==1) color="red";
		else color="#1a1a1a";
		
		if(d==dd) color = "green;font-weight:bold;";

	%>
		<td>
		<span style="color:<%=color%>"><%=d %></span>
		</td>
	<%
		if( cnt%7 == 0 ) {
			out.print("</tr><tr>");
		}
	}
	%>
	</tr>
</table>


</body>
</html>









<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../include/loginCertify.jsp" %>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
%>


<%
// 달력클래스의 인스턴스(객체)화
Calendar cal = Calendar.getInstance();

int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH);
int dd = cal.get(Calendar.DATE);

if(year != null && month != null) {
	yy = Integer.parseInt(year);
	mm = Integer.parseInt(month)-1;  // 9-->8
}

int b_year = yy;
int b_month = (mm+1)-1;

if( b_month == 0) {
	b_year--;
	b_month = 12;
}

int n_year = yy;
int n_month = (mm+1)+1;

if( n_month == 13) {
	n_year++;
	n_month = 1;
}

// mm 0 ~ 11
cal.set(yy,mm,1);


int wday = cal.get(Calendar.DAY_OF_WEEK);  // 일(1) ~ 토(7) , 결과 : 4
// 출력 달의 마지말 날
int lastday = cal.getActualMaximum(Calendar.DATE); // 마지막날짜 , 결과 : 30
%>


<!DOCTYPE html>
<html lang="kr">
 <head>
  <meta charset="UTF-8">
	<title>Document</title>
  	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">
 </head>

<style>
body {
	font-size:12px;
	font-family:'맑은 고딕','arail';
	color:#1a1a1a;
}
table {
	width:780px;
	border:1px solid #ccc;
	border-collapse:collapse;
}
th {
	text-align:center;
	height:25px;
	border:1px solid #ccc;
}
td {
	text-align:center;
	height:65px;
	border:1px solid #ccc;
}
.div1 {
	width:780px;
	text-align:left;
	font-size:20px;
	font-weight:bold;
	margin-bottom:5px;
}
</style>

<script>
function fn_cal(y,m) {
	document.hidden_frm.year.value = y;
	document.hidden_frm.month.value = m;
	document.hidden_frm.submit();
}
function fn_planWrite() {
	var url = "planWrite.jsp";
	var w = window.screen.width/2 - 250;
	var h = window.screen.height/2 - 200;
	window.open(url,"planWrite","width=500,height=400,left="+w+",top="+h);
}
// 2021-10-15
function fn_planModify(v) {
	
	var url = "planModify.jsp?appdate="+v;
	var w = window.screen.width/2 - 250;
	var h = window.screen.height/2 - 200;
	window.open(url,"planWrite","width=500,height=400,left="+w+",top="+h);
	
}
</script>

<body>

<header>
Header
</header>

<nav>
	<!-- 탑 메뉴 시작 -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- 탑 메뉴 종료 -->
</nav>

<section>
	<aside>
		<!-- 좌 메뉴 시작 -->
		<%@ include file="../include/leftmenu.jsp" %>
		<!-- 좌 메뉴 종료 -->
	</aside>
	<article>
	<div style="position:relative;left:20px;">
		<div class="div1">
			<%=yy %>년 <%=((mm+1) < 10)?"0"+(mm+1):(mm+1) %>월	
			
			<a href="javascript:fn_cal('<%=b_year %>','<%=b_month %>')">
			<span style="font-size:8px;
			             padding:5px;
						 border:1px solid #ccc;;">◀</span></a>
						 
			<a href="javascript:fn_cal('<%=n_year %>','<%=n_month %>')">
			<span style="font-size:8px;
			             padding:5px;
						 border:1px solid #ccc;">▶</span></a>
			
			<a href="<%=request.getRequestURI()%>">			 
			<span style="font-size:12px;
			             padding:5px;
						 border:1px solid #ccc;">오늘</span></a>
						 
			<a href="javascript:fn_planWrite()">			 
			<span style="font-size:12px;
			             padding:5px;
						 border:1px solid #ccc;">일정등록</span></a>			 
		</div>
		<div>
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
			for(int d=1; d<=lastday; d++) {
				cnt++;
				
				String date = yy + "-" + (((mm+1)<10)?"0"+(mm+1):(mm+1)) + "-" + ((d<10)?"0"+d:d);
				
				String sql = "select substr(title,0,10) title from schedule "    // 2021-10-15
						   + "   where userid='"+LOGIN_USERID+"' and to_char(appdate,'yyyy-mm-dd')='"+date+"' ";
				ResultSet rs = stmt.executeQuery(sql);
				String title = "";
				if( rs.next() ) {  title = rs.getString("title");  }
			%>
				<td>
				
				<a href="javascript:fn_planModify('<%=date %>')"><%=d %></a>
				
				<br>
				<%=title %>
				</td>
			<%
				if( cnt%7 == 0 ) {
					out.print("</tr><tr>");
				}
			}

			while(cnt%7 != 0) {
				out.print("<td></td>");
				cnt++;
			}
			%>
			</tr>
			
			
		</table>
		</div>

	</div>

	<form name="hidden_frm" method="post" action="<%=request.getRequestURI() %>">
		<input type="hidden" name="year">
		<input type="hidden" name="month">
	</form>

	</article>
</section>

<footer>
	<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

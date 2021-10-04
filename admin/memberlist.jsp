<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="adminCertify.jsp" %>

<%
String s_field = request.getParameter("s_field");
String s_text = request.getParameter("s_text");

String s_gender = request.getParameter("s_gender"); ///null ,f,m


String s_age = request.getParameter("s_age");

String s_date = request.getParameter("s_date");

if(s_field == null || s_text == null) {
	s_field = "";
	s_text  = "";
}/// 필드가 다르므로 젠더와 다르게 null처리


/////////////////////////////////


if( s_gender== null ) {
	s_gender = "";
	
}

///////////////////////////// 나이가 공백일때 [나이 선택 ]

if( s_age    == null ) {
	
	s_age = "";
}

/////////////////////////////// 등록일

if( s_date    == null ) {
	
	s_date = "";
}


///////////////////////////





String search = "";
s_text = s_text.trim();

/*if( !s_text.equals("")  && s_gender.equals("") ) {
	
	search=" WHERE gender='"+s_gender+"' ";
	
}else if(  !s_text.equals("")  && !s_gender.equals("") ){
	
	search = " WHERE " +  s_field + " like '%"+s_text+"%' ";
	
///젠더 를 검색 안할때
	
}else if(  !s_text.equals("") ){
	
	search = " WHERE " +  s_field + " like '%"+s_text+"%' and gender='"+s_gender+"' ";
}/// gender, 필드 둘다 검색;
*/



//////////////// null 이 아닌경우

if( !s_gender.equals("")   ) {
	
	search +=" and  gender='"+s_gender+"' ";
	///성별이 공백이 아닌경우 
}


if(  !s_text.equals("") ){
	
	search += " and " +  s_field + " like '%"+s_text+"%' ";
/// 검색어가 공백이 아닌경우
}
 

if(  !s_age.equals("") ){

	
/*
캘린더 클래스 사용
Calendar cal = Calendar.getInstance();

int yaer = cal.get(Calendar.YEAR);
//(2021-22) : 1999+ 1=2000;
yaer = (yaer - Integer.parseInt(s_age)) + 1;*/

//select * from member_info where to_char(birth,'yyyy') ='2000'; 

search += " and (to_char(sysdate ,'yyyy')) - to_char(birth,'yyyy') +1 = '"+s_age+"' ";




// sql 나이구하기
//select * from member_info
//where (to_char(sysdate ,'yyyy')) - to_char(birth,'yyyy') +1  =21;
}



/////////////////////

if( !s_date.equals("")  ){
	
	
	/*/////// 2020 , 2020-02 , 2020-02-25
	if( s_date.length() ==4 ){
	search += " and to_char(rdate,'yyyy' ) ='"+s_date+"' ";
	//select * from member_info where to_char( rdate ,'yyyy' ) = '2021 -02-21';
	
	}else if( s_date.length() ==7){
		search += " and to_char(rdate,'yyyy-mm' ) ='"+s_date+"' ";
		
	}else if( s_date.length() == 10){
		search += " and to_char(rdate,'yyyy-mm-dd' ) ='"+s_date+"' ";
			
	}*/
	
		search += " and  to_char(rdate , 'yyyy-mm-dd' ) like '"+s_date+"%' ";//s_date 로 시작
		//select * from member_info where to_char( rdate ,'yyyy' ) = '2021 -02-21';
		
		
	
}

/////////////////////////////////////
%>

<%
String sql1 = "SELECT COUNT(*) total FROM member_info  where 1=1 " + search; // 1=1 트루 sql 허용하기 위해  
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt("total");
int rownum = total;

String sql2 = "  SELECT userid,"
			+"			name,"
			+"			decode(gender,'M','남','F','여') gender  ,"
			+"			(to_char(sysdate,'yyyy') - to_char(birth,'yyyy') +1) age,"
			+"			addr1,"
			+"			phone,"	
			+"			to_char(rdate,'yyyy-mm-dd') rdate "
			+"	  FROM "
			+"		member_info  where 1=1 " + search;

ResultSet rs2 = stmt.executeQuery(sql2);
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
	font-family:'맑은 고딕';
}
.div_top {
	width:100%; 
	text-align:center;
	background:#cccccc;
	padding-top:10px;
	padding-bottom:10px;
}
.div1 {
	width:1200px;
}
.div2 {
	float:left;width:200px;height:500px;
	background:yellow;
}
.div3 {
	float:left;width:1000px;height:500px; 
	background:#fff;
}

table {
	width:800px;
	border-collapse:collapse;
}
th {
	border:1px solid #ccc;
	padding:5px;
} 
td {
	border:1px solid #ccc;
	padding:3px;
	text-align:center;
}
</style>

<body>

<div class="div1">

	<div class="div_top">
		<h2>관리자모드</h2>
	</div>
	<div class="div2">
	<!-- left menu S -->
		<div style="position:relative; left:10px; top:30px;">
			<a href="memberlist.jsp">회원관리</a> <br>
			<a href="boardList.jsp">게시판관리</a> <br>
			<a href="main.jsp">메인화면관리</a>
		</div>
	<!-- left menu E -->
	</div>
	<div class="div3">
	
		<div style="position:relative; left:20px; top:30px; margin-bottom:10px;">
		<form name="frm" method="post" action="<%=request.getRequestURI() %>">
		
		<!-- ------------   나이   --------- -->
			<select name="s_age">
				<option value="" >나이선택</option>
				<% for( int i= 1; i<=100; i++){

				%>	
					
					<option value="<%=i%>" 
					<% if( s_age.equals( Integer.toString(i) )   ) { out.print("selected"); } %>> <%=i %>세 </option>
					<!-- -------나이 검색을 안했을 때 (null)
					Integer.parseInt(s_age) 공백 처리를 하지 못 함
					숫자 이기때문에---- -->
					
				<% 
				}
				%>

				
			</select>
		
		
			<select name="s_gender">
				<option value="" >성별선택</option>
				<option value="M"  <% if(s_field.equals("M")) { out.print("selected"); } %>>남성</option>
				<option value="F"  <% if(s_field.equals("F")) { out.print("selected"); } %>>여성</option>
			</select>
			
			
			<input type="text" name="s_date" value="<%=s_date %>" placeholder="등록일 검색"  style="width:80px;">
			
			
			
			<select name="s_field">
				<option value="userid" <% if(s_field.equals("userid")) { out.print("selected"); } %>>아이디</option>
				<option value="name" <% if(s_field.equals("name")) { out.print("selected"); } %> > 이름</option>
				<option value="phone" <% if(s_field.equals("phone")) { out.print("selected");} %> > 핸드폰</option>
				<option value="addr1" <% if(s_field.equals("addr1")) { out.print("selected"); } %> > 지역</option>
			
			
			
			</select>
			<input type="text" name="s_text" style="width:100px;">
			<button type="submit">검색</button>
		</form>
		</div>

		<div style="position:relative; left:20px; top:30px;">
			총 검색 갯수 <%=total %>
	<table>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>핸드폰</th>
			<th>지역</th>
			<th>등록일</th>
		</tr>
		<%
		while( rs2.next()  ) {
			
			String userid = rs2.getString("userid");
			String name = rs2.getString("name");
			String gender = rs2.getString("gender");
			String phone = rs2.getString("phone");
			String addr1 = rs2.getString("addr1");
			String rdate = rs2.getString("rdate");
			String age = rs2.getString("age");
			String[] array = addr1.split(" ");
		%>
		<tr>
			<td><%=rownum %></td>
			<td><%=userid %></td>
			<td><%=name %></td>
			<td><%=gender %></td>
			<td><%=age %></td>
			<td><%=phone %></td>
			<td><%=array[0] %></td>
			<td><%=rdate %></td>
		</tr>
		<%
			rownum--;
		}
		%>
	
	</table>
		</div>
	</div>
</div>
</body>
</html>












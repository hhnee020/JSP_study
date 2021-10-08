<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<% 
String user_id = (String)session.getAttribute("USER_ID");
if( user_id == null ) {
%>
		<script>
		location="loginWrite.jsp";
		</script>
<%
		return;
}

// SQL 작성 및 적용
String sql = " select  name,"
					+" gender,"
					+" to_char(birth,'yyyy-mm-dd') birth,"
					+" phone,"
					+" zipcode,"
					+" addr1,"
					+" addr2,"
					+" hobby,"
					+" email,"
					+" homepage,"
					+" to_char(rdate,'yyyy-mm-dd') rdate "
				+" from "
				+"		member_info "
				+" where "
				+" 		userid='"+user_id+"' ";

ResultSet rs = stmt.executeQuery(sql);

String name 	= "";
String gender 	= "";
String birth 	= "";
String phone 	= "";
String zipcode 	= "";
String addr1 	= "";
String addr2 	= "";
String hobby 	= "";
String email 	= "";
String homepage = "";
String rdate 	= "";

if( rs.next() ) {
	 name 	= rs.getString("name");
	 gender = rs.getString("gender");
	 birth 	= rs.getString("birth");
	 phone 	= rs.getString("phone");
	 zipcode = rs.getString("zipcode");
	 addr1 	= rs.getString("addr1");
	 addr2 	= rs.getString("addr2");
	 hobby 	= rs.getString("hobby");
	 email 	= rs.getString("email");
	 homepage = rs.getString("homepage");
	 rdate 	= rs.getString("rdate");
	 
	 if(  addr2 == null || hobby == null || email == null || homepage == null    ){
		 
		 addr2 ="";
		 hobby ="";
		 email ="";
		 homepage="";
		 
	 }
}

String point = "<span style='color:red'>*</span>";
%>

<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
	<title>Document</title>
  	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">
</head>

<script>

function fn_post() {
	
	var url = "postcheck.jsp";
	window.open(url,"post","width=500,height=300");
}

function fn_change() {	
	
	var y=document.frm.year.value;  // 2020
	var m=document.frm.month.value; // 2
   
	var lastDate = new Date(y, m, 0).getDate();
	//var lastDate = new Date(2020, 6, 31).getDate();
	
	var options = "";
	for(var i=1; i<=lastDate; i++) {
		options += "<option value='"+i+"'>"+i+"일</option>";
	}
	document.getElementById('day').innerHTML = options;
}

function fn_submit() {

	var f = document.frm;
	
	if( f.idcheck.value != "Y" ) {
		alert("중복체크를 해주세요.");
		return false;
	}
	if( f.userid.value == "" ) {
		alert("아이디를 입력해주세요.");
		f.userid.focus();
		return false;
	}
	if( f.userpw.value == "" ) {
		alert("암호를 입력해주세요.");
		f.userpw.focus();
		return false;
	}
	if( f.name.value == "" ) {
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	if(	f.hp1.value=="" || f.hp2.value=="" || f.hp3.value=="") {
		alert("핸드폰 번호를 입력해주세요.");
		f.hp2.focus();
		return false;
	}
	
	f.submit();
	
}
function fn_idcheck() {
	
	var userid = document.frm.userid.value;
	if( userid == "" ) {
		alert("아이디를 입력해주세요~");
		return false;
	}
	if( userid.length < 4 || userid.length > 12 ) {
		alert("아이디는 4자~12사이로 해주세요.");
		return false;
	}
	
	var w = window.screen.width/2 - 150;
	var h = window.screen.height/2 - 75;
	
	var url = "idcheck.jsp?userid="+userid;
	window.open(url,"idcheck","width=300,height=150,left="+w+",top="+h);
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

<form name="frm" method="post" action="memberModifySave.jsp">

<table class="table1" align="center">
	<caption class="caption1">
		회원정보변경
	</caption>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>

	<tr>
		<th class="th1"><%=point %> 아이디</th>
		<td class="td2">
			<%=user_id %>
		</td>
	</tr>
	<tr>
		<th class="th1"><%=point %> 암호</th>
		<td class="td2"><input type="password" name="userpw" class="input2" placeholder="암호입력"></td>
	</tr>
	<tr>
		<th class="th1"><%=point %> 이름</th>
		<td class="td2"><input type="text" name="name" value="<%=name %>" class="input2" maxlength="20" placeholder="이름입력" ></td>
	</tr>
	<tr>
		<th class="th1"><%=point %> 성별</th>
		<td class="td2">
			<select name="gender">
				<option value="M" <%if(gender.equals("M")) { out.print("selected"); } %> >남</option>
				<option value="F" <%if(gender.equals("F")) { out.print("selected"); } %> >여</option>
			</select>
		</td>
	</tr>
	
	<%
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	
	int y_s = yy - 80;
	int y_e = yy - 1;
	
	int y_set = yy-20;
	int m_set = 1;
	
	int lastday = 31;
	/*if( y != null && m != null ) {
		
		cal.set(Integer.parseInt(y),Integer.parseInt(m)-1,1);
		lastday = cal.getActualMaximum(Calendar.DATE);
		
		y_set = Integer.parseInt(y);
		m_set = Integer.parseInt(m);
	}*/
	%>
	
	<tr>
		<th class="th1"><%=point %> 출생일</th>
		<td class="td2">

			<%
			String[] array = birth.split("-");
			%>

			<select name="year" onchange="fn_change()">
			<%
			for(int i=y_s; i<=y_e; i++) {
			%>
				<option value="<%=i %>" <%if(Integer.parseInt(array[0]) == i){ out.print("selected"); } %>   > <%=i %>년 </option>
			<%
			}
			%>
			</select>
			
			<select name="month" onchange="fn_change()">
			<%
			for(int i=1; i<=12; i++) {
			%>
				<option value="<%=i %>" <%if(Integer.parseInt(array[1]) == i) { out.print("selected"); } %> ><%=i %>월</option>
			<%
			}
			%>
			</select>
			<select name="day" id="day">
			<%
			for(int d=1; d<=31; d++) {
			%>
				<option value="<%=d %>" <%if(Integer.parseInt(array[2]) == d) { out.print("selected"); } %> ><%=d %>일</option>
			<%
			}
			%>
			</select>
		</td>
	</tr>
	<%
	  String[] array2 = phone.split("-"); 
	%>
	
	<tr>
		<th class="th1"><%=point %> 핸드폰</th>
		<td class="td2">
		<select name="hp1">
			<option value="010" <%if(array2[0].equals("010")){ out.print("selected");  } %> >010</option>
			<option value="011" <%if(array2[0].equals("011")){ out.print("selected");  } %>>011</option>
		</select>
		<input type="text" name="hp2" class="input1" value="<%=array2[1] %>" style="width:48px;" maxlength="4">
		<input type="text" name="hp3" class="input1" value="<%=array2[2] %>" style="width:48px;" maxlength="4">
		</td>
	</tr>
	
	<tr>
		<th class="th1">주소</th>
		<td class="td2">
		<input type="text" name="zipcode" value="<%=zipcode %>" class="input1" style="width:48px;" maxlength="6">
		<button type="button" onclick="fn_post()">우편번호 </button>
		<input type="text" name="addr1" value="<%=addr1 %>" class="input1">
		<input type="text" name="addr2" value="<%=addr2 %>" class="input1">
		</td>
	</tr>
	
	<%
	// hobby = "축구,야구"
	%>
	
	<tr>
		<th class="th1">취미</th>
		<td class="td2">
			<input type="checkbox" name="hobby" value="바둑" 
					<%if(hobby.indexOf("바둑") > -1){ out.print("checked");  } %> >바둑,
			<input type="checkbox" name="hobby" value="야구" 
					<%if(hobby.indexOf("야구") > -1){ out.print("checked");  } %> >야구,
			<input type="checkbox" name="hobby" value="축구"   
					<%if(hobby.indexOf("축구") > -1){ out.print("checked");  } %> >축구
		</td>
	</tr>
	<tr>
		<th class="th1">이메일</th>
		<td class="td2"><input type="email" name="email" value="<%=email %>" class="input2"></td>
	</tr>

	<tr>
		<th class="th1">홈페이지</th>
		<td class="td2"><input type="url" name="homepage" value="<%=homepage %>" class="input2"></td>
	</tr>

	<tr>
		<th class="th1" colspan="2">
			<input type="submit" value="저장" class="button1" onclick="fn_submit(); return false;">
			<input type="reset" value="재설정" class="button1">
		</th>
	</tr>
</table>

</form>


	</article>
</section>

<footer>
	<%@ include file="../include/footmenu.jsp" %>
</footer>

</body>
</html>

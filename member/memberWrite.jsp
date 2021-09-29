<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ include file ="../include/dbcon.jsp" %>
<%

String y= request.getParameter("y");
String m= request.getParameter("m");


String point =" <span style='color:red' >*</span>";
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

</style>

<script>

function fn_change() {
	var y=document.frm.year.value;
	var m=document.frm.month.value;
	var lastDate =new Date(y,m,0).getDate();
	// 7월의 마지막 : var lastDate =new Date(2020,7,0).getDate();
	// --> var lastDate =new Date(2020,6,31).getDate();
	
	var options="";
		for(var i=1; i<=lastDate; i++){
			options +=" <option value='"+i+"'>"+i+"</option>"
		}
		
		document.getElementById('day').innerHTML= options;
	
}



function fn_submit() {
	var f = document.frm ;
	
	
	if( f.idcheck.value != "Y" ) {
		alert("중복체크를 해주세요.");
		return false;
	}
	
////////////////////////////////////////	
	
	if( f.userid.value ==""){

		alert(" 입력해주세요 ");
		f.userid.focus();
		return false;
	}
	
	if( f.userid.length < 4 || f.userid.length > 12 ) {

		alert(" 4~12 사이로 입력해주세요 ");
		f.userid.focus();
		return false;
	}
	
	if( f.userpw.value ==""){
		
		alert(" 입력해주세요 ");
		f.userpw.focus();
		return false;
	}
	     
	if( f.name.value ==""){
		
		alert(" 입력해주세요 ");
		f.name.focus();
		return false;
	}
	
	if( f.hp1.value =="" ||
		f.hp2.value =="" ||
		f.hp3.value =="" ){
			
			alert(" 입력해주세요 ");
			f.hp1.focus();
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

function fn_post() {
	
	var  zipcode= document.frm.zipcode.value;
	var w = window.screen.width/2 - (520/2);
	var h = window.screen.height/2 - (300/2);
	
	
	var url="postcheck.jsp";
	window.open(url, "post" , "width=520,height=300,left="+w+",top="+h   );
	
}
</script>

<body>

<header>
Header
</header>

<nav>
<div>
<%@ include file="../include/topmenu.jsp" %>
</div>
</nav>

<section>
	<aside>
	 좌 메뉴
	</aside>
	<article>

<form name="frm" method="post" action="memberWritesave.jsp">

<table class="table1" align="center">
	<caption class="caption1">
		회원가입 폼
	</caption>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>

	<tr>
		<th class="th1" ><%=point %>아이디</th>
		<td class="td2">
			<input type="text" name="userid" class="input2" autofocus placeholder="아이디입력"  onchange="document.frm.idcheck.value='N'" >
			<!-- onchange="document.frm.idcheck.value='N' 
			아이디 value 값이 변하면 중복 체크 N - -->
			
			<input type="button" value="중복 확인 " class="button2" onclick="fn_idcheck()">
		</td>
	</tr>
	<tr>
		<th class="th1"><%=point %>암호</th>
		<td class="td2"><input type="password" name="userpw"  class="input2" placeholder="암호를 입력해주세요"></td>
	</tr>
	<tr>
		<th class="th1"><%=point %> 이름</th>
		<td class="td2"><input type="text" name="name" class="input2" placeholder="이름입력" ></td>
	</tr>
	<!--
	String userid = "abc";
	String gender = "M";
	String gender = "F";
	-->
	<tr>
		<th class="th1">성별</th>
		<!-- ------<td class="td2">남 <input type="radio" name="gender" value="M">,
		    여 <input type="radio" name="gender" value="F">-- -->
		    <td class="td2">
		    <select  name="gender" >
		    <option value="M"> 남</option>
		     <option  value="F"> 여 </option>
		    
		    </select>
		</td>
	</tr>
	
	<tr>
		<th class="th1">생년월일</th>
		<td class="td2">
			<select name="year" >
			<%
			//////////////////////생년월일 반복문 처리;
			Calendar cal = Calendar.getInstance();

			
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int date = cal.get(Calendar.DATE);
			
			int year_start = year - 80;
			int year_end = year -1;
			int year_set = year-20; // 20살로 맞추기 위해
			
			int month_set = 1;
			
			int lastday = 31;
			
			/*if( y!= null && m!=null ){
				
				cal.set(Integer.parseInt(y), Integer.parseInt(m)-1,1);
				
				lastday = cal.getActualMaximum(Calendar.DATE);
				
				year_set = Integer.parseInt(y);
				month_set = Integer.parseInt(m);
				
			} ;*/
			
			
			for( int i= year_start; i<=year_end; i++){
			%>	
			
			
			<option value="<%=i %>" 
				<% if ( i== (year_set)){out.print("selected");} %>
			> <%=i %></option>	
			
			<%
			}
			
			%>
			</select>
			<select name="month" onchange="fn_change() " >
			
			<%
			for( int i=1; i<=12; i++){
			%>	
			
			
			<option value="<%=i %>"<%if(i == month_set ){ out.print("selected"); } %>  > <%=i %></option>	
			
			<%
			}
			
			%>
				
			</select>
			<select name="day" id="day">
			
			<%
			for( int i=1; i<=31; i++){
			%>	
			
			
			<option value="<%=i %>"  ><%=i %></option>	
			
			<%
			}
			
			%>
			</select>
		</td>
	</tr>
	<tr>
		<th class="th1">휴대전화</th>
		<td class="td2">
		
		<select name="hp1">
			<option value="010"> 010</option>
			<option  value="011"  >011</option>
		</select>
		
		<input type="text" name="hp2" class="input1" style="width:48px;" maxlength="4">
		<input type="text" name="hp3" class="input1" style="width:48px;" maxlength="4">
		</td>
	</tr>
	<tr>
		<th class="th1">주소</th>
		<td class="td2">
		<input type="text" name="zipcode" class="input1" style="width:48px;" maxlength="6">
		<button type="button" onclick="fn_post()" >우편번호 </button>
		<input type="text" name="addr1" class="input1">
		<input type="text" name="addr2" class="input1">
		</td>
	</tr>
	<tr>
		<th class="th1">취미</th>
		<td class="td2">
			<input type="checkbox" name="hh" value="바둑">바둑,
			<input type="checkbox" name="hh" value="야구">야구,
			<input type="checkbox" name="hh" value="축구">축구
		</td>
	</tr>
	<tr>
		<th class="th1">이메일</th>
		<td class="td2"><input type="email" name="email" class="input2"></td>
	</tr>

	<tr>
		<th class="th1">홈페이지</th>
		<td class="td2"><input type="url" name="homepage" class="input2"></td>
	</tr>

	<tr>
		<th class="th1" colspan="2">
			<button type="submit" value="저장" class="button1" onclick="fn_submit(); return false;" >
			등록</button>
			<button type="reset" value="재설정" class="button1">
			취소</button>
		</th>
	</tr>
</table>

</form>


	</article>
</section>

<footer>
회사소개
</footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.ResultSet"%>   
 <!-- ---디비 연결----- -->
 
 <%@ include file ="../include/dbcon.jsp" %>
 
 
<!-- ---파라미터값 받기----- -->
 <%  
 String userid= request.getParameter("userid");
 String userpw= request.getParameter("userpw");
 String name= request.getParameter("name");
 String gender= request.getParameter("gender");

 String year= request.getParameter("year");
 String month= request.getParameter("month");
 String day= request.getParameter("day");
 
 String hp1= request.getParameter("hp1");
 String hp2= request.getParameter("hp2");
 String hp3= request.getParameter("hp3");
 String zipcode  = request.getParameter("zipcode");
 String addr1= request.getParameter("addr1");
 String addr2= request.getParameter("addr2");
 String email= request.getParameter("email");
 String homepage= request.getParameter("homepage");
 String[] hobby= request.getParameterValues("hobby");
 
%>  
<!-- --널값 ---- -->
<%
if( userid == null|| 
	userpw == null||
 	name  == null||
 	gender == null ){
  %>	
	<script>
	alert(" 잘못된 경로 ");
	history.back();
	</script>
 	<% 
 	return;
 	}
%>

<!-- --유효성 검사 ---- -->

<%
boolean ret = userid.matches("^[a-zA-Z0-9]{4,12}$");// ^ 시작 $ 끝
	
	if( ret == false){
	 	%>	
			<script>
			alert(" 아이디를 다시 확인해주세요. ");
			history.back();
			</script>
		 	<% 
		 	return;
		 	}

boolean ret2 = name.matches("^[가-힣a-zA-Z]+");// ^ 시작 $ 끝

	if( ret2 == false){
	 	%>	
			<script>
			alert(" 이름을 다시 입력해주세요  (한글과 영문만 가능합니다.) ");
			history.back();
			</script>
		 	<% 
		 	return;
		 	}


			%>
			
<% 
////// 핸드폰 번호 ;
boolean ret3 = hp2.matches("[0-9]{3,4}");
boolean ret4 = hp3.matches("[0-9]{3,4}");
if( ret3 == false || ret4 == false ) {
%>
		<script>
		alert("핸드폰번호는 숫자만 가능합니다.");
		history.back();
		</script>
<%
		return;
}


String birth = year+"-"+month+"-"+day;
String phone = hp1+"-"+hp2+"-"+hp3;



///// 취미 
String hobby_str = "";
//축구,야구,바둑
if( hobby != null ) {
	//  hobby[0]~[3]
	for(int i=0; i<hobby.length; i++) {
		hobby_str += hobby[i];
		if(i < (hobby.length-1)) hobby_str += ",";
	}
}
%>

<%
///아디 중복 체크;
String sql1 = "SELECT COUNT(*) cnt FROM member_info WHERE userid='"+userid+"' ";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int cnt = rs1.getInt("cnt");
if( cnt > 0 ) { 
	%>
	<script>
	alert("이미 사용중인 아이디입니다.");
	history.back();
	</script>
<%
	return;
}



String sql=" insert into member_info( userid, userpw, name, gender, birth, phone , zipcode, addr1, addr2, hobby, email, homepage , rdate ) "
			+" values ('"+userid+"' ,'"+userpw+"' ,'"+name+"' ,'"+gender+"', '"+birth+"', '"+phone +"','"+zipcode +"','"+addr1 +"','"+addr2+"' ,'"+email+"' ,'"+hobby_str+"' , '"+homepage+"',  sysdate )" ;
			
			


int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
		<script>
		alert("저장되었습니다.");
		location="loginWrite.jsp";
		</script>
<%
}
%>		
		
		
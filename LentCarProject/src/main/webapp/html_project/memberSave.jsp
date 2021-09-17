<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>


<%

String id = request.getParameter("userid");
String name = request.getParameter("username");
String pass = request.getParameter("userpass");
String nickname = request.getParameter("nickname");
String email =request.getParameter("email");
String tel= request.getParameter("tel");
String phone= request.getParameter("phone");
/////



if(   id == null || pass == null 
    || id.trim().equals("") || pass.trim().equals("") ) {

%>
		<script>
		alert("잘못된 접근입니다.");
		location="member.jsp";
		</script>
<%
	return;
}




%>



<%
String sql = " INSERT INTO lentcarmember_tbl(unq,userid,username,userpass,nickname,email,tel,phone) "
			+ " VALUES (lentcarmember_seq.NEXTVAL,'"+id+"' , '"+name+"' ,'"+pass+"','"+nickname+"','"+email+"','"+tel+"', '"+phone+"' ) ";

int result = stmt.executeUpdate(sql);

if ( result == 1 ) {
%>
   <script>
   alert("저장완료");
   location='main.jsp';
   </script>
<%   
} else {
%>
   <script>
   alert("저장실패");
   history.back();      //이전화면으로 이동
   </script>
<%
}
%>
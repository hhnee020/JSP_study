<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file ="../include/dbcon.jsp" %>




<%

String user_id = (String)session.getAttribute("USER_Id");
if( user_id == null || user_id.equals("") ){

	 %>
		<script>
		
		opner.location="/";
		self.close();
		</script>
<%
return;	
}

%>

<%

String pass1 = request.getParameter("pass1");
String pass2 = request.getParameter("pass2");
String pass3 = request.getParameter("pass3");

%>

<%
if( pass1 == null || pass2 == null || pass3 == null ){
 %>
	<script>
	

		

	</script>

<%
	return;
}

///// 신규 암호 
pass2 =  pass2.replace(" ","");
if( pass2.length() <4  ||   pass2.length() >12 ){
	
	 %>
		<script>
		
		
		</script>

	<%
		return;
	
}

///// 기존 암호 확인
String sql=" select count(*) cnt  from member_info"
			+"  where userid='"+user_id+"' and userpw='"+pass1+"'   ";

	ResultSet rs = stmt.executeQuery(sql);	

rs.next();
int cnt =rs.getInt("cnt");
if( cnt == 0 ){
		
%>
			<script>
			alert("암호를 다시확인해주세요.");
			history.back();
			
			</script>

		<%
	}

%>

<%
	
	///// 암호 변경  처리
String sql2 = " update member_info set userpw='"+pass2+"'  where userid='"+pass1+"' " ;
	
	ResultSet rs2 = stmt.executeQuery(sql);

 %>

<script>

alert("암호가 변경되었습니다. \n다시 로그인 시 적용됩니다.");
self.close();

</script>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
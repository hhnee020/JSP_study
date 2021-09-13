<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="../include/dbcon.jsp" %>

<%
String unq = request.getParameter("n");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name   = request.getParameter("name");
String content 	 = request.getParameter("content");

if(    unq == null || unq.trim().equals("") 
    || title == null || pass == null 
    || title.trim().equals("") || pass.trim().equals("") ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location="boardList.jsp";
		</script>
<%
	return;
}

int cont_len = 0;
if( content != null ) {
	cont_len = content.length();
}

if( cont_len >= 4000 ) {
%>	
		<script>
		alert("내용의 양이 너무 많습니다.\n4000자까지만 가능합니다.");
		history.back();
		</script>
<%
	return;
}

/*
 * 암호확인 S  */
String sql2 = "select count(*) cnt from nboard "
			+ "	where unq='"+unq+"' and pass='"+pass+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();

int cnt = rs2.getInt("cnt");
if( cnt == 0 ) {
%>
		<script>
		alert("암호를 확인해주세용~");
		history.back();
		</script>
<%	
		return;
}
/*
 * 암호확인 E  */


String sql  = "  UPDATE nboard SET  title='"+title+"'," 
			+ "					 name='"+name+"'," 
			+ "					 content='"+content+"',"
			+ "					 udate=sysdate"
			+ "  WHERE unq = '"+unq+"' ";
int result = stmt.executeUpdate(sql);

if ( result == 1 ) {
%>
	   <script>
	   alert("수정완료");
	   location='boardList.jsp';
	   </script>
<%   
} else {
%>
	   <script>
	   alert("수정실패");
	   history.back();      //이전화면으로 이동
	   </script>
<%
}
%>


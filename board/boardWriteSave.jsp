<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="../include/dbcon.jsp" %>

<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name   = request.getParameter("name");
String content 	 = request.getParameter("content");

if(    title == null || pass == null 
    || title.trim().equals("") || pass.trim().equals("") ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location="boardList.jsp";
		</script>
<%
	return;
}

int con_len = 0;
if( content != null ){
	
	con_len =  content.length();
	
}
if( con_len >= 4000){
%>

<script>
alert("4000자 이내로 작성해 주세요  ");
history.back();
</script>

<% 
return;


}

String sql = "INSERT INTO nboard(unq,title,pass,name,content,rdate)"
			+ " VALUES(nboard_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"',sysdate)";

int result = stmt.executeUpdate(sql);

if ( result == 1 ) {
%>
   <script>
   alert("저장완료");
   location='boardList.jsp';
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


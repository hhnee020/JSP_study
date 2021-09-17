<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>



<%

String title= request.getParameter("title");
String name = request.getParameter("name");
String content = request.getParameter("content");

/////



if(   title == null || name == null 
    || title.trim().equals("") || name.trim().equals("") ) {

%>
		<script>
		alert("잘못된 접근입니다.");
		location="main.jsp";
		</script>
<%
	return;
}

int con_len = 0;
if( content != null ){ // 널이 아닌 경우에만 ;
	
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


String sql= "INSERT INTO notice_tbl(unq,title,name,content)"
		
		+ " VALUES(notice_seq.nextval,'"+title+"','"+name+"','"+content+"')";




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



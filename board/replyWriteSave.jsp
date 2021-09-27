
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@page import="java.sql.ResultSet"%>   
<%@ include file="../include/dbcon.jsp" %>

<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name   = request.getParameter("name");
String content 	 = request.getParameter("content");
String gid 	 = request.getParameter("gid");
String thread 	 = request.getParameter("thread");
///// 제목 , 암호 , 이름 내용 넘겨옴 ;


// 유효성 검사 ;
if(    title == null || pass == null 
    || title.trim().equals("") || pass.trim().equals("") ) {
// 제목과 암호가 널이거나 공백이면 
%>
		<script>
		alert("잘못된 접근입니다.");
		location="reBoardList.jsp";
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


/// thread 값
String  max_thread="";
String my_thread= "";


String sql1="select max(thread) max_thread from reboard where gid='"+gid+"' and thread like '"+thread+"_'";
//select max(thread) from reboard where gid=3 and thread like 'a_'; 
//언더바는 문자 한개 무조건
ResultSet rs1 = stmt.executeQuery(sql1);

if( rs1.next() ){
	
	 max_thread = rs1.getString("max_thread");
}

//최초의 글; 데이터가 없는 경우 
if( max_thread == null ){
	my_thread = thread +"a";
}else{// 기존의 글 존재; -- ab,abc 
	
	//max_thread : "ab (c)"  -  "ab (d)";	
	char lastThread= max_thread.charAt(max_thread.length()-1);

	lastThread++;
	
	my_thread = thread + lastThread ;
}



//sql
String sql2 = "INSERT INTO reboard(unq,title,pass,name,content,rdate,gid,thread)"
			+ " VALUES(reboard_seq.nextval , '"+title+"','"+pass+"','"+name+"','"+content+"', sysdate ,'"+gid+"', '"+my_thread+"')";

int result = stmt.executeUpdate(sql2);

if ( result == 1 ) {
%>
   <script>
   alert("댓글저장완료");
   location='reBoardList.jsp';  
   </script>
<%   
} else {
%>
   <script>
   alert("댓글저장완료");
   history.back();      //이전화면으로 이동
   </script>
<%
}
%>


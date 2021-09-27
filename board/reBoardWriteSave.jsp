
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@page import="java.sql.ResultSet"%>   
<%@ include file="../include/dbcon.jsp" %>

<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name   = request.getParameter("name");
String content 	 = request.getParameter("content");
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


/// gid 값
String  max_gid="";
int my_gid= 0;


String sql1=" select max(gid) max_gid from reboard";
ResultSet rs1 = stmt.executeQuery(sql1);

if( rs1.next() ){
	 max_gid = rs1.getString("max_gid");
}

//최초의 글;
if( max_gid == null ){
	my_gid = 1;
}else{// 기존의 글 존재;
	
	my_gid = Integer.parseInt(max_gid) + 1;
}



//sql
String sql2 = "INSERT INTO reboard(unq,title,pass,name,content,rdate,gid,thread)"
			+ " VALUES(reboard_seq.nextval , '"+title+"','"+pass+"','"+name+"','"+content+"',sysdate,'"+my_gid+"','a')";



int result = stmt.executeUpdate(sql2);

if ( result == 1 ) {
%>
   <script>
   alert("저장완료");
   location='reBoardList.jsp';  
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


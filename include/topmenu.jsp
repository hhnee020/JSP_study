<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
<ul>
	<li><a href="#">홈</a></li>
	
	<li><a href="../board/boardList.jsp?menu=b">일반게시판</a></li>
	<li><a href="../board/reBoardList.jsp">답변게시판</a></li>
	<li><a href="../empJsp/empList.jsp?menu=e">사원관리</a></li>
	<li><a href="#">설문조사</a></li>
	
	
	<%
	if( session.getAttribute("USER_ID") == null ) {
	%>	
		<li><a href="../member/memberModify.jsp?menu=m">회원가입</a></li>
		<li><a href="../member/loginWrite.jsp">로그인</a></li>
	<%
	} else {
	%>
		<li><a href="../member/memberModify.jsp?menu=m">정보수정</a></li>
		<li><a href="../member/logout.jsp">로그아웃</a></li>
	<%
	}
	%>
</ul>
</div>
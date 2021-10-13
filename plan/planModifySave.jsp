<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/loginCertify.jsp" %>
  
<%
String appdate = request.getParameter("appdate");
String title = request.getParameter("title");
String content = request.getParameter("content");
String gubun = request.getParameter("gubun");

if( appdate == null || appdate.trim().equals("") ) {
%>
		<script>
		alert("잘못된 경로로의 접근");
		self.close();
		</script>
<%
		return;
}

String sql = "";
if( gubun.equals("IN") ) {
	
	sql = " INSERT into schuedule (uno,userid,appdate,title,content) "
		       + "           values(MEMBEREXIT_SEQ.nextval,"
		       + "								'"+LOGIN_USERID+"',"
		       + "								'"+appdate+"',"
		       + "								'"+title+"',"
		       + "								'"+content+"'    ) ";
	
} else if( gubun.equals("UP") ) {

	sql = "  update set s.title||'"+title+"',s.content||'"+content+"' "
			+"where userid='"+LOGIN_USERID+"' and appdate ='"+appdate+"'";
			}

int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
		<script>
		alert("(변경)저장 처리 완료");
		self.close();
		opener.location=reload();
		</script>
<%
}
%>

    

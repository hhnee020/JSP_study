<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/dbcon.jsp" %>
    
    <%
	String grade = request.getParameter("grade");
	String lowsal = request.getParameter("lowsal");
	String hisal = request.getParameter("hisal");
	%>
	
	<%
	String sql = "INSERT INTO  salgrade (grade, lowsal, hisal) "
         +"VALUES('"+grade+"','"+lowsal+"','"+hisal+"')";

int result = stmt.executeUpdate(sql);
if ( result == 1 ) {
%>
   <script>
   alert("저장완료");
   location='SalList.jsp'; // 이동 ;
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
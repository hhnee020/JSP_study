<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 파라메터 값 받기 -->
<%
String grade = request.getParameter("grade");
String lowsal = request.getParameter("lowsal");
String hisal = request.getParameter("hisal");
%>

<!-- 저장SQL 작성 및 적용 -->
<%
String sql  = " update salgrade set lowsal='"+lowsal+"', hisal='"+hisal+"'  "
            + "    where grade='"+grade+"' ";
int result = stmt.executeUpdate(sql);
if ( result == 1 ) {
%>
   <script>
   alert("수정완료");
   location='SalList.jsp';
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


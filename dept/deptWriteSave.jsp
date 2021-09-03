<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="../include/dbcon.jsp" %>

<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");
%>

<%
String sql = "INSERT INTO dept(deptno, dname, loc) "
         +"VALUES('"+deptno+"','"+dname+"','"+loc+"')";

int result = stmt.executeUpdate(sql);
if ( result == 1 ) {
%>
   <script>
   alert("저장완료");
   location='deptList.jsp';
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="../include/dbcon.jsp" %>

<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String sal   = request.getParameter("sal");
String job 	 = request.getParameter("job");
String yy   = request.getParameter("yy");
String mm   = request.getParameter("mm");
String dd   = request.getParameter("dd");
String deptno = request.getParameter("deptno");

if( empno == null || ename == null ) {
	out.print("<script> alert('잘못된 경로로의 접근!'); location='empList.jsp'; </script> ");
	return;
}
empno = empno.trim();
ename = ename.trim();

if( empno.equals("") || ename.equals("") ) {
	out.print("<script> alert('다시 입력해주세요.'); history.back(); </script> ");
	return;
}

String pattern = "^[가-힣a-zA-Z]{1,30}";
if( !ename.matches(pattern) ) {
	out.print("<script> alert('이름은 한글 또는 영문만 가능'); history.back(); </script> ");
	return;
}

pattern = "^[0-9]{3,10}";
if( sal != null &&  !sal.matches(pattern) ) {
	out.print("<script> alert('급여를 다시 입력해주세요.'); history.back(); </script> ");
	return;
}

String hiredate = ""; 
if(  yy != null && mm != null && dd != null &&
    !yy.equals("") && !mm.equals("") && !dd.equals("") ) {
	hiredate = yy + "-" + mm + "-" + dd;
}

%>

<%
String sql =  " update emp set "
			+ "					ename='"+ename+"',"
			+ "					job='"+job+"',"
			+ "					sal='"+sal+"',"
			+ "					hiredate='"+hiredate+"',"
			+ "					deptno='"+deptno+"' "
		    + "   where empno='"+empno+"' ";

int result = stmt.executeUpdate(sql);

if ( result == 1 ) {
%>
   <script>
   alert("수정완료");
   location='empList.jsp';
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
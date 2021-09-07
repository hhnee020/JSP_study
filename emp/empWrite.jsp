<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon.jsp" %>

<%
String sql = "SELECT ifnull(max(empno),1000)+ 1 empno  from  emp ";
ResultSet rs = stmt.executeQuery(sql);
int empno = 0;
if( rs.next() ) {
	empno = rs.getInt("empno");
}

Calendar cal = Calendar.getInstance();
int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH)+1;
int dd = cal.get(Calendar.DATE);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
body {
   font-size:12px;
   font-family:'맑은 고딕';
}
table {
   width:400px;
   border:1px solid #ccc;
   border-collapse:collapse;
}
th, td {
   border:1px solid #ccc;
   padding:5px;
}
</style>

<script>
function fn_submit() {
	if(document.frm.empno.value == "") {
		alert("사원번호를 입력해주세요!");
		document.frm.empno.focus();
		return false;
	}
	if(document.frm.ename.value == "") {
		alert("사원이름을 입력해주세요!");
		document.frm.ename.focus();
		return false;
	}
	document.frm.sumbit();
}
</script>

<body>
<form name="frm" method="post" action="empWriteSave.jsp">
<table>
   <tr>
      <th>사원번호</th> <!-- 자동   -->  <!-- 1001,1002~    -->
      <td><input type="text" name="empno" value="<%=empno %>"></td>
   </tr>
   <tr>
      <th>사원이름</th> <!-- 정규표현식 -->
      <td><input type="text" name="ename"></td>
   </tr>
   <tr>
      <th>급여</th> <!-- 숫자여부 -->
      <td><input type="text" name="sal"></td>
   </tr>
   
<% 
String sql_dept = "select deptno,dname from dept order by dname ";
ResultSet rs_dept = stmt.executeQuery(sql_dept);
%>
   <tr>
      <th>부서</th> <!-- 화면에서 펼침목록으로 출력 -->
      <td>
      	<select name="deptno">
      		<option value="">-선택-</option>
      		<%
      		while( rs_dept.next() ) {
      			int deptno = rs_dept.getInt("deptno");
      			String dname  = rs_dept.getString("dname");
      		%>
      			<option value="<%=deptno %>"><%=dname %></option>
      		<%
      		}
      		%>
      	</select>
      </td>
   </tr>

   <tr>
      <th>업무</th> <!-- 화면에서 펼침목록으로 출력 -->
      <td> <input type="text" name="job"> </td>
   </tr>
   <tr>
      <th>입사일</th> <!-- 화면에서 펼침목록으로 출력 <년><월><일>   -->
      <td>
      		<select name="yy">
      			<option value="">- 년 -</option>
      			<%
      			for(int i=2000; i<=yy; i++) {
      			%>
      				<option value="<%=i %>" <%if(i==yy){out.print("selected");} %> ><%=i %></option>
      			<%
      			}
      			%>
      		</select>
      		<select name="mm">
      			<option value="">- 월 -</option>
      			<%
      			for(int i=1; i<=12; i++) {
      			%>
      				<option value="<%=i %>" <%if(i==mm){out.print("selected");} %> ><%=i %></option>
      			<%
      			}
      			%>
      		</select>
      		<select name="dd">
      			<option value="">- 일 -</option>
      			<%
      			for(int i=1; i<=31; i++) {
      			%>
      				<option value="<%=i %>" <%if(i==dd){out.print("selected");} %> ><%=i %></option>
      			<%
      			}
      			%>
      		</select>
      
      </td>
   </tr>
   <tr>
      <th colspan="2">
      <button type="submit" onclick="fn_submit();return false;">등록</button>
      <button type="reset">취소</button>
      </th>
   </tr>
</table>

<div style="width:400px; text-align:right; margin-top:10px;">
	<button type="button" onclick="location='empList.jsp'">목록으로</button>
</div>
</form>
</body>
</html>

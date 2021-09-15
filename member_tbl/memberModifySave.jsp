<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../include/dbcon.jsp" %>

<%

String no = request.getParameter("no");
String id = request.getParameter("id");
String name = request.getParameter("name");
String grade = request.getParameter("grade");
String[] hobby = request.getParameterValues("hobby");
String date = request.getParameter("date");
%>

<%
if(no == null || id == null || name == null ||
   no.equals("") || id.equals("") || name.equals("") ) {
	
%>
	<script>
	alert("잘못된 경로로 들어왔습니다");
	location="index.jsp";
	</script>
<%
	return; // jsp종료
}

// hobby[0] = "독서"; hobby[1] = "운동"; hobby[2] = "영화";
// hobby[0] = "운동"; hobby[1] = "영화";
// hobby[0] = "영화";
// hobby = null;


String str = "";
/*StringTokenizer tokenizer =new StringTokenizer("hobby",",");

while (tokenizer.hasMoreTokens()){
	
		out.print(tokenizer.nextToken());
	
	}*/


if( hobby != null ) {
	for(int i=0; i<hobby.length; i++) {
		str += hobby[i]+",";
	}
	// str = "독서,운동,영화,";  0 ~ 8 
	// str = "독서,운동,";      0 ~ 5
	str = str.substring(0,str.length()-1);
}

String sql =" UPDATE member_tbl SET "
	       + " 		member_id='"+id+"',"
	       + " 		member_name='"+name+"',"
	       + " 		member_grade='"+grade+"',"
	       + "     	MEMBER__HOBBY='"+str+"',"
	       + "     	member_date='"+date+"' "  
	       + "  WHERE member_no='"+no+"' ";
	   
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
	<script>
	alert("수정완료");
	location="index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("수정실패");
	history.back();
	</script>
<%	
}
%>

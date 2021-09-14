<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>

<%
//String[] abc = {"",""};
String member_no = request.getParameter("member_no");
String member_id = request.getParameter("member_id");
String member_name = request.getParameter("member_name");
String member_grade = request.getParameter("member_grade");
String member_date = request.getParameter("member_date");
String[] MEMBER__HOBBY  = request.getParameterValues("MEMBER__HOBBY");
%>

<%
if(member_no == null || member_id == null || member_name == null ||
member_no.equals("") || member_id.equals("") || member_name.equals("") ) {
	
%>
	<script>
	alert("잘못된 경로로 들어왔습니다");
	location="index.jsp";
	</script>
<%
	return; // jsp종료
}

if(member_grade == null) {
	member_grade = "";
}

// hobby[0] = "독서"; hobby[1] = "운동"; hobby[2] = "영화";
// hobby[0] = "운동"; hobby[1] = "영화";
// hobby[0] = "영화";
// hobby = null;

String str = "";
if( MEMBER__HOBBY!= null ) {
	for(int i=0; i< MEMBER__HOBBY.length; i++) {
		str +=  MEMBER__HOBBY [i]+",";
	}
	
	// str = "독서,운동,영화,";//  0 ~ 8 
	// str = "독서,운동,";      0 ~ 5
	str = str.substring(0,str.length()-1);
	//str = str.substring(0,str.lastIndexOf(","));
}

String sql ="INSERT INTO member_tbl";
	   sql+= "(member_no,member_id,member_name,member_grade,MEMBER__HOBBY,member_date)";
	   sql+= "Values('"+member_no+"','"+member_id+"','"+member_name+"','"+member_grade+"','"+str+"','"+member_date+"')";
	   
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
	<script>
	alert("저장완료");
	location="index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("저장실패");
	history.back();
	</script>
<%	
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="adminCertify.jsp" %>

<%
String title = request.getParameter("title");
String[] array = request.getParameterValues("item");
String sdate =request.getParameter("sdate");
String edate = request.getParameter("edate");
String use = request.getParameter("use");



if( use == null ) use = "Y";
// pollmain 저장
// code --> 1001
String sql1 = "INSERT INTO pollmain(CODE,TITLE,SDATE,EDATE,USE,RDATE) "
			+ " VALUES(pollmain_seq.nextval,'"+title+"','"+sdate+"','"+edate+"','"+use+"',sysdate)";

int result_cnt1 = stmt.executeUpdate(sql1);


// pollsub  저장
// code --> 100101 / 100102 / 100103  ,,  100201/100202
String sql2 = "select pollmain_seq.currval seq  from dual";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int seq_main = rs2.getInt("seq"); // 1001


//메인 코드값
// 아이템 입력값

// array[0] = "qwqw";    array[1] = "aaaa";
for(int i=0; i<array.length; i++  ) {  // 0 ~ 9

	if( !array[i].equals("") ) {
		String sql3 = "select count(*) cnt from pollsub where code like '"+seq_main+"%'";
		ResultSet rs3 = stmt.executeQuery(sql3);
		rs3.next();
		
		
		
		int my_cnt = rs3.getInt("cnt") + 1;  // 1
		// 100101
		
		
		String sub_code = ""+seq_main + ((my_cnt==10)?my_cnt:"0"+my_cnt);
		
		
		String sql4 = "INSERT INTO pollsub(code,item) "
				    + " VALUES('"+sub_code+"','"+array[i]+"')";
		int result_cnt2 = stmt.executeUpdate(sql4);
		
	}
}
String str = "";
if(result_cnt1 == 1) str = "ok";
%>
{"result":"<%=str %>","title":"<%=title %>" }













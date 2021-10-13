<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/loginCertify.jsp" %>

<%
String title = request.getParameter("title");
String sdate = request.getParameter("sdate");
String edate = request.getParameter("edate");
String content = request.getParameter("content");

if( title == null || sdate == null ||  edate == null ) {
%>
		<script>
		alert("다시 시도해주세요.");
		self.close();
		</script>
<%
		return;
}

Calendar c1 = Calendar.getInstance();

//  10/01/2021
String[] ar1 = sdate.split("/");
int yy = Integer.parseInt(ar1[2]);
int mm = Integer.parseInt(ar1[0]);
int dd = Integer.parseInt(ar1[1]);
c1.set(yy,mm-1,dd);

long L1 = c1.getTimeInMillis()/1000; //유닉스 시간;

String[] ar2 = edate.split("/");
yy = Integer.parseInt(ar2[2]);
mm = Integer.parseInt(ar2[0]);
dd = Integer.parseInt(ar2[1]);
c1.set(yy,mm-1,dd);
long L2 = c1.getTimeInMillis()/1000;

if( L1 > L2) {
%>
		<script>
		alert("적용기간을 다시 확인해주세요.");
		history.go(-1);
		</script>
<%
		return;
}

int min = (int)(L2 - L1)/86400; 
//out.print( "날짜 차이 : " + min  );

int cnt = 0;
long time = L1; 

SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // 유닉스 시간

for(int i=0; i<=min; i++) {
	 
	
	// select -> 존재여부 파악
	// if     -> 조건문
	//    UPDATE or INSERT          
	
	String date = df.format(time*1000);
	//String sql = " INSERT INTO schedule(uno,userid,appdate,title,content)"
	//		   + "   VALUES( MEMBEREXIT_SEQ.nextval,'"+LOGIN_USERID+"','"+date+"','"+title+"','"+content+"')";

	String sql = " merge into schedule s using dual "
			   + "        on ( s.userid='"+LOGIN_USERID+"' and appdate='"+date+"' ) "
			   + "  when matched then "
		       + "        update set s.title='"+title+"',s.content='"+content+"' "
		       + "  when not matched then "
		       + "        insert(uno,userid,appdate,title,content) "
		       + "           values(MEMBEREXIT_SEQ.nextval , "
		       + "								'"+LOGIN_USERID+"',"
		       + "								'"+date+"',"
		       + "								'"+title+"',"
		       + "								'"+content+"'    )";
	int result = stmt.executeUpdate(sql);
	if(result == 1) cnt++;
	time += 86400;	
}
if( cnt > 0 ) {
%>
		<script>
		alert("<%=cnt %>건이 저장되었습니다.");
		self.close();
		</script>
<%
}
%>










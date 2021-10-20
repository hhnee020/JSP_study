<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon.jsp" %>    
<%
String code = request.getParameter("code");


// pollmain
String sql1 = "SELECT title , ( select sum(vote) from pollsub where code like '"+code+"%' )  total FROM pollmain WHERE code='"+code+"' ";
ResultSet rs1 = stmt.executeQuery(sql1);

String title = "";
int total =0;

if(rs1.next()) {
	title = rs1.getString("title");
	total= rs1.getInt("total");
} else {
	out.print(" <script> self.close(); </script> ");
	return;
}

// pollsub
String sql2 = "	SELECT code,item, vote  FROM pollsub "
			+ "		WHERE code like '"+code+"%' ";
ResultSet rs2 = stmt.executeQuery(sql2);

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<script>

$(function(){
	
	$("#btn_save").click(function(){

		var chk_value = $("input[name='chk']:checked").val();
		if( chk_value == undefined ) {
			alert("항목을 선택해주세요.");
			return false;
		}	
		$.ajax({
			type : "post",
			data : "chk_value="+chk_value,
			url  : "pollEnterSub.jsp",
			
			datatype : "json",
			success : function(obj) {
				var data = JSON.parse(obj);
				if( data.result == "ok" ) {
					alert("투표완료");
					self.close();
				} else {
					alert("투표에 실패했습니다.");
					self.close();
				}
			},
			error : function() {
				alert("전송실패");
			}
		});
	});
});



</script>



<style>
body {
	font-size:12px;
	color:#232323;
	font-family:'맑은 고딕';
}
table {
	width :380px;
	height:350px;
	border:1px solid #ccc;
}
.title{
	font-size:16px;
	font-weight:bold;
	padding:5px;
}
</style>

<body>
<table>
	<tr>
		<td height="60">
		<span class="title"><%=title %></span>
		<span class="">(총 <%=total %> 명 득표)</span>
		</td>
	</tr>
	<tr>
		<td valign="top">
		
		<table style="width:98%">
		<%
		while( rs2.next() ) {
			String code_sub = rs2.getString("code");
			String item = rs2.getString("item");
			int vote = rs2.getInt("vote"); //개별 득표수 
			int per= (int)Math.round((100*(double)vote)/total);
			
		%>
		<tr>
			<td width="30%"><%=item %>(<%=per %>%)</td>
			<td width="70%">
				<div style="width:50%;height:10px; background:red;"></div>
			
			</td>
			
		</tr>	
		<%
		}
		%>
		
		</table>
		</td>
	</tr>
	<tr>
		<th>
			<button type="button" id="btn_save">투표하기</button>
		</th>
	</tr>
</table>

</body>
</html>





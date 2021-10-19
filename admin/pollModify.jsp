<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="adminCertify.jsp" %>

<%
String code = request.getParameter("code");

if( code == null ) {
	response.sendRedirect("./");
	return;
}

String sql1  = " SELECT title,sdate,edate,use FROM pollmain "
			 + " 	WHERE code='"+code+"' ";
Statement stmt1 = conn.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

String sql2  = " SELECT code,item FROM pollsub "
			 + "   WHERE code like '"+code+"%' ";
Statement stmt2 = conn.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);

String title = "";
String sdate = "";
String edate = "";
String use = "";

if( rs1.next() ) {
	title = rs1.getString("title");
	sdate = rs1.getString("sdate");
	edate = rs1.getString("edate");
	use = rs1.getString("use");
} else {
	response.sendRedirect("./");
	return;
}
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>설문등록화면</title>
	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../script/jquery-1.12.4.js"></script>
  	<script src="../script/jquery-ui.js"></script>
</head>

<style>
body {
	font-size:12px;
	font-family:'맑은 고딕';
}
.div_top {
	width:100%; 
	text-align:center;
	background:#cccccc;
	padding-top:10px;
	padding-bottom:10px;
}
.div1 {
	width:1200px;
}
.div2 {
	float:left;width:200px;height:500px;
	background:yellow;
}
.div3 {
	float:left;width:1000px;height:500px; 
	background:#fff;
}

table {
	width:600px;
	border-collapse:collapse;
}
th {
	border:1px solid #ccc;
	padding:5px;
} 
td {
	border:1px solid #ccc;
	padding:3px;
	text-align:center;
}
</style>

<script>
$(function() {
    $("#sdate").datepicker({
      changeMonth: true,
      changeYear: true
    });
    $("#edate").datepicker({
        changeMonth: true,
        changeYear: true
    });
    
    $("#btn_submit").click(function(){
    	
    	var title = $("#title").val();
    	title = $.trim(title);
    	$("#title").val(title);
    	
    	if( title == "" ) {
    		alert("설문제목을 입력해주세요.");
    		$("#title").focus();
    		return false;
    	}
    	
    	var item0 = $("input[name='item']:eq(0)").val();
    	var item1 = $("input[name='item']:eq(1)").val();
    	
    	if(item0 == "" || item1 == "") {
    		alert("설문항목을 입력해주세요. (첫,두번재는 필수)");
    		$("input[name='item']:eq(0)").focus();
    		return false;
    	}
    	
    	if( $("#sdate").val() == ""  || $("#edate").val() == "" ) {
    		alert("설문기간을 입력해주세요.");
    		$("#sdate").focus();
    		return false;
    	}
    	
    	var dataform = $("#frm").serialize();
    	$.ajax({  // 비동기 전송
    		type : "POST",
    		data : dataform,
    		url  : "pollWriteSave.jsp",
    		
    		datatype : "json", // text
    		success : function(data) {
    			var datas = JSON.parse(data);
    			if( datas.result == "ok" ) {
    				alert("저장완료");
    			} else {
    				alert("저장실패");
    			}
    		},
    		error : function() {
    			alert("전송실패");
    		}
    	});
    });  
});
</script>

<body>

<div class="div1">

	<div class="div_top">
		<h2>관리자모드</h2>
	</div>
	
	<!-- left menu S -->
	<div class="div2">
	
	<%@ include file="include/left_menu.jsp" %>

	</div>
	<!-- left menu E -->
	
	<div class="div3">
	
		<div style="position:relative; left:20px; top:30px; margin-bottom:10px;">
		
		</div>

		<div style="position:relative; left:20px; top:30px;">
	
			<form name="frm" id="frm">
	
			<table style="width:600px;">
				<tr bgcolor="#cffccc">
					<th width="20%">설문제목</th>
					<td width="*">
					<textarea name="title" id="title" rows="5" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<th>설문항목</th>
					<td>
					
					<div style="width:98%;
								backgroud-color:#ccffff;
								line-height:2.2; " >
					<%
					for( int i=1; i<=10; i++ ) {
					%>
						<%if(i<10){ out.print("&nbsp;"); } %>
						<%=i %>.
						<input type="text" name="item" id="item" style="width:90%;"> 
						<br>
					<%
					}
					%>
					</div>
					
					</td>
				</tr>
				<tr>
					<th>설문기간</th>
					<td>
					<div style="margin-left:30px; width:98%; text-align:left;">
						<input type="text" name="sdate" id="sdate" style="width:100px;">
						~
						<input type="text" name="edate" id="edate" style="width:100px;">
						<br>
						<input type="checkbox" name="use" value="N"> 숨김
					</div>
					</td>
				</tr>
			</table>
			
			<div style="width:60%;text-align:center;margin-top:10px;">
				<button type="submit" id="btn_submit" onclick="return false;">저장</button>
				<button type="reset">취소</button>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>












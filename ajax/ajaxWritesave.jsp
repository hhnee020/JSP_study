<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String eng = request.getParameter("eng");
String kor = request.getParameter("kor");

String method= request.getMethod();//post , get

if(method.equals("get")){
	//return;
}

String msg = "";
if( Integer.parseInt(eng) >= 60 && Integer.parseInt(kor) >= 60 ) {
	msg = "합격" + method;
} else {
	 msg = "불합격" + method;
}

Map<String,String> map = new HashMap<String,String> ();
map.put("msg",msg);
map.put("eng",eng);
map.put("kor",kor);

JSONObject json = new JSONObject(map);

%>
<%=map %>

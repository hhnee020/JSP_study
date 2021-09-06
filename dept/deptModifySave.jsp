<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/dbcon.jsp" %>
    
    <%
    
		String deptno= request.getParameter("deptno");    
   		String dname= request.getParameter("dname"); 
   		String loc= request.getParameter("loc"); 
    %>
    
    <%
    
    String sql= " update dept set dname ='' , loc=''  where deptno='' ";
   	int reusult = stmt.executeUpdate(sql);
    
    %>
    
    <%
    
    if(reusult ==1 ){
    	%>
    	<script>
		   alert("수정 완료");
		   location='deptList.jsp'; // 이동 ;
		   </script>
    <%
    }else{
    	%>
    	<script>
		   alert("수정 완료");
		   location='deptList.jsp'; // 이동 ;
		   </script>
    <%	
    }
    %>
    
    
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%@page import="database.*" %>

<%
request.setCharacterEncoding("utf-8");
adminCheck = (String)session.getAttribute("adminCheck");
if(null==adminCheck||adminCheck.equals("")||adminCheck.endsWith("false")){
%>
<script language='javascript' type='text/javascript'>
	window.location = "../sys";
</script>

<%	
}
%> 
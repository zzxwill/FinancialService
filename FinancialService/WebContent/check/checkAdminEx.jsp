<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%
request.setCharacterEncoding("utf-8");
String loginedUserName = (String)session.getAttribute("loginedUserName");
String adminCheck = (String)session.getAttribute("adminCheck");
if(null==adminCheck||adminCheck.equals("")||adminCheck.endsWith("false")){
%>
<script language='javascript' type='text/javascript'>
	window.location = "admin/login.jsp";
</script>

<%	
}
%> 
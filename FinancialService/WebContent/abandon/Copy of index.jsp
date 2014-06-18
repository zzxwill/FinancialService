<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%@page import="database.*" %>

<%
request.setCharacterEncoding("utf-8");
String loginedUserName = (String)session.getAttribute("loginedUserName");
//String weixinID = request.getParameter("sid");
if(null==loginedUserName||loginedUserName.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		location.href = '../index.jsp';
	</script>
<%
}else{
	UserDao userCheckDao = new UserDao();
	int flag = 0;
	flag = userCheckDao.IsUserAdmin(loginedUserName);
	if(flag==1){
		session.setAttribute("adminCheck","true");
	}else{
		session.setAttribute("adminCheck","false");
	}
	session.setMaxInactiveInterval(60*30);
%>
	<input id="adminCheck" name="adminCheck" value="<%=(flag==1)?1:0 %>" type="hidden" readonly></input>
<%	
}
%> 
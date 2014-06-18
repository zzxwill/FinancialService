 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%>  
 <%@ include file="../check/index.jsp"%> 
 <%@ include file="../check/checkAdmin.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>“云海肴”在线财务核算系统</title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

  </head>
 
  <body>
 
     <center>
    <%   
    	session.removeAttribute("loginedUserName");   
   		session.removeAttribute("adminCheck"); 
    	//session 删除
    	session.invalidate();   
    	//设置无缓存   
    	response.setHeader("progma","no-cache");      
    	response.setHeader("Cache-Control","no-cache");      
    	response.setDateHeader("Expires",0);
    	response.setHeader("Refresh","0;URL=admin.jsp");
    %>
    </center>
 	<script>
		self.location = '..';
		//window.location = "../sys";
    </script>
</body>
</html>
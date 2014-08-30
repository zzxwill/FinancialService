<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
</style>

</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">
 	</div>
  	<div data-role="content">
    <p>
    <%
    String url = "index.jsp";
    String registerTel =  request.getParameter("registerTel");
    if((null==registerTel)||(registerTel.equals(""))){
    %>
	    <script language='javascript' type='text/javascript'>
				<%-- window.location = "<%=url%>"; --%>
		</script>
    <%	
    }else{
    	
    	ValidateCodeDao validateCodeDao = new ValidateCodeDao();
    	validateCodeDao.deleteValidateCode(registerTel);
    	
	    Tools tools = new Tools(); 
		String str_code = tools.GenRandomNum(); 
		
		SendMsg sendMsg = new SendMsg();
		//短信发送出现问题，正在联系客服。 暂时不验证  Will Zhou  7/14/2014
		sendMsg.run(str_code, registerTel);
		validateCodeDao.insertValidateCode(registerTel,str_code);
		
		// System.out.println("str_code:" + str_code +"\n");
	    %>
	    <input id="sendMsgStatus" name="sendMsgStatus" type="hidden"  value="OK" />
	<%} %>

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>
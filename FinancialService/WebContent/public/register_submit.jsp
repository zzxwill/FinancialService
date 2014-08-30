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
	
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;" >
					<a href="javascrpt:closeWin();"></a>
				</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">注册成功</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
	
		<%
	    request.setCharacterEncoding("UTF-8");
	 	String url = "./register.jsp";
	 	String indexUrl  = "./index.jsp";
	 	
	 	String registerTel = request.getParameter("registerTel");
		String registerPW = request.getParameter("rpawd");  
	 	if(null==registerTel||registerTel.equals("")||null==registerPW||registerPW.equals("")){
			%>
			<script language='javascript' type='text/javascript'>
				window.location = "<%=url%>";
			</script>
		<%
	 	}else{
			/* String registerName = request.getParameter("registerName");
			String registerGender = request.getParameter("registerGender");
			String registerAge = request.getParameter("registerAge");
			String registerRole = request.getParameter("registerRole"); */
			
			//String registerShiCheng = request.getParameter("registerShiCheng");
			//String registerZhengJian = request.getParameter("registerZhengJian");
			//var registerKeShi =$('input:radio[name="registerKeShi"]:checked').val();
			//String registerKeShi = request.getParameter("registerKeShi");
			//String registerZhiCheng = request.getParameter("registerZhiCheng");
			
			
			
				/* int registerGender_int = Integer.parseInt(registerGender);
				int registerAge_int = Integer.parseInt(registerAge);
				int registerRole_int = Integer.parseInt(registerRole); */
				PasswordUtil GP = new PasswordUtil();
				registerPW = GP.generatePassword(registerPW);
				
				UserDao user_dao = new UserDao();
				user_dao.insertUser(registerTel, registerPW);
				
					%>
					
					<center>
					<br>
					<p style='color:red;'>恭喜您 <strong><%=registerTel %> </strong> ，您已成功注册律邦投资金融服务平台！
					<br>
					<br>正在“会员中心”，请稍后...</p>
					<br>
					
					<script language='javascript' type='text/javascript'>
						setTimeout(" window.location = '<%=indexUrl %>' ",1500);
					</script>
					</center>
					
					<%
					
				}
			
	 	
	%>
	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>
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
						<div id="backButton" style="width: 60px;">
							<a href="javascrpt:closeWin();"></a>
						</div>
					</td>
					<td align="center" width="34%"><a style="color: white;">登&nbsp;&nbsp;陆</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>

		</div>
		<center>
			<div data-role="content">
				<form method="post" name="loginForm" id="loginForm"
					action="login_success.jsp">
					<fieldset data-role="fieldcontain">
						<link rel="stylesheet" href="../css/my.css" />
						<script>

 	function setTelNull() {  
		document.getElementById("loginName").value = "";
	}
	
    function checkLogin()
    {
       document.getElementById("tmpMsg").style.display = "none"; 
	   var loginName = document.getElementById("loginName").value;
	   var loginPW = document.getElementById("loginPW").value;
	   var message = null;
	   var msg = document.getElementById("msgLogin");
	   var flag = 1;
	   if(null==loginPW||loginPW==""){
			  flag = 0;
		 	  message = "请输入您的密码！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
	   if(null==loginName||loginName==""){
		  flag = 0;
	 	  message = "请输入您的用户名（手机号）！";
		  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }

	   if(flag==1){
		  document.getElementById("msgLogin").style.display = "none";
		  document.getElementById("loginSubmit").style.display = "none";
		  document.getElementById("loginWait").style.display = "block";
	      var loginForm = document.getElementById("loginForm");
	      loginForm.submit(); 
	   }
    }

</script>
	<%
	request.setCharacterEncoding("UTF-8");
	String url = "index.jsp";
	String loginName = request.getParameter("loginName");
	String loginPW = request.getParameter("loginPW");
	/*没有输入用户名和密码吗   Will Zhou   7/13/2014*/
	if(null==loginName||loginName.equals("")||null==loginPW||loginPW.equals("")){
	%>
						<script language='javascript' type='text/javascript'>
			window.location = "<%=url%>";
		</script>
						<%		
	}else{
		Validate validate = new Validate();
		//验证通过了    Will Zhou   7/13/2014*/
		if(validate.validate_end_user(loginName, loginPW)){
			UserDao user_dao = new UserDao();
			
			int user_id = user_dao.get_userid_by_phone(loginName);
			
			session.setAttribute("USERID", user_id);
			session.setAttribute("USER_PHONE", loginName);
			
			
			
			curPath = request.getParameter("curPath");
			
			if(null==curPath||curPath.equals("")||curPath.equals("null")){
				%>
							<div style="color:red"><big>恭喜您 <%=loginName %>，登陆成功！<br>正在前往主页，请稍后...</big></div>
				<script language='javascript' type='text/javascript'>
					setTimeout(" window.location = '../public/index.jsp' ",500);
				</script>
						<%	
			}else{
				%>
						<div style="color: red">
							<big>恭喜您 <%=loginName %>，登陆成功！<br>正在进入登陆前页面，请稍后...
							</big>
						</div>
						<script language='javascript' type='text/javascript'>
					setTimeout(" window.location = '<%=curPath %>' ",500);
						</script>
						<%
		
			}

		
	
		}else{
			curPath = request.getParameter("curPath");
			//System.out.println("curPath11:" + curPath + "\n");	
			%>
						<%-- <input id="curPath" name="curPath" type="hidden"
							value="<%=curPath %>" />
						<table width="90%" cellspacing="0" cellpadding="0" border=0px
							style="margin-top: 20px;">
							<tr>
								<td width="50px"><div id="MyInput">
										<img src="../images/user.png"
											style="width: 20px; height: 20px; margin-top: 8px" />
									</div></td>
								<td><input id="loginName" name="loginName" type="text"
									value="请输入手机号" onfocus="setTelNull()" /></td>
							</tr>
							<tr>
								<td height="20px"></td>
							</tr>

							<tr>
								<td width="50px"><div id="MyInput">
										<img src="../images/pwd.png"
											style="width: 20px; height: 20px; margin-top: 8px" />
									</div></td>
								<td><input id="loginPW" name="loginPW" type="password"
									value="" /></td>
							</tr>
						</table> --%>
						<br>

						<div id="msgLogin"></div>
						<div id="tmpMsg" style='color: red;'>您输入的用户名或密码有误！&nbsp;&nbsp;&nbsp;&nbsp;请重新登录</div>
						<script language='javascript' type='text/javascript'>
					setTimeout(" window.location = 'login.jsp' ",3000);
						</script>
						
						<!-- <div align=right style="width: 90%; color: blue;"
							onclick="setPassword();">
							<u><i>忘记密码？</i></u>
						</div>
						<div id="loginSubmit">
							<div id="SubmitButton" style="width: 90%" onclick="checkLogin()">登录</div>
						</div>
						<div id="loginWait" style="display: none; width: 90%">
							<div id="SubmitButton">正在登陆，请稍后...</div>
						</div> -->

					
						<%
		}
	}
	
	%>
					</fieldset>
				</form>
			</div>
		</center>

		<div data-role="footer" data-id="myfooter" data-position="fixed">
		</div>

	</div>

</body>
</html>
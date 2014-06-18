 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="include/package.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=sysName %></title>

  </head>

  <body >
  
<center>
<br>
<h1><p style='color:red;'><%=sysName %></p></h1>
<br>
    <form class="form-horizontal"  action="servlet/loginServlet" method="post">
    	 
	 <%@ include file="include/meta.jsp"%> 
	 <%@ include file="include/cssJSMain.jsp"%> 
	 
    <script>

	function loginSubmit() {
		document.getElementById("loginSubmit").style.display = "block";
		document.getElementById("loginWait").style.display = "none";
	}
	function loginWait() {
		document.getElementById("loginSubmit").style.display = "none";
		document.getElementById("loginWait").style.display = "block";
	}
    </script>
    
<!--    rules=none-->
	    <table frame=box align="center" width="400px" height="200px">
	    	<tr><td  align="center"></td></tr>
	    	<tr><td  align="center"><p style='color:green;'><strong>请您登录</strong></p></td></tr>
	    	<tr><td align="center"><table width="80%">
	    		<tr valign="top">
	    			<td valign="top" align="right" width="25%" style="line-height:200%">用户名:</td>
	    			<td valign="top" align="center" width="75%"><input type="text" name="loginUserName" style="width:90%;height:30px"/></td>
	    		</tr>
	    		<tr valign="top">
	    			<td valign="top" align="right" width="25%" style="line-height:200%">密 &nbsp;&nbsp;码:</td>
	    			<td valign="top" align="center" width="75%"><input type="password" name="loginUserPW" style="width:90%;height:30px"/></td>
	    		</tr>
				</table></td></tr>
			<tr><td align="center"><table width="80%">
				<tr>
<!--					<td><div id="msg"></div></td>-->
				</tr>
				<tr>
					<td>
						<div id="loginSubmit" ><input class="btn btn-primary btn-block" type="submit" value="提交"  onclick="loginWait()"/></div>
						<div id="loginWait" style="display:none"><input class="btn btn-primary btn-block" type="submit" value="正在登陆，请稍后..." /></div>
						<br><br>
					</td>
				</tr>
				</table></td>
			</tr>
		</table>
		<br>
    </form>

<br>

</center>
</body>
</html>
 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%>  
 <%@ include file="../check/index.jsp"%> 
 <%//@ include file="../check/checkAdmin.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

  </head>
  
<script language=javascript> 
	setTimeout("document.editUserForm.submit()",200); 
</script> 

  <body>
 <form class="form-horizontal" id="editUserForm" name="editUserForm" method="post" action="../sys">
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../sys";
	String info = null;
	String type = request.getParameter("type");
	String userID_tostring = request.getParameter("userId");
	if(null==type||type.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
<%		
	}else{
		if(type.equals("edit")){ //编辑
			if(null==userID_tostring||userID_tostring.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%
			}
			else{
				int id = Integer.parseInt(userID_tostring);

				UserDao userDao = new UserDao();
				String telephone = request.getParameter("telephone" + id);
				
				String pw = request.getParameter("password"+id);
				//String nickname = request.getParameter("nickname"+id);
				String tel = request.getParameter("telephone"+id);
				//String email = request.getParameter("email"+id);
										
			    if(null==pw||pw.equals("")){
			    	userDao.modifyUser(id,"",tel);
			    }
			    else{
			    	PasswordUtil GP = new PasswordUtil();
			    	pw = GP.generatePassword(pw);
			    	userDao.modifyUser(id,pw,tel);
			    }
			}
		}
	}
%>

</form>
</body>
</html>
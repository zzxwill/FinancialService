 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>“云海肴”在线财务核算系统</title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

  </head>

  <body>
 
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../sys";
	String info = null;
	String type = request.getParameter("type");
	String userID_tostring = request.getParameter("userId");
	int id = Integer.parseInt(userID_tostring);
	System.out.println("userID_tostring:" + userID_tostring + "\n");
	if(null==type||type.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
<%		
	}else{
		if(type.equals("edit")){ //编辑
			//TODO：判断非法用户名，是否同名
			String auth_tostring = request.getParameter("authority" + id);
			System.out.println("auth_tostring:" + auth_tostring + "\n");
			if(null==auth_tostring||auth_tostring.equals("")){
				System.out.println("auth_tostring001:" + auth_tostring + "\n");
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%				
			}else{
				String name = request.getParameter("username" + id);
				String pw = request.getParameter("password" + id);
				if(null==name||name.equals("")||name.equals("null")||null==pw||pw.equals("")||pw.equals("null")){
					System.out.println("name:" + "\n");
				%>
					<script language='javascript' type='text/javascript'>
						alert("请输入正确的用户名和密码！");
					window.location = "<%=url%>";
					</script>
				<%
				}
				String tel = request.getParameter("telephone" + id);
				int auth = Integer.parseInt(auth_tostring);
				System.out.println("auth:" + auth + "\n");
				//PasswordUtil GP = new PasswordUtil();
		    	//pw = GP.generatePassword(pw);
		    	UserDao userAdminDao = new UserDao();
		    	userAdminDao.modifyUserByAdmin(id,pw,tel,auth,0);
		    	
		    	//userAdminDao.insertUser(name,pw,tel,auth);
				// System.out.println("username:" + name + "\npw:" + pw + "\nnickname:" + nickname +"\ntel:" 
				//		+ tel + "\nemail:" + email + "\nauthority:" + auth + "\n");
			}
		}
		else if(type.equals("new")){ //新建
			//TODO：判断非法用户名，是否同名
			String auth_tostring = request.getParameter("authorityNew");
			if(null==auth_tostring||auth_tostring.equals("")){
				System.out.println("005");
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%				
			}else{
				String name = request.getParameter("usernameNew");
				String pw = request.getParameter("passwordNew");
				if(null==name||name.equals("")||name.equals("null")||null==pw||pw.equals("")||pw.equals("null")){
				%>
					<script language='javascript' type='text/javascript'>
						alert("请输入正确的用户名和密码！");
					window.location = "<%=url%>";
					</script>
				<%
				}
				String tel = request.getParameter("telephoneNew");
				int auth = Integer.parseInt(auth_tostring);
				//PasswordUtil GP = new PasswordUtil();
		    	//pw = GP.generatePassword(pw);
		    	UserDao userAdminDao = new UserDao();
		    	userAdminDao.insertUser(name,pw,tel,auth);
				// System.out.println("username:" + name + "\npw:" + pw + "\nnickname:" + nickname +"\ntel:" 
				//		+ tel + "\nemail:" + email + "\nauthority:" + auth + "\n");
			}
		}
	}
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>

</body>
</html>
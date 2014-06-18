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
	String tel_tostring01 = request.getParameter("telephone");
	System.out.println("tel_tostring01:" + tel_tostring01 + "\n");
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
				System.out.println("id:" + id + "\n");
				String auth_tostring = request.getParameter("authority"+id);
				//String nickname = request.getParameter("nicknameNew");
				System.out.println("auth_tostring:" + auth_tostring + "\n");
				//if(null==auth_tostring||auth_tostring.equals("")){
					System.out.println("04");
	%>
					<script language='javascript' type='text/javascript'>
						window.location = "<%=url%>";
					</script>
	<%				
				// }else{
					System.out.println("01");
					UserDao userAdminDao = new UserDao();
					String telephone = request.getParameter("telephone" + id);
					String radio = request.getParameter("radio"+id);
					System.out.println("telephone:" + telephone);
					if(radio.equals("1")){
						userAdminDao.deleteUser(id);
						System.out.println("shanchu ");
					}else if(radio.equals("0")){
						String pw = request.getParameter("password"+id);
						//String nickname = request.getParameter("nickname"+id);
						String tel = request.getParameter("telephone"+id);
						//String email = request.getParameter("email"+id);
						int auth = Integer.parseInt(auth_tostring);
						
					    if(null==pw||pw.equals("")){
					    	userAdminDao.modifyUserByAdmin(id,"",tel,auth,1);
					    	System.out.println("qumim");
					    }
					    else{
					    	//PasswordUtil GP = new PasswordUtil();
					    	//pw = GP.generatePassword(pw);
					    	userAdminDao.modifyUserByAdmin(id,pw,tel,auth,0);
					    }
						
						System.out.println("id:" + id + "\npw:" + pw + "\ntel:"  + tel + "\nauthority:" + auth + "\n");
					}
				//}
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
				String nickname = request.getParameter("nicknameNew");
				String tel = request.getParameter("telephoneNew");
				String email = request.getParameter("emailNew");
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
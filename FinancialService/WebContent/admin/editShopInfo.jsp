 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%> 
 <%//@ page import="database.*" %>  
 <%@ include file="../check/index.jsp"%> 
 <%@ include file="../check/checkAdmin.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 
	 <%@ include file="../include/tableCSS.jsp"%> 

  </head>

  <body>
 
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../sys";
	String info = null;
	String type = request.getParameter("type");
	String shopID_tostring = request.getParameter("shopId");
	if(null==type||type.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
<%		
	}else{
		if(type.equals("edit")){ //编辑
			System.out.println("edit\n");
			if(null==shopID_tostring||shopID_tostring.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%
			}
			else{
				int id = Integer.parseInt(shopID_tostring);
				ShopDao shopAdminDao = new ShopDao();
				String radio = request.getParameter("shopRadio"+id);
				if(radio.equals("1")){
					shopAdminDao.deleteShop(id);
				}else if(radio.equals("0")){
					String shopName = request.getParameter("shopName"+id);
					String shopKeeper = request.getParameter("shopKeeper"+id);
					String shopKeeperTel = request.getParameter("shopKeeperTel"+id);
				    shopAdminDao.modifyShop(id, shopName, shopKeeper, shopKeeperTel, 0);
				}
			}
		}
		else if(type.equals("new")){ //新建
			//TODO：判断非法用户名，是否同名
			String shopName = request.getParameter("shopNameNew");
			if(null==shopName||shopName.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%				
			}else{
				String shopKeeper = request.getParameter("shopKeeperNew");
				String shopKeeperTel = request.getParameter("shopKeeperTelNew");
				if(null==shopKeeper||shopKeeper.equals("")||shopKeeperTel.equals("null")||null==shopKeeperTel||shopKeeperTel.equals("")||shopKeeperTel.equals("null")){
				%>
					<script language='javascript' type='text/javascript'>
						alert("请输入正确的分店相关信息！");
					window.location = "<%=url%>";
					</script>
				<%
				}
		    	ShopDao shopAdminDao = new ShopDao();
		    	shopAdminDao.insertShop(shopName, shopKeeper, shopKeeperTel);
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
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td align="center"><strong>分店编号</strong></td>
		<td align="center"><strong>分店名</strong></td>
		<td align="center"><strong>分店负责人</strong></td>
		<td align="center"><strong>负责人电话</strong></td>
		<td align="center"><strong>状&nbsp;态</strong></td>
		<td align="center"><strong>编&nbsp;辑</strong></td>
	</tr>
<%
ShopDao shopAdminDao = new ShopDao();
int shopNum = 0;
shopNum = shopAdminDao.getShopNum();

int ShopId = 0;
for(ShopId=1;ShopId<=shopNum;ShopId++){
	shopAdminDao.getShopInfo(ShopId);
	
%>
	<tr align="center" >
		<td align="center"><%=ShopId %></td>
		<td align="center"><%=shopAdminDao.shopName %></td>
		<td align="center"><%=shopAdminDao.shopKeeper %></td>
		<td align="center"><%=shopAdminDao.shopKeeperTel %></td>
		<td align="center" >
			<%=(shopAdminDao.IsShopDel(ShopId)==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
		</td>
		<td align="center" valign="middle" >
				
			<form class="form-horizontal" id="shopForm<%=ShopId %>" method="post" action="../admin/editShopInfo.jsp?type=edit&shopId=<%=ShopId %>">	
				<div class="view"> 
			       <!-- Button to trigger modal --> 
			       <div align="right">
			       <center><a id="myModalLinkShop<%=ShopId %>" href="#myModalContainerShop<%=ShopId %>" role="button" class="btn btn-primary" data-toggle="modal">编辑</a> </center>
			       </div>
			       <!-- Modal -->
			       <div id="myModalContainerShop<%=ShopId %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelShop<%=ShopId %>" aria-hidden="true">
			         <div class="modal-header">
			           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			           <h3 id="myModalLabelShop<%=ShopId %>" contenteditable="true">编辑分店信息</h3>
			         </div>
			         
					<div class="modal-body">		

<script>
    function checkEditShopInput(ShopId)
    {
 	   var shopNameEdit = document.getElementById("shopName"+ShopId).value;
 	   var shopKeeperEdit = document.getElementById("shopKeeper"+ShopId).value;
 	   var shopKeeperTelEdit = document.getElementById("shopKeeperTel"+ShopId).value;
 	   var message = null;
 	   var msg = document.getElementById("msgShop"+ShopId);
 	   var flag = 1;
 	   var right = 1;
 	   var ifFlag = 1;	   
 	   if(null==shopNameEdit||shopNameEdit == ""){
 			  flag = 0;
 			  right = 0;
 		 	  message = "请输入正确的分店名！";
 		 	  //alert(message);
 			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
 	   }
 	   if(null==shopKeeperEdit||shopKeeperEdit == ""||null==shopKeeperTelEdit||shopKeeperTelEdit == ""){
 			  flag = 0;
 			  right = 0;
 		 	  message = "请输入正确的各项信息！";
 			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
 	   }
 	   if(right==1){
 		   <%
 		   //ShopDao shopAdminDaoNew = new ShopDao();
 		  	shopAdminDao.getAllShopNames();
 		   //int i=1;
 		   for(int i=1;i<=shopAdminDao.ShopNum;i++){
 		   %>
 			   if((ifFlag==1) &&( shopNameEdit == '<%=shopAdminDao.ShopNames[i] %>' ))
 				{
 	 				if(ShopId!='<%=i%>'){
	 					flag = 0;
	 					ifFlag = 0;
	 					message = "分店名有冲突，请重新输入！";
	 					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	 					//break;
 	 				}
 			   	}
 		   <%}%>
 	   }
 	   if(flag==1){
 	      var shopForm = document.getElementById("shopForm"+ShopId);
 	      shopForm.submit(); 
 	   }
   }

</script>

					<table width="60%" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr style="color: #CC3300">
							<td align="left" width="49%">删除分店:</td>
							<td align="center" width="50%">
							<table width="100%">
								<tr>
								<%
								if(shopAdminDao.IsShopDel(ShopId)==1){
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="shopRadio<%=ShopId %>" value="0"></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="shopRadio<%=ShopId %>" value="1"></td>
								<%
								}else{
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="shopRadio<%=ShopId %>" value="0"></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="shopRadio<%=ShopId %>" value="1"></td>
								
								<%} %>
									<td align="right" width="10%">&nbsp;</td>
								</tr>
							</table>
							</td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="49%">分店名:</td>
							<td align="center" width="50%">
								<input style="height: 30px" type="text" name="shopName<%=ShopId %>" id="shopName<%=ShopId %>" style="width:90%;" value="<%=shopAdminDao.shopName %>" /></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="49%">分店负责人:</td>
							<td align="center" width="50%">
								<input style="height: 30px" type="text" id="shopKeeper<%=ShopId %>"  name="shopKeeper<%=ShopId %>" style="width:90%;" value="<%=shopAdminDao.shopKeeper %>"/></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="49%">负责人电话:</td>
							<td align="center" width="50%">
								<input style="height: 30px" type="text" id="shopKeeperTel<%=ShopId %>" name="shopKeeperTel<%=ShopId %>" style="width:90%;" value="<%=shopAdminDao.shopKeeperTel %>" /></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
					</table>
					
					</div>
			         
			         <div class="modal-footer">
			         
			         <table width="95%">
			         	<tr>
			         		<td width="66%" align="center"  valign="top">&nbsp;
			         			<div id="msgShop<%=ShopId %>"></div>
			         		</td>
			         		<td width="17%" align="center"  valign="bottom">
			          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
			          		</td>
							<td width="17%" align="center"  valign="bottom">
			           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkEditShopInput(<%=ShopId %>)"/>
			           		</td>
			           	</tr>
			          </table>

			         </div>
			       </div>
			     </div>
			</form>

		</td>
	</tr>
	<%} %>
</table>

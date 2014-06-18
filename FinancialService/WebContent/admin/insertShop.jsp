<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

<!--<form class="form-horizontal" id="financialForm" method="post" action="../sys/index.jsp">-->
<form class="form-horizontal" id="shopForm" method="post" action="../admin/editShopInfo.jsp?type=new">
	<div class="view"> 
       <!-- Button to trigger modal --> 
       <div align="right">
       <a id="myModalLinkShop" href="#myModalContainerShop" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">新建分店</a> 
       </div>
       <!-- Modal -->
       <div id="myModalContainerShop" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelShop" aria-hidden="true">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h3 id="myModalLabelShop" contenteditable="true">新建分店</h3>
         </div>
         <div class="modal-body" style="line-height:200%" >
         
 <script>
    function checkNewShopInput()
    {
	   var shopNameNew = document.getElementById("shopNameNew").value;
	   var shopKeeperNew = document.getElementById("shopKeeperNew").value;
	   var shopKeeperTelNew = document.getElementById("shopKeeperTelNew").value;
	   var message = null;
	   var msg = document.getElementById("msgShop");
	   var flag = 1;
	   var right = 1;
	   var ifFlag = 1;	   
	   if(null==shopNameNew||shopNameNew == ""){
			  flag = 0;
			  right = 0;
		 	  message = "请输入正确的分店名！";
		 	  //alert(message);
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(null==shopKeeperNew||shopKeeperNew == ""||null==shopKeeperTelNew||shopKeeperTelNew == ""){
			  flag = 0;
			  right = 0;
		 	  message = "请输入正确的各项信息！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(right==1){
		   <%
		   ShopDao shopAdminDaoNew = new ShopDao();
		   shopAdminDaoNew.getAllShopNames();
		   //int i=1;
		   for(int i=1;i<=shopAdminDaoNew.ShopNum;i++){
		   %>
			   if((ifFlag==1) &&( shopNameNew == '<%=shopAdminDaoNew.ShopNames[i] %>' ))
				{
					flag = 0;
					ifFlag = 0;
					message = "分店名有冲突，请重新输入！";
					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
					//break;
			   	}
		   <%}%>
	   }
	   if(flag==1){
	      var shopNewForm = document.getElementById("shopForm");
	      shopNewForm.submit(); 
	   }
    }

</script>
         
         	<table  width="60%" align="center" border="0" cellpadding="1" cellspacing="1">
	    		<tr>
	    			<td align="left" width="49%" >分&nbsp;店&nbsp;名:</td>
	    			<td align="center" width="50%">
	    				<input style="height:30px" type="text" id="shopNameNew" name="shopNameNew" style="width:80%;" value=""/>
	    			</td>
	    			<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
	    		<tr>
	    			<td align="left" width="49%" >分店负责人:</td>
	    			<td align="center" width="50%">
	    				<input style="height:30px" type="text" id="shopKeeperNew" name="shopKeeperNew" style="width:80%;" value=""/>
	    			</td>
	    			<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
	    		<tr>
	    			<td align="left" width="49%">负责人电话:</td>
	    			<td align="center" width="50%">
	    				<input style="height:30px" type="text" id="shopKeeperTelNew" name="shopKeeperTelNew" style="width:80%;" value=""/>
	    			</td>
	    			<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
			</table>
		
         </div>
         <div class="modal-footer">
         
         <table width="95%">
         	<tr>
         		<td width="66%" align="center"  valign="top">&nbsp;
         			<div id="msgShop"></div>
         		</td>
         		<td width="17%" align="center"  valign="bottom">
          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
          		</td>
				<td width="17%" align="center"  valign="bottom">
           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkNewShopInput()"/>
           		</td>
           	</tr>
          </table>

         </div>
       </div>
     </div>
</form>

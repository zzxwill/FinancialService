<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>

<table width="100%" align="center" border="0" cellpadding="1" cellspacing="1">
	<thead>
		<tr align="center" class="info">
			<th align="center">用户编号</th>
			<th align="center">用户名</th>
			<th align="center">电 &nbsp;话</th>
			<th align="center">权 &nbsp;限</th>
			<th align="center">状&nbsp;态</th>
			<th align="center">编&nbsp;辑</th>
		</tr>
	</thead>
	<tbody>
	<%
	UserDao userAdminDao = new UserDao();
	int userNum = 0;
	userNum = userAdminDao.getUserNum();
	
	int id = 0;
	for(id=1;id<=userNum;id++){
		userAdminDao.getUserInfo(id);
	%>

<form class="form-horizontal" id="userForm<%=id %>" method="post" action="../admin/editUserInfo.jsp?type=edit&userId=<%=id %>">
	
	<tr align="center">
	<td align="center"><%=id %></td>
	<td align="center"><%=userAdminDao.UserName %></td>
	<td align="center"><%=userAdminDao.UserTel %></td>
	<td align="center">
		<%=(userAdminDao.UserGroup==1)?"管理员":"普&nbsp;通" %>				
	</td>
	<td align="center">
		<%=(userAdminDao.IsUserDel(id)==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
	</td>
	<td align="center">
	
	<div class="view"> 
       <!-- Button to trigger modal --> 
       <div align="right">
       <a id="myModalLink<%=id %>" href="#myModalContainer<%=id %>" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">编辑</a> 
       </div>
       <!-- Modal -->
       <div id="myModalContainer<%=id %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel<%=id %>" aria-hidden="true">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h3 id="myModalLabel<%=id %>" contenteditable="true">编辑用户信息</h3>
         </div>
         <div class="modal-body" style="line-height:200%" >
<!--			           <p contenteditable="true">显示信息-->
				<div style="line-height:200%;color:red">用户名、密码与权限，此三项为必填项！</div>
           	    <table  width="58%" align="center" border="0" cellpadding="1" cellspacing="1">
			    		<tr>
			    			<td align="left" width="25%" >用户名:</td>
			    			<td align="center" width="70%">
			    				<input style="height:30px" type="text" name="username<%=id %>" style="width:90%;" value=""/>
			    			</td>
			    			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
			    		<tr>
			    			<td align="left" width="25%" >密 &nbsp;码:</td>
			    			<td align="center" width="70%">
			    				<input style="height:30px" type="password" name="password<%=id %>" style="width:90%;" value=""/>
			    			</td>
			    			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
			    		<tr>
			    			<td align="left" width="25%">电 &nbsp;话:</td>
			    			<td align="center" width="70%">
			    				<input style="height:30px" type="text" name="telephone<%=id %>" style="width:90%;" value=""/>
			    			</td>
			    			<td width="5%"><a>&nbsp;&nbsp;</a></td>
			    		</tr>
			    		<tr>
			    			<td valign="middle" align="left" width="25%">权 &nbsp;限:</td>
			    			<td align="center" width="70%">
			    				<table width="100%">
			    					<tr>
			    						<td align="right" width="25%">普通</td>
			    						<td valign="top" align="left" width="20%">
			    							<input type="radio" checked name="authority<%=id %>" value="0"></td>
			    						
			    						<td align="right" width="25%">管理员</td> 
			    						<td valign="top" align="left" width="20%">
			    							<input type="radio" name="authority<%=id %>" value="1"></td> 
			    						<td align="right" width="10%">&nbsp;</td>
			    					</tr>
								</table>
							</td>
			    			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
				</table>
<!--			           </p>-->
         </div>
         <div class="modal-footer">
           <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
<!--			           <input type="submit" class="btn btn-primary" contenteditable="true" value="保存设置" />-->
           <button type="submit" class="btn btn-primary" contenteditable="true">保存设置</button>
         </div>
       </div>
     </div>
</form>

	<%} %>
	</tbody>
</table>
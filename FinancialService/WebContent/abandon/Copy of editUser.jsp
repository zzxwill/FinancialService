<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

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
		<form class="form-horizontal" id="userForm<%=id %>" method="post"
			action="../admin/editUserInfo.jsp?type=edit&userId=<%=id %>" >
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
			<div class="view"><!-- Button to trigger modal --> 
				<a id="myModalLink<%=id %>" href="#myModalContainer<%=id %>" role="button" class="btn btn-info" data-toggle="modal" contenteditable="true">编辑</a>

			<!-- Modal -->
			<div id="myModalContainer<%=id %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel<%=id %>" aria-hidden="true">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<center>
			<h3 id="myModalLabel<%=id %>" contenteditable="true">编辑用户信息</h3>
			</center>
			</div>
			<div class="modal-body">
			<div align="center" style="color: red">密码若不修改请勿填写！</div>
			<table width="58%" align="center" border="0" cellpadding="1" cellspacing="1">
				<tr style="color: #CC3300">
					<td align="left" width="25%">删除用户:</td>
					<td align="center" width="70%">
					<table width="100%">
						<tr>
						<%
						if(userAdminDao.IsUserDel(id)==1){
						%>
							<td align="right" width="25%">否</td>
							<td valign="top" align="left" width="20%">
								<input type="radio" name="radio<%=id %>" value="0"></td>

							<td align="right" width="25%">是</td>
							<td valign="top" align="left" width="20%">
								<input type="radio" checked name="radio<%=id %>" value="1"></td>
						<%
						}else{
						%>
							<td align="right" width="25%">否</td>
							<td valign="top" align="left" width="20%">
								<input type="radio" checked name="radio<%=id %>" value="0"></td>

							<td align="right" width="25%">是</td>
							<td valign="top" align="left" width="20%">
								<input type="radio" name="radio<%=id %>" value="1"></td>
						
						<%} %>
							<td align="right" width="10%">&nbsp;</td>
						</tr>
					</table>
					</td>
					<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
				</tr>
				<tr>
					<td align="left" width="25%">用户名:</td>
					<td align="center" width="70%">
						<input style="height: 30px" type="text" name="username<%=id %>" id="username<%=id %>" style="width:90%;" value="<%=userAdminDao.UserName %>" disabled="disabled" /></td>
					<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
				</tr>
				<tr>
					<td align="left" width="25%">密 &nbsp;码:</td>
					<td align="center" width="70%">
						<input style="height: 30px" type="password" name="password<%=id %>" style="width:90%;" /></td>
					<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
				</tr>
				<tr>
					<td align="left" width="25%">电 &nbsp;话:</td>
					<td align="center" width="70%">
						<input style="height: 30px" type="text" name="telephone<%=id %>" style="width:90%;" value="<%=userAdminDao.UserTel %>" /></td>
					<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
				</tr>
				<tr>
					<td align="left" width="25%">权 &nbsp;限:</td>
					<td align="center" width="70%">
					<table width="100%">
						<tr>
						<%
						if(userAdminDao.UserGroup==1){
						%>
							<td align="right" width="25%">普通</td>
							<td valign="top" align="left" width="20%">
								<input type="radio"  name="authority<%=id %>" id="authority<%=id %>" value="0"></td>

							<td align="right" width="25%">管理员</td>
							<td valign="top" align="left" width="20%">
								<input type="radio" checked name="authority<%=id %>" id="authority<%=id %>" value="1"></td>
						
						<%
						}else{
						%>
							<td align="right" width="25%">普通</td>
							<td valign="top" align="left" width="20%">
								<input type="radio" checked name="authorityNN" id="authorityNN" value="0"></td>

							<td align="right" width="25%">管理员</td>
							<td valign="top" align="left" width="20%">
								<input type="radio" name="authorityNN" id="authorityNN" value="1"></td>
						<%} %>
							<td align="right" width="10%">&nbsp;</td>
						</tr>
					</table>
					</td>
					<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
				</tr>
			</table>
			</div>
			<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true"
				contenteditable="true">取消</button>
			<!--			           <input type="submit" class="btn btn-primary" contenteditable="true" value="保存设置" />-->
			<button type="submit" class="btn btn-primary" contenteditable="true">保存设置</button>
			</div>
			</div>


			</div>
			</td>
		</tr>
		</form>
	<%} %>
	</tbody>
</table>




<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td align="center"><strong>编号</strong></td>
		<td align="center"><strong>姓名</strong></td>
		<td align="center"><strong>性别</strong></td>
		<td align="center"><strong>年龄</strong></td>
		<td align="center"><strong>手机</strong></td>
	<!-- 	<td align="center"><strong>师从</strong></td>
		<td align="center"><strong>医师证号</strong></td>
		<td align="center"><strong>科室</strong></td>
		<td align="center"><strong>职    称</strong></td>
		<td align="center"><strong>是否通过审核</strong></td> -->
		
		
	</tr>

	<%
	UserDao patient_dao = new UserDao();
	
	patient_dao.retrive_patients();
	

	for(int i=0; i < patient_dao.doctor_id.size(); i++){
		
	%>

	<tr align="center" >
		<td align="center"><%=patient_dao.doctor_id.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_name.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_gender.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_age.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_mobile.get(i) %></td>
	<%-- 	<td align="center"><%=patient_dao.doctor_master.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_doctor_criteria.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_department.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_title.get(i) %></td>
		<td align="center"><%=patient_dao.doctor_validate_flag.get(i) %></td>			 --%>
		
		<%-- <td align="center">
			<%=(patient_dao.UserGroup==1)?"管理员":"普&nbsp;通" %>				
		</td>
		<td align="center" >
			<%=(patient_dao.IsUserDel(i)==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
		</td> --%>
		
		<%-- <td align="center" valign="middle" >
				
			<form class="form-horizontal" id="userForm<%=i %>" method="post" action="../admin/editUserInfo.jsp?type=edit&userId=<%=i %>">	
				<div class="view"> 
			       <!-- Button to trigger modal --> 
			       <div align="right">
			       <center><a id="myModalLinkUser<%=i %>" href="#myModalContainerUser<%=i %>" role="button" class="btn btn-primary" data-toggle="modal">编辑</a> </center>
			       </div>
			       <!-- Modal -->
			       <div id="myModalContainerUser<%=i %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUser<%=i %>" aria-hidden="true">
			         <div class="modal-header">
			           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			           <h3 id="myModalLabelUser<%=i %>" contenteditable="true">编辑用户信息</h3>
			         </div>
			         
					<div class="modal-body">
					
<script>
    function checkEditUserInput2(TelId)
    {
       //alert(TelId);
	   var telephoneEdit = document.getElementById('telephone'+TelId).value; 
	   var message = null;
	   var msg = document.getElementById("msgUser"+TelId);
	   var flag = 1;   
	   if(null==telephoneEdit||telephoneEdit == ""){
			  flag = 0;
		 	  message = "请输入正确的电话！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			  //alert(message);
	   }
	   if(flag==1){
	      //var addrForm = document.forms("addrForm");
	      var userForm = document.getElementById("userForm"+TelId);
	      userForm.submit(); 
	   }
    }

</script>
					
					<div align="center" style="color: red">密码若不修改请勿填写！</div>
					<table width="58%" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr style="color: #CC3300">
							<td align="left" width="25%">删除用户:</td>
							<td align="center" width="70%">
							<table width="100%">
								<tr>
								<%
								if(patient_dao.IsUserDel(i)==1){
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="radio<%=i %>" value="0"></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="radio<%=i %>" value="1"></td>
								<%
								}else{
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="radio<%=i %>" value="0"></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="radio<%=i %>" value="1"></td>
								
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
								<input style="height: 30px" type="text" name="username<%=i %>" id="username<%=i %>" style="width:90%;" value="<%=patient_dao.UserName %>" disabled="disabled" /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="25%">密 &nbsp;码:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="password" name="password<%=i %>" style="width:90%;" /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="25%">电 &nbsp;话:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="text" id="telephone<%=i %>" name="telephone<%=i %>" style="width:90%;" value="<%=patient_dao.UserTel %>" /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="25%">权 &nbsp;限:</td>
							<td align="center" width="70%">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" >
								<tr>
								<%
								if(patient_dao.UserGroup==1){
								%>
									<td align="right" width="25%">普通</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio"  name="authority<%=i %>" value="0"></td>
		
									<td align="right" width="25%">管理员</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="authority<%=i %>"value="1"></td>
								
								<%
								}else{
								%>
									<td align="right" width="25%">普通</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="authority<%=i %>"value="0"></td>
		
									<td align="right" width="25%">管理员</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="authority<%=i %>"value="1"></td>
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
			         <table width="95%">
			         	<tr>
			         		<td width="66%" align="center" valign="top">&nbsp;
			         			<div id="msgUser<%=i %>"></div>
			         		</td>
			         		<td width="17%" align="center"  valign="bottom">
			          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
			          		</td>
							<td width="17%" align="center"  valign="bottom">
			           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkEditUserInput2(<%=i %>)"/>
			           		</td>
			           	</tr>
			          </table>
			         </div>
			       </div>
			     </div>
			</form>

		</td> --%>
	</tr>
	<%} %>
</table>

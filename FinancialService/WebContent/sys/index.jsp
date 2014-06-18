
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title><%=sysName %></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/tableCSS.jsp"%>

</head>

<body>
	<%@ include file="../check/index.jsp"%>
	<center>
		<h1>
			<p style='color: red;'><%=sysName %></p>
		</h1>

		<div style="width: 1200px;">

			<div class="tabbable" id="tabs-652502">
				<!-- Only required for left/right tabs -->
				<script>
	function jumpOut(){
		self.location = '../exit';
	}
    </script>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#panel-user_doctor" data-toggle="tab" contenteditable="true" style="cursor: pointer">医生列表</a></li>
					
					<li><a href="#panel-user_patient" data-toggle="tab" contenteditable="true" style="cursor: pointer">患者列表</a></li>
					
					<li><a href="#panel-question" data-toggle="tab" contenteditable="true" style="cursor: pointer">提问列表</a></li>
					
					<li><a href="#panel-reservation" data-toggle="tab" contenteditable="true" style="cursor: pointer">预约列表</a></li>
					
					<li><a href="#panel-outpatient" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">出诊时间管理</a></li>
					
					<li><a href="#panel-user" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">用户信息</a></li>
				
					<table align="right">
						<tr>
							<td>Welcome&nbsp;,&nbsp;<%=loginedUserName %>&nbsp;!&nbsp;&nbsp;&nbsp;
							</td>
							<td><a class="btn btn-warning" contenteditable="true"
								onclick="jumpOut()">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
				</ul>

				<%
    String url = "../sys";
    request.setCharacterEncoding("utf-8");
    //String checkedName = (String)session.getAttribute("loginedUserName");
    adminCheck = (String)session.getAttribute("adminCheck");
    if(null==adminCheck||adminCheck.equals("")){
    	//System.out.println("admincheck:" + adminCheck + "\n");
    %>
				<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
				<%}else if(adminCheck.endsWith("true")){ %>

				<div class="tab-content">
					<%//医生列表 %>
					<div class="tab-pane active" id="panel-user_doctor">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_doctor.jsp"%>
					</div>

					<%//患者列表 %>
					<div class="tab-pane" id="panel-user_patient">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_patient.jsp"%>
					</div>
					
					
					<%//提问列表%>
					<div class="tab-pane" id="panel-question">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_question.jsp"%>
					</div>
					
					
					<%//预约列表%>
					<div class="tab-pane" id="panel-reservation">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_reservation.jsp"%>
					</div>
					
					
					<%//出诊时间管理 %>
					<div class="tab-pane" id="panel-outpatient">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/manage_outpatient.jsp"%>
					</div>

					<%//用户信息 %>
					<div class="tab-pane" id="panel-user">
						<%@ include file="../admin/insertUser.jsp"%>
						<%@ include file="../admin/editUser.jsp"%>
					</div>

				

				</div>
				<%}else{ %>
				<div class="tab-content">
					<%//医生列表 %>
					<div class="tab-pane active" id="panel-user_doctor">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_doctor.jsp"%>
					</div>

					<%//用户信息 %>
					<div class="tab-pane" id="panel-user">
						<%@ include file="../common/editUser.jsp"%>
					</div>

				

				</div>
				<%} %>

			</div>

		</div>
</body>
</html>
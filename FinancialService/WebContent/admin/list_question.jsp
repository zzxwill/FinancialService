<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>
<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td width="10%" align="center"><strong>提问时间</strong></td>
		<td width="10%" align="center"><strong>姓名</strong></td>
		<td width="10%" align="center"><strong>科室</strong></td>
		<td width="10%" align="center"><strong>是否答复</strong></td>
		<td width="10%" align="center"><strong>问题</strong></td>
		<td width="50%" align="center"><strong>专家答复</strong></td>
		
		
		
	</tr>	
		<%
		ASKPatient askPatient = new ASKPatient();
		DepartmentDao departmentDao = new DepartmentDao();
		askPatient.getAllQuestionInfos();
		int departmentID = 0;
		String departmentName = null;
		int answerFlag = 0; 
		int question_num_patient = askPatient.num;
		if(question_num_patient>0){
			
			for(int i=1;i<=question_num_patient;i++){
				
				departmentID = askPatient.departments[i];
				departmentName = departmentDao.getDepartmentName(departmentID);
				answerFlag = askPatient.answered_flags[i];
				if(answerFlag==0){
				%>
				 <tr align="center" >		
								<td width="10%"><%=askPatient.createDates[i] %></td>
								<td width="10%"><img src="../img/child.png" border = "0px"  width="20px"/></td>
								<td width="10%"><%=departmentName %></td>
								<td width="10%" align="center"><div id="reply_no">未答复</div></td>
								<td width="10%"></td>					
						<td width="50%" align="left" id="questions"><%=askPatient.contents[i] %></td>
					
					</tr>
				<%
				}else{
					int questionID = askPatient.ids[i];
					AnswerDao answerDao_Patient = new AnswerDao();
					answerDao_Patient.getAnswers_Given(questionID);
					%>
					<tr align="center">			
								<td width="10%"><%=askPatient.createDates[i] %></td>
								<td width="10%"><img src="../img/child.png" border = "0px"  width="20px"/></td>
								<td width="10%"><%=departmentName %></td>
								<td width="10%" align="center"><div id="reply_yes">已答复</div></td>	
						
						<td width="10%" align="left" id="questions"><%=askPatient.contents[i] %></td>
						<td width="50%" align="left"  id="answers">
							<%
							//System.out.println("answerDao_Patient.num_Given_Patient:" + answerDao_Patient.num_Given_Patient + "\n");
							for(int j=1;j<=answerDao_Patient.num_Given_Patient;j++){	
							%>
								<img src="../img/zhuanjiahuida.png" border = "0px"  width="25px"/>专家答复&nbsp;<%=j %>&nbsp;：&nbsp;<%=answerDao_Patient.answers_Given_Patient[j] %><br>
							<%} %>
							</td>
							</tr>
				
				
				<%
				}
			}
			
		}

		%>

</table>

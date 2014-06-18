<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
					<td align="center" width="20%"><strong>日期</strong></td>
					<td align="center" width="20%"><strong>星期</strong></td>
					<td align="center" width="20%"><strong>时段</strong></td>
					<td align="center" width="20%"><strong>门诊类型</strong></td>
					<td align="center" width="20%"><strong>是否停诊</strong></td>
				</tr>
				
				
				
			

					
						<%
					ReserveClinicDao outpatient_dao = new ReserveClinicDao();
						outpatient_dao.retrive_outpatient();
					for(int i=0;i<outpatient_dao.outpatient_id.size();i++){
				
					
					%>
							<tr style="height: 40px; line-height: 40px;">
								<td align="center"><%=outpatient_dao.outpatient_date.get(i) %>
								<td align="center">星期@</td>
								<td align="center"><%=outpatient_dao.time.get(i) %></td>
								<td align="center"><%=outpatient_dao.outpatient_type.get(i)%></td>
								<td>
									<% if (outpatient_dao.amount.get(i) < 50){ %>
									<div align="center" class="ASKSubmit_no"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" onclick="" >已停诊
									</div>
									<%} else { %>
									<div align="center" class="ASKSubmit"
										style="height: 30px; line-height: 30px;font-size:15px;width:60px;margin:0px"
										onclick="set_reservation_specific_doctor_value('<%=outpatient_dao.outpatient_id.get(i) %>');show_hidden('reservation_specific_doctor');show_hidden('reservation_patient_sickinfo');">预约
									</div>
									<%}%>									

								</td>

							</tr>
					<%} %>					

				
				

				
			
			
</table>
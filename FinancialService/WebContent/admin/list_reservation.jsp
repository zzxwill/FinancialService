<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
					<td align="center" width="20%"><strong>诊疗机构</strong></td>
					<td align="center" width="20%"><strong>科室</strong></td>
					<td align="center" width="20%"><strong>患者</strong></td>
					<td align="center" width="20%"><strong>预约目的</strong></td>
					<td align="center" width="20%"><strong>预约时间</strong></td>
				</tr>
				
				
				
					<%
					ReserveClinicDao reserveClinicDao = new ReserveClinicDao();
					reserveClinicDao.retrive_doctor_reservation();
					for(int i=0;i<reserveClinicDao.clinic_doctor_site.size();i++){
				
					
					%>
				
				<tr>
					<td align="center"><%=reserveClinicDao.clinic_doctor_site.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_department.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_patient_name.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_purpose.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_date.get(i) %></td>
				</tr>
				<%} %>
				
			
			
</table>
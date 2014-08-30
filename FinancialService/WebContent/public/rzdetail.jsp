<%@page import="model.GuaranteeCategory"%>
<%@page import="java.util.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="org.nutz.dao.impl.*"%>
<%@page import="org.nutz.dao.*"%>
<%@page import="model.*"%>
<%@page import="database.Connections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
Financing financing = dao.fetch(Financing.class, Long.parseLong(request.getParameter("id")));
dao.fetchLinks(financing, null);
pageContext.setAttribute("financing", financing);
%>
<jsp:include page="../common/header.jsp" flush="true"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/bootstrap/css/bootstrap.min.css" />
<div class="content" style="width: 945px; margin: 0 auto;">
<table class="table">
<tr>
<th width="180">融资金额（万元）</th><td>${financing.amount}</td>
</tr>
<tr>
<th>期限（月）</th><td>${financing.period.time}</td>
</tr>
<tr>
<th>年利率（%）</th><td>${financing.rate}</td>
</tr>
<tr>
<th>担保类型</th><td>${financing.guaranteeCategory.name}</td>
</tr>
<tr>
<th>发布日期</th><td>${financing.publishDate}</td>
</tr>
<tr>
<th colspan="2">项目说明：</td>
</tr>
<tr>
<td colspan="2">${financing.comment}</td>
</tr>
</table>
</div>
<jsp:include page="../common/footer.jsp" flush="true"/>
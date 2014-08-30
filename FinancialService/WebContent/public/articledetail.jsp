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
Article article = dao.fetch(Article.class, Long.parseLong(request.getParameter("id")));
pageContext.setAttribute("article", article);
%>
<jsp:include page="../common/header.jsp" flush="true"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/bootstrap/css/bootstrap.min.css" />
<div class="container" style="width: 945px;">
<h3 align="center">${article.title}</h3>
<div>${article.text}</div>
</div>
<jsp:include page="../common/footer.jsp" flush="true"/>
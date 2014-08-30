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
String pageStr = request.getParameter("page");
Integer pageNumber = pageStr==null?1:Integer.parseInt(pageStr);
int pageSize = 20;
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
int count = dao.count(Article.class, Cnd.where("status", "=", "1"));
List<Article> articles = dao.query(Article.class, Cnd.where("status", "=", 1L).limit(dao.createPager(pageNumber, pageSize)).desc("level").desc("id"));
pageContext.setAttribute("articles", articles);
pageContext.setAttribute("pageNumber", pageNumber);
pageContext.setAttribute("pageTotal", (count-1)/pageSize+1);
%>
<jsp:include page="../common/header.jsp" flush="true"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/bootstrap/css/bootstrap.min.css" />
<div class="content" style="width: 945px; margin: 0 auto;">
<ul style="list-style: none;">
<c:forEach var="item" items="${articles}">
<li><a href="articledetail.jsp?id=${item.id}">${item.title}</a></li>
</c:forEach>
</ul>
<ul style="list-style: none;">

<li><c:if test="${pageNumber > 1}"><a href="?page=${pageNumber-1}"><img src="${ctx}/images/lift.jpg" width="18" height="13" /></a></c:if></li>
<li><a href="?page=${pageNumber}" class="txt2">${pageNumber}</a></li>
<li><c:if test="${pageNumber < pageTotal}"><a href="?page=${pageNumber+1}"><img src="${ctx}/images/right.jpg" width="18" height="13" /></a></c:if></li>
</ul>
</div>
<jsp:include page="../common/footer.jsp" flush="true"/>
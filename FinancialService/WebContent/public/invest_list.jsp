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
int pageSize = 10;
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
int count = dao.count(Investment.class, Cnd.where("status", "=", "1"));
List<Investment> invests = dao.query(Investment.class, Cnd.where("status", "=", "1").and("user_id", "=", session.getAttribute("USERID")).limit(dao.createPager(pageNumber, pageSize)));
for (Investment item : invests) {  
    dao.fetchLinks(item, null);
}
pageContext.setAttribute("invests", invests);
pageContext.setAttribute("pageNumber", pageNumber);
pageContext.setAttribute("pageTotal", (count-1)/pageSize+1);
%>
<jsp:include page="../common/header.jsp" flush="true"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/bootstrap/css/bootstrap.min.css" />
<div class="container" style="width: 945px;">
<table>
<tr>
<!-- 左侧导航 -->
<td width = "20%">
	<jsp:include page="user_center_left_navigator.jsp" flush="true"/>	
</td>

<td width = "80%">
<table class="table table-striped">
  <tr>
    <th>投资金额（万元）</th>
    <th>投资期限（月）</th>
    <th>年利率（%）</th>
    <th>担保类型 </th>
    <th>发布日期</th>
  </tr>
  <c:forEach var="item" items="${invests}">
  <tr>
    <td>${item.amount}</td>
    <td>${item.period.time}个月</td>
    <td>${item.expect_rate}</td>
    <td>${item.guaranteeCategory.name}</td>
    <td><fmt:formatDate value="${item.date}" pattern="yyyy年MM月dd日"/></td>
  </tr>
  </c:forEach>
</table>
<ul class="pager">
  <c:if test="${pageNumber > 1}">
  <li><a href="?page=${pageNumber-1}">前一页</a></li>
  </c:if>
  <c:if test="${pageNumber < pageTotal}">
  <li><a href="?page=${pageNumber+1}">后一页</a></li>
  </c:if>
</ul>
</td>

</tr>
</table>
</div>

<jsp:include page="../common/footer.jsp" flush="true"/>
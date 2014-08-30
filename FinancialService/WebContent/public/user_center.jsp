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
int count = dao.count(Financing.class, Cnd.where("status", "=", "1"));
List<Financing> financings = dao.query(Financing.class, Cnd.where("status", "=", "1").limit(dao.createPager(pageNumber, pageSize)));
for (Financing item : financings) {  
    dao.fetchLinks(item, null);
}
pageContext.setAttribute("financings", financings);
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

<table class="table table-striped" align="center">
 
  <tr>
    <td align="center">欢迎进入会员管理中心！</td>
  
  </tr>
  
</table>


</td>

</tr>
</table>



</div>

<jsp:include page="../common/footer.jsp" flush="true"/>
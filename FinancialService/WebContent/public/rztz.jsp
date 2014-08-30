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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="271" align="center" bgcolor="#AF190B"><table width="945" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="271" valign="bottom"><p><img src="${ctx}/images/Banner03.jpg" width="943" height="271" /></p></td>
        </tr>
    </table></td>
  </tr>
</table> 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="10" bgcolor="#FFFFFF"><img src="${ctx}/images/space.gif" width="2" height="2" /></td>
  </tr>
</table>
<table width="100%" height="225" border="0" cellpadding="0" cellspacing="0" class="bg2">
  <tr></tr>
<tr>
  <td align="center" valign="top"><table width="945" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="14" bgcolor="#FFFFFF">&nbsp;</td>
        <td width="270" height="110" valign="top" bgcolor="#FFFFFF"><table width="85%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="22" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
        </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22"><img src="${ctx}/images/rztz.jpg" width="248" height="126" /></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="13%" height="22"><img src="${ctx}/images/about2.jpg" width="33" height="127" /></td>
              <td width="75%" valign="middle"><table width="100" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><a href="rztz.jsp"><img src="${ctx}/images/rztz2.jpg" border="0" width="182" height="48" /></a></td>
                </tr>
                <tr>
                  <td><a href="tzxx.jsp"><img src="${ctx}/images/rztz3.jpg"  border="0" width="182" height="48" /></a></td>
                </tr>
              </table></td>
              <td width="12%"><img src="${ctx}/images/about3.jpg" width="33" height="127" /></td>
            </tr>
          </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22">&nbsp;</td>
            </tr>
          </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22"><a href="wyrz.jsp"><img src="${ctx}/images/fabu.jpg" border="0" width="250" height="83" /></a><br /></td>
            </tr>
        </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22">&nbsp;</td>
            </tr>
          </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22"><a href="invest.jsp"><img src="${ctx}/images/fabu2.jpg" border="0" width="250" height="83" /></a></td>
            </tr>
      </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22">&nbsp;</td>
            </tr>
          </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22">&nbsp;</td>
            </tr>
        </table></td>
        <td width="1" valign="top" bgcolor="#FFFFFF" class="nei">&nbsp;</td>
        <td width="651" valign="top" bgcolor="#FFFFFF"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="top"><table width="98" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="73%" align="left"><img src="${ctx}/images/rztz1.jpg" width="340" height="26" /></td>
                  <td width="2%" align="left"><img src="${ctx}/images/h.jpg" width="10" height="9" /></td>
                  <td width="25%" align="left" class="title_links">投融资项目 <img src="${ctx}/images/3j.jpg" width="9" height="9" />融资项目推荐</td>
                </tr>
              </table>
              <table width="98" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="${ctx}/images/ge1.jpg" width="690" height="24" /></td>
                </tr>
              </table>
              <table width="600" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="30">&nbsp;</td>
                </tr>
                </table>
              <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="rongzitxt">
                <tr>
                  <td width="180" height="15" align="center">融资金额（万元） </td>
                  <td width="135" align="center">期限（月） </td>
                  <td width="117" align="center">年利率（%）</td>
                  <td width="100" align="center">担保类型</td>
                  <td width="100" align="center">发布日期</td>
                  <td width="100" align="center">信息状态</td>
                  <td width="108" align="center">查看详情<img src="${ctx}/images/space.gif" width="2" height="2" /></td>
                </tr>
              </table>
                <c:forEach var="item" items="${financings}">
              <table width="90%" border="0" cellpadding="0" cellspacing="0" class="news2">
                <tr>
                  <td width="180" height="35" align="center">${item.amount}</td>
                  <td width="135" align="center">${item.period.time}</td>
                  <td width="117" align="center">${item.rate}</td>
                  <td width="100" align="center">${item.guaranteeCategory.name}</td>
                  <td width="100" align="center"><fmt:formatDate value="${item.publishDate}" pattern="yyyy-MM-dd"/></td>
                  <td width="100" align="center"><c:if test="${item.status == 1}">审核</c:if><c:if test="${item.status != 1}">未审核</c:if></td>
                  <td width="108" align="center"><a href="rzdetail.jsp?id=${item.id}">详细情况</a></td>
                </tr>
              </table>
              </c:forEach>
              <table width="240" border="0" cellpadding="0" cellspacing="0" class="txt">
                <tr>
                  <td><c:if test="${pageNumber > 1}"><a href="?page=${pageNumber-1}"><img src="${ctx}/images/lift.jpg" width="18" height="13" /></a></c:if></td>
                  <td align="center"><a href="?page=${pageNumber}" class="txt2">${pageNumber}</a></td>
                  <td><c:if test="${pageNumber < pageTotal}"><a href="?page=${pageNumber+1}"><img src="${ctx}/images/right.jpg" width="18" height="13" /></a></c:if></td>
                </tr>
              </table>
              <p>&nbsp;</p></td>
          </tr>
        </table>
          <p>&nbsp;</p></td>
        </tr>
</table> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="8"><img src="${ctx}/images/space.gif" width="2" height="2" /></td>
      </tr>
    </table></td>
</tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true"/>
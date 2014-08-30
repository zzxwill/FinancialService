<%@page import="org.nutz.dao.Dao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="database.Connections"%>
<%@page import="java.util.List"%>
<%@page import="org.nutz.dao.Cnd"%>
<%@page import="org.nutz.dao.impl.NutDao"%>
<%@page import="model.Rzsj"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%
String pageStr = request.getParameter("page");
Integer pageNumber = pageStr==null?1:Integer.parseInt(pageStr);
int pageSize = 5;
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
int count = dao.count(Rzsj.class);
List<Rzsj> list = dao.query(Rzsj.class, Cnd.NEW().limit(dao.createPager(pageNumber, pageSize)).desc("id"));
pageContext.setAttribute("list", list);
pageContext.setAttribute("pageNumber", pageNumber);
pageContext.setAttribute("pageTotal", (count-1)/pageSize+1);
%>
<jsp:include page="../common/header.jsp" flush="true"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="271" align="center" bgcolor="#AF190B"><table width="945" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="271" valign="bottom"><p><img src="${ctx}/images/Banner04.jpg" width="943" height="271" /></p></td>
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
              <td height="22"><img src="${ctx}/images/rzsj.jpg" width="251" height="140" /></td>
            </tr>
          </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22">&nbsp;</td>
            </tr>
        </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22"><img src="${ctx}/images/fabu2.jpg" border="0" width="250" height="83" /><br /></td>
            </tr>
        </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22">&nbsp;</td>
            </tr>
          </table>
          <table width="85%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22"><img src="${ctx}/images/fabu.jpg" border="0" width="250" height="83" /></td>
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
                  <td width="73%" align="left"><img src="${ctx}/images/rzsj2.jpg" width="257" height="26" /></td>
                  <td width="2%" align="left"><img src="${ctx}/images/h.jpg" width="10" height="9" /></td>
                  <td width="25%" align="left" class="title_links">融资方案设计<img src="${ctx}/images/3j.jpg" width="9" height="9" />融资方案设计</td>
                </tr>
              </table>
              <table width="98" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="${ctx}/images/ge1.jpg" width="690" height="24" /></td>
                </tr>
              </table>
              <table width="600" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="30" align="left" class="title"><img src="${ctx}/images/rzsj3.jpg" width="304" height="146" /><br /></td>
                </tr>
                </table>
              <table width="98" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="${ctx}/images/ge1.jpg" width="690" height="24" /></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="73%" align="left"><img src="${ctx}/images/rzsj4.jpg" width="254" height="26" /></td>
                  <td width="2%" align="left">&nbsp;</td>
                  <td width="25%" align="left" class="title_links">&nbsp;</td>
                </tr>
            </table>
              <table width="98" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="${ctx}/images/ge1.jpg" width="690" height="24" /></td>
                </tr>
            </table>
<c:forEach var="item" items="${list}">
              <table width="620" border="0" cellpadding="0" cellspacing="0" class="biankuang">
                <tr>
                  <td width="110" align="center"><img src="${item.pic}" width="82" height="121" /></td>
                  <td><table width="97%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" align="left" class="title">${item.name}</td>
                    </tr>
                  </table>
                    <table width="97%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="35" align="left" class="txt">${item.context}</td>
                      </tr>
                    </table>
                    <table width="97%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="35" align="left" class="txt2">金额：${item.amount}   年利率：${item.rate}   期限：${item.duration}    进度${item.progress}</td>
                      </tr>
                    </table>
                    <table width="95%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td align="left" class="title">经办律师：${item.layer}<br />
                          联系方式：${item.contact}</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <br />
</c:forEach>
              <p>&nbsp;</p>
              <table width="240" border="0" cellpadding="0" cellspacing="0" class="txt">
                <tr>
                  <td><c:if test="${pageNumber > 1}"><a href="?page=${pageNumber-1}"><img src="${ctx}/images/lift.jpg" width="18" height="13" /></a></c:if></td>
                  <td align="center"><span class="txt2"><a href="?page=${pageNumber}" class="txt2">${pageNumber}</a></span></td>
                  <td><c:if test="${pageNumber < pageTotal}"><a href="?page=${pageNumber+1}"><img src="${ctx}/images/right.jpg" width="18" height="13" /></a></c:if></td>
                </tr>
              </table>
              <p>&nbsp;</p></td>
          </tr>
        </table></td>
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
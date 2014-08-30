<%@page import="org.nutz.dao.Dao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="database.Connections"%>
<%@page import="java.util.List"%>
<%@page import="org.nutz.dao.Cnd"%>
<%@page import="org.nutz.dao.impl.NutDao"%>
<%@page import="model.Jrtj"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%
String pageStr = request.getParameter("page");
Integer pageNumber = pageStr==null?1:Integer.parseInt(pageStr);
int pageSize = 5;
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
int count = dao.count(Jrtj.class);
List<Jrtj> list = dao.query(Jrtj.class, Cnd.NEW().limit(dao.createPager(pageNumber, pageSize)).desc("id"));
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
              <td height="22"><img src="${ctx}/images/jrtj.jpg" width="251" height="140" /></td>
            </tr>
          </table>
          <table width="250" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22" align="center"><img src="${ctx}/images/weituo.jpg" width="170" height="84" /></td>
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
                  <td width="73%" align="left"><img src="${ctx}/images/jrtj1.jpg" width="264" height="26" /></td>
                  <td width="2%" align="left"><img src="${ctx}/images/h.jpg" width="10" height="9" /></td>
                  <td width="25%" align="left" class="title_links">金融产品推荐<img src="${ctx}/images/3j.jpg" width="9" height="9" />最新推荐</td>
                </tr>
              </table>
              <table width="98" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="${ctx}/images/ge1.jpg" width="690" height="24" /></td>
                </tr>
              </table>
              <table width="600" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="30" align="left" class="title"><br /></td>
                </tr>
                </table>
              <table width="98" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
<c:forEach var="item" items="${list}">
              <table width="530" border="0" cellpadding="0" cellspacing="0" class="biankuang">
                <tr>
                  <td width="125" align="center"><img src="${item.pic}" width="84" height="118" /></td>
                  <td align="left"><table width="380" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" align="left" class="title">${item.name}			代码：${item.code}</td>
                    </tr>
                  </table>
                    <table width="380" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="20" colspan="2" align="left" class="txt">单位净值（${item.iopvdate}）：${item.iopv}</td>
                      </tr>
                      <tr>
                        <td height="18" align="left" class="txt">类    型： ${item.type} </td>
                        <td height="18" align="left" class="txt">成 立 日：${item.startdate} </td>
                      </tr>
                      <tr>
                        <td height="20" align="left" class="txt">管 理 人： ${item.admin}</td>
                        <td height="20" align="left" class="txt">基金经理：${item.manager} </td>
                      </tr>
                      <tr>
                        <td height="20" align="left" class="txt">规    模：${item.scale} </td>
                        <td height="20" align="left" class="txt">评级：  ${item.grade}星 </td>
                      </tr>
                    </table>
                    <table width="380" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td align="left" class="title">经办律师：${item.layer} <br />
                          联系方式：${item.contact}</td>
                      </tr>
                    </table></td>
                </tr>
            </table>
              <br />
</c:forEach>
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
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
List<Period> periods = dao.query(Period.class, Cnd.where("status", "=", "1"));
pageContext.setAttribute("periods", periods);
List<GuaranteeCategory> guaranteeCategories = dao.query(GuaranteeCategory.class, Cnd.where("status", "=", "1"));
pageContext.setAttribute("guaranteeCategories", guaranteeCategories);
%>
<jsp:include page="../common/header.jsp" flush="true"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/bootstrap/css/bootstrap.min.css" />

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#AF190B"><table width="945" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="${ctx}/images/Banner02.jpg" width="943" height="271" /></td>
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
                  <td><a href="rztz.html"><img src="${ctx}/images/rztz2.jpg" border="0" width="182" height="48" /></a></td>
                </tr>
                <tr>
                  <td><a href="tzxx.html"><img src="${ctx}/images/rztz3.jpg"  border="0" width="182" height="48" /></a></td>
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
                  <td width="73%" align="left"><img src="${ctx}/images/wyrz.jpg" width="251" height="26" /></td>
                  <td width="2%" align="left"><img src="${ctx}/images/h.jpg" width="10" height="9" /></td>
                  <td width="25%" align="left" class="title_links">投融资项目 <img src="${ctx}/images/3j.jpg" width="9" height="9" />我要融资</td>
                </tr>
              </table>
              <table width="98" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="${ctx}/images/ge1.jpg" width="690" height="24" /></td>
                </tr>
              </table>
              <table width="600" border="0" cellpadding="0" cellspacing="0" class="txt">
                <tr>
                  <td align="center" valign="top"><p class="biaoti">&nbsp;</p></td>
                </tr>
              </table>
              <table width="600" border="0" cellpadding="0" cellspacing="0" class="txt">
                <tr>
                  <td align="center" valign="top"><p class="txtCopy">请将您的信息与需求发送至 <span class="biaoti">lvbangtz@163.com</span></p>
                    <p class="txtCopy">&nbsp;或拨打服务热线<span class="biaoti"> 0571 2895 5777</span></p>
                    <p class="txtCopy">我们将竭诚为您服务！谢谢！<br />
                    </p>
                    <p class="biaoti">&nbsp;</p></td>
                </tr>
              </table>
              <table width="600" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td>
                  
<form role="form" action="${ctx}/module/financing/reg" method="post" style="margin-top: 15px;">
  <div class="form-group">
    <label for="amount">融资金额（万元）</label>
    <input type="number" class="form-control" name="amount" id="amount" placeholder="请输入融资金额">
  </div>
  <div class="form-group">
    <label for="periodd">融资期限（月）</label>
    <select name="periodId" id="periodId" class="form-control">
      <c:forEach var="item" items="${periods}">
      <option value="${item.id}">${item.time}</option>
      </c:forEach>
    </select>
  </div>
  <div class="form-group">
    <label for="rate">年利率（%）</label>
    <input type="number" class="form-control" name="rate" id="rate" plaeholder="请输入年利率">
  </div>
  <div class="form-group">
    <label for="periodd">担保类型</label>
    <select name="guaranteeCategoryId" id="guaranteeCategoryId" class="form-control">
      <c:forEach var="item" items="${guaranteeCategories}">
      <option value="${item.id}">${item.name}</option>
      </c:forEach>
    </select>
  </div>
  <div class="form-group">
    <label for="name">姓名</label>
    <input type="text" class="form-control" name="name" id="name">
  </div>
  <div class="form-group">
    <label for="email">电子邮箱</label>
    <input type="email" class="form-control" name="email" id="email">
  </div>
  <div class="form-group">
    <label for="qq">QQ</label>
    <input type="number" class="form-control" name="qq" id="qq">
  </div>
  <div class="form-group">
    <label for="mobile">联系电话</label>
    <input type="number" class="form-control" name="mobile" id="mobile">
  </div>
  <div class="form-group">
    <label for="city">所在城市</label>
    <input type="text" class="form-control" name="city" id="city">
  </div>
  <div class="form-group">
    <label for="comment">项目说明</label>
    <textarea class="form-control" rows="3" name="comment" id="comment" maxlength="500"></textarea>
  </div>
  <button type="submit" class="btn btn-default">提交</button>
</form>
                  </td>
                </tr>
                </table>
              <p>&nbsp;</p>
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
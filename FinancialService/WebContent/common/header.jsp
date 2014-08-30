<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<title>浙江杭州律邦投资有限公司</title>
<style type="text/css">
body {
    margin-top: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
    margin-right: 0px;
}
.css {
    background-color: #FFF;
}
a:link {
    text-decoration: none;
}
a:visited {
    text-decoration: none;
    border-top-style: none;
    border-right-style: none;
    border-bottom-style: none;
    border-left-style: none;
    width: 0px;
    border-top-width: 0px;
    border-right-width: 0px;
    border-bottom-width: 0px;
    border-left-width: 0px;
}
a:hover {
    text-decoration: none;
    color: #999;
}
a:active {
    text-decoration: none;
}
a {
    font-family: Verdana, Geneva, sans-serif;
    color: #333;
}
</style>
<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
</head>

<body text="#333333" link="#999999" vlink="#999999" alink="#999999" onload="MM_preloadImages('${ctx}/images/an012.jpg','${ctx}/images/an022.jpg')">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="top">
  <tr>
    <td height="135"><table width="945" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="14" height="105">&nbsp;</td>
        <td width="322" valign="middle"><img src="${ctx}/images/logo.jpg" width="305" height="77" /></td>
        <td width="238">&nbsp;</td>
        <td width="480" align="right" valign="top"><table width="420" border="0" cellspacing="0" class="top2">
          <tr>
            <td height="110" valign="top"><table width="99%" border="0">
              <tr>
               <td height="35"><a href="${ctx}/public/index.jsp">首 页</a>&nbsp; 
               <% if(session.getAttribute("USERID")==null){ %>
               		|&nbsp; <a href="${ctx}/public/register.jsp">注 册</a>&nbsp; 
               		|&nbsp;<a href="${ctx}/public/login.jsp"> 登 录</a>&nbsp; 
               <%}else{ %>
               		<%-- |欢迎您，<a href="${ctx}/public/user_center.jsp"><%=session.getAttribute("USER_PHONE") %></a> --%>
               		|欢迎您，<%=session.getAttribute("USER_PHONE") %>&nbsp;<a href="${ctx}/public/user_center.jsp" >进入个人中心</a>
               <%} %>
               |&nbsp; 安全保障&nbsp; |&nbsp; 帮助中心&nbsp; 
               |&nbsp; <a href="#" onclick="javascript:window.external.addFavorite('http://www.lvbangtz.com','律邦投资有限公司')" title="加入收藏">加入收藏</a></td>
               
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="main_bg">
        <tr>
          <td align="center" valign="top"><table width="945" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="${ctx}/images/maina.jpg" width="31" height="46" /></td>
              <td><a href="${ctx}/public/fzgk.jsp"><img src="${ctx}/images/m1.jpg" border="0" width="135" height="46" id="Image3" onmouseover="MM_swapImage('Image3','','${ctx}/images/m1a.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
              <td><a href="${ctx}/public/rztz.jsp"><img src="${ctx}/images/m2.jpg" border="0" width="145" height="46" id="Image4" onmouseover="MM_swapImage('Image4','','${ctx}/images/m2a.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
              <td><a href="${ctx}/public/rzsj.jsp"><img src="${ctx}/images/m3.jpg" border="0" width="144" height="46" id="Image5" onmouseover="MM_swapImage('Image5','','${ctx}/images/m3a.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
              <td><a href="${ctx}/public/jrtj.jsp"><img src="${ctx}/images/m4.jpg" border="0" width="143" height="46" id="Image6" onmouseover="MM_swapImage('Image6','','${ctx}/images/m4a.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
              <td><a href="${ctx}/public/lssf.jsp"><img src="${ctx}/images/m5.jpg" border="0" width="109" height="46" id="Image7" onmouseover="MM_swapImage('Image7','','${ctx}/images/m5a.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
              <td><a href="${ctx}/public/cyjm.jsp"><img src="${ctx}/images/m6.jpg" border="0" width="113" height="46" id="Image8" onmouseover="MM_swapImage('Image8','','${ctx}/images/m6a.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
              <td><a href="${ctx}/public/about.jsp"><img src="${ctx}/images/m7.jpg" border="0" width="105" height="46" id="Image9" onmouseover="MM_swapImage('Image9','','${ctx}/images/m7a.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
              <td><img src="${ctx}/images/mainb.jpg" width="27" height="46" /></td>
            </tr>
            <tr>
              <td colspan="9">&nbsp;</td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%@page import="filter.AuthorityFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* AuthorityFilter authorityFilter = new AuthorityFilter(2);
if(!authorityFilter.check()) response.sendRedirect(request.getContextPath()+authorityFilter.getLoginPath()); */
%>
<%@ include file="../include/package.jsp"%>
<%@include file="../common/taglibs.jsp"%>
<%@ include file="../check/checkAdmin.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<link href="${ctx}/resource/jeasyui/themes/default/easyui.css" rel="stylesheet">
<link href="${ctx}/resource/jeasyui/themes/icon.css" rel="stylesheet">
<link href="${ctx}/css/admin.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${ctx}/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:70px;background:#B3DFDA;padding-left: 20px;">
    <h1>后台管理系统</h1>
</div>
<div data-options="region:'west',split:true,title:'管理功能'" style="width:150px;padding:10px;">
    <ul class="easyui-tree">
        <li iconCls="icon-base">
            <span>文章发布管理</span>
            <ul>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/article/index.jsp" target="main" >所有文章</a></li>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/article/add.jsp" target="main" >添加文章</a></li>    
            </ul>
        </li>
        <li iconCls="icon-base">
            <span>审核管理</span>
            <ul>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/admin/financing/index.jsp" target="main" >融资审核</a></li>
            </ul>
        </li>
        <li iconCls="icon-base">
            <span>律师说法</span>
            <ul>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/lawyer/index.jsp" target="main" >所有律师</a></li>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/lawyer/add.jsp" target="main" >添加律师</a></li>    
            </ul>
        </li>
        <li iconCls="icon-base">
            <span>金融产品推荐管理</span>
            <ul>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/jrtj/index.jsp" target="main" >所有金融产品</a></li>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/jrtj/add.jsp" target="main" >添加金融产品</a></li>    
            </ul>
        </li>
        <li iconCls="icon-base">
            <span>融资方案设计管理</span>
            <ul>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/rzsj/index.jsp" target="main" >所有融资方案设计</a></li>
                <li iconCls="icon-gears"><a class="e-link" href="${ctx}/rzsj/add.jsp" target="main" >添加融资方案设计</a></li>    
            </ul>
        </li>
        
    </ul>
</div>
<div data-options="region:'center',border:false" style="overflow: hidden;">
    <iframe name="main" id="main" src="${ctx}/welcome.html" style="width: 100%; height: 100%;" scrolling ="auto" frameborder="0" ></iframe>
</div>
</body>
</html>
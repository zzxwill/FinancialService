<%@page import="model.GuaranteeCategory"%>
<%@page import="java.util.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="org.nutz.dao.impl.*"%>
<%@page import="org.nutz.dao.*"%>
<%@page import="model.*"%>
<%@page import="database.Connections"%>
<%@page import="filter.AuthorityFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%@ include file="../check/checkAdminEx.jsp"%>
<%
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
Article article = dao.fetch(Article.class, Long.parseLong(request.getParameter("id")));
pageContext.setAttribute("article", article);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${ctx}/resource/jeasyui/themes/default/easyui.css" rel="stylesheet">
<link href="${ctx}/resource/jeasyui/themes/icon.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${ctx}/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8"
    src="${ctx}/resource/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
    src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
    src="${ctx}/resource/ueditor/lang/zh-cn/zh-cn.js"></script>
<title>添加文章</title>
</head>
<body>
<form id="ff" action="${ctx}/module/article/article_edit" method="post">
<input name="id" value="${article.id}" type="hidden"/>
<div>
	<label for="title">标题</label>
	<input name="title" value="${article.title}"/>
</div>
<div>
    <label for="level">优先级</label>
    <input name="level" type="number" value="${article.level}" />(大的靠前)
</div>
<div>
	<label for="text">内容</label>
	<script type="text/plain" id="textEditor" name="text">${article.text}</script>
</div>
<div>
    <a href="javascript:ff_submit();" class="easyui-linkbutton">提交</a>
    <a href="index.jsp" class="easyui-linkbutton">返回</a>
</div>
</form>
<script type="text/javascript">
    UE.getEditor('textEditor',{initialFrameHeight:500});
    function ff_submit(){
        $('#ff').form('submit', {
            success : function(data) {
                var obj = jQuery.parseJSON(data);
                $.messager.alert('提示', obj.message);
            }
        });
    }
</script>
</body>
</html>
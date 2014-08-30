<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/taglibs.jsp"%>
<%@ include file="../check/checkAdminEx.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章管理</title>
<link href="${ctx}/resource/jeasyui/themes/default/easyui.css" rel="stylesheet">
<link href="${ctx}/resource/jeasyui/themes/icon.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${ctx}/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
<table id="dg" title="文章管理" class="easyui-datagrid" url="${ctx}/module/article/article_list"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="title" width="50">标题</th>
            <th field="title" width="50">标题</th>
        </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="add.jsp" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
    <a href="javascript:editArticle()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
    <a href="javascript:destroyArticle()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
</div>
<script type="text/javascript">
function editArticle(){
	var row = $('#dg').datagrid('getSelected');
	if(row != null){
	    location.href = "edit.jsp?id="+row.id;
	}
}
function destroyArticle(){
	var row = $('#dg').datagrid('getSelected');
    if(row != null){
        $.get("${ctx}/module/article/article_delete",{id:row.id},function(data){
        	$.messager.alert('提示', data.message);
        	if(data.status == 0){
        		$('#dg').datagrid('reload');
        	}
        },'json');
    }
}
</script>
</body>
</html>
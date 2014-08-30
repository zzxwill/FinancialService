<%@page import="filter.AuthorityFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* AuthorityFilter authorityFilter = new AuthorityFilter(2);
if(!authorityFilter.check()) response.sendRedirect(request.getContextPath()+authorityFilter.getLoginPath()); */
%>
<%@ include file="../../include/package.jsp"%>
<%@include file="../../common/taglibs.jsp"%>
<%@ include file="../../check/checkAdmin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>融资管理</title>
<link href="${ctx}/resource/jeasyui/themes/default/easyui.css" rel="stylesheet">
<link href="${ctx}/resource/jeasyui/themes/icon.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${ctx}/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
<table id="dg" title="融资管理" class="easyui-datagrid" url="${ctx}/module/financing/financing_list"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="name" width="50">名称</th>
            <th field="status" formatter="statusformatter" width="50">状态</th>
            <th field="id" formatter="detailformatter" width="50">详情</th>
        </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:unAudit()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">未审核条目</a>
    <a href="javascript:auditFinancing()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">审核</a>
    <a href="javascript:destroyFinancing()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
</div>
<script type="text/javascript">
function unAudit(){
	$('#dg').datagrid('reload', {
		status: 0
	});
}
function destroyFinancing(){
	var row = $('#dg').datagrid('getSelected');
    if(row != null){
        $.get("${ctx}/module/financing/financing_delete",{id:row.id},function(data){
        	$.messager.alert('提示', data.message);
        	if(data.status == 0){
        		$('#dg').datagrid('reload');
        	}
        },'json');
    }
}
function auditFinancing(){
    var row = $('#dg').datagrid('getSelected');
    if(row != null){
        $.get("${ctx}/module/financing/financing_audit",{id:row.id},function(data){
            $.messager.alert('提示', data.message);
            if(data.status == 0){
                $('#dg').datagrid('reload');
            }
        },'json');
    }
}
function statusformatter(value,row,index){
	return value == 0 ? '未审核' : '审核';
}
function detailformatter(value,row,index){
    return '<a href="${ctx}/public/rzdetail.jsp?id='+value+'" target="_blank">详情</a>';
}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/taglibs.jsp"%>
<%@ include file="../check/checkAdminEx.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
<link href="${ctx}/resource/jeasyui/themes/default/easyui.css" rel="stylesheet">
<link href="${ctx}/resource/jeasyui/themes/icon.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${ctx}/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/jeasyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
<table id="dg" title="用户管理" class="easyui-datagrid" url="${ctx}/module/user/user_list"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="phone" width="120">电话</th>
            <th field="createDate" width="50">创建时间</th>
          <!--   <th field="updateDate" width="50">更新时间</th> -->
           <!--  <th field="updateDate" width="50">更新时间</th> -->
        </tr>
    </thead>
</table>
<div id="toolbar">
 <!--    <a href="add.jsp" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
    <a href="javascript:edit()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
    <a href="javascript:destroy()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a> -->
</div>
<script type="text/javascript">
function edit(){
	var row = $('#dg').datagrid('getSelected');
	if(row != null){
	    location.href = "edit.jsp?id="+row.id;
	}
}
function destroy(){
	var row = $('#dg').datagrid('getSelected');
    if(row != null){
        $.get("${ctx}/module/jrtj/jrtj_delete",{id:row.id},function(data){
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
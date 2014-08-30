<%@page import="database.Connections"%>
<%@page import="org.nutz.dao.impl.NutDao"%>
<%@page import="org.nutz.dao.Dao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="model.Rzsj"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
Rzsj item = dao.fetch(Rzsj.class, Long.parseLong(request.getParameter("id")));
pageContext.setAttribute("item", item);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改融资方案设计</title>
<link href="${ctx}/resource/jeasyui/themes/default/easyui.css"
    rel="stylesheet">
<link href="${ctx}/resource/jeasyui/themes/icon.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
    src="${ctx}/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8"
    src="${ctx}/resource/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8"
    src="${ctx}/resource/jeasyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<form id="ff" action="${ctx}/module/rzsj/rzsj_edit" method="post" enctype="multipart/form-data">
	<input name="id" value="${item.id}" type="hidden"/>
		<div>
			<label for="name">名称</label> <input name="name" type="text" value="${item.name}" />
		</div>
		<div>
            <label for="picfile">封面</label> <input name="picfile" type="file" />
            <img alt="没有图片" src="${item.pic}">
        </div>
		<div>
            <label for="context">内容</label>
        </div>
        <div>
            <textarea rows="5" name="context">${item.context}</textarea>
        </div>
        <div>
            <label for="amount">金额</label> <input name="amount" type="text" value="${item.amount}" />
        </div>
        <div>
            <label for="rate">年利率</label> <input name="rate" type="text" value="${item.rate}" />
        </div>
        <div>
            <label for="duration">期限</label> <input name="duration" type="text" value="${item.duration}" />
        </div>
        <div>
            <label for="progress">进度</label> <input name="progress" type="text" value="${item.progress}" />
        </div>
        <div>
            <label for="layer">经办律师</label> <input name="layer" type="text" value="${item.layer}" />
        </div>
        <div>
            <label for="contact">联系方式</label> <input name="contact" type="text" value="${item.contact}" />
        </div>
		<div>
			<a href="javascript:ff_submit();" class="easyui-linkbutton">提交</a>
			<a href="index.jsp" class="easyui-linkbutton">返回</a>
		</div>
	</form>
	<script type="text/javascript">
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
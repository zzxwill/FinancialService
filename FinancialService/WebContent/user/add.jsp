<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加金融产品推荐</title>
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
	<form id="ff" action="${ctx}/module/jrtj/jrtj_add" method="post" enctype="multipart/form-data">
		<div>
			<label for="name">名称</label> <input name="name" type="text" />
		</div>
		<div>
            <label for="picfile">封面</label> <input name="picfile" type="file" />
        </div>
		<div>
            <label for="code">代码</label> <input name="code" type="text" />
        </div>
		<div>
            <label for="iopv">单位净值</label> <input name="iopv" type="text" />
        </div>
        <div>
            <label for="iopvdate">单位净值日期</label> <input name="iopvdate" type="text" />
        </div>
        <div>
            <label for="type">类 型</label> <input name="type" type="text" />
        </div>
        <div>
            <label for="startdate">成立日</label> <input name="startdate" type="text" />
        </div>
        <div>
            <label for="admin">管 理 人</label> <input name="admin" type="text" />
        </div>
        <div>
            <label for="manager">基金经理</label> <input name="manager" type="text" />
        </div>
        <div>
            <label for="scale">规 模</label> <input name="scale" type="text" />
        </div>
        <div>
            <label for="grade">评级</label> <input name="grade" type="number" />
        </div>
        <div>
            <label for="layer">经办律师</label> <input name="layer" type="text" />
        </div>
        <div>
            <label for="contact">联系方式</label> <input name="contact" type="text" />
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
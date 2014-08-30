<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%@ include file="../check/checkAdminEx.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${ctx}/resource/jeasyui/themes/default/easyui.css"
	rel="stylesheet">
<link href="${ctx}/resource/jeasyui/themes/icon.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="${ctx}/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/resource/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/resource/jeasyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/resource/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/resource/ueditor/lang/zh-cn/zh-cn.js"></script>
<title>添加文章</title>
</head>
<body>
	<form id="ff" action="${ctx}/module/article/article_add" method="post">
		<div>
			<label for="title">标题</label> <input name="title" type="text" />
		</div>
		<div>
            <label for="level">优先级</label> <input name="level" type="number" />(大的靠前)
        </div>
		<div>
			<label for="text">内容</label>
			<script type="text/plain" id="textEditor" name="text"
				style="height: 500px;"></script>
		</div>
		<div>
			<a href="javascript:ff_submit();" class="easyui-linkbutton">提交</a>
			<a href="index.jsp" class="easyui-linkbutton">返回</a>
		</div>
	</form>
	<script type="text/javascript">
		UE.getEditor('textEditor');
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%-- <%@ include file="../check/checkAdminEx.jsp"%> --%>
<%@ include file="../include/package.jsp"%>
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
<script src="${ctx}/js/ask.js"></script>

<title>添加律师说法</title>
</head>
<body>
	<form id="add_lawyer_form" action="${ctx}/lawyer/submit_add_lawyer.jsp" method="post" encType="multipart/form-data">
	 <fieldset data-role="fieldcontain">
		<div>
			<label for="name">姓名</label> <input name="name" type="text" />
		</div>
		<div>
            <label for="title">职称</label> <input name="title" type="text" />
        </div>
		<div>
			<label for="description">描述</label>
			<textarea name="description"></textarea>
		</div>
		<div>
			<table width="100%">
		<tr>
			<td width="50%" align="center"><div style="width:95%" id="ASKSelect" onclick="UploadPhoto();">上传照片</div></td>
		<!-- 	<td width="50%" align="center"><div  style="width:95%" id="ASKSelect" onclick="SelectKeShi();">选择科室</div></td> -->
		</tr>
	</table>
		</div>
		
		<div id="UploadPhoto" class="UploadPhoto" >
		<div><big>上传照片</big></div><br>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
			<td></td>
<!--				<td align="center" width="100%"> <div id="ASKPhoto">拍&nbsp;&nbsp;照</div></td>-->
			</tr>
<!--			<tr><td><hr></td></tr>-->
			<tr>
				<td align="center" width="100%">			
				
<!--				<input type="file" id="uploadImage" name="uploadImage" onchange="checkImg();"  value="从相册中选择"/>-->
				<div id="ASKPhoto" style="position:relative;">选择
					<input style="position:absolute;left:0;top:-35;width:100%;height:100%;opacity:0;" type="file" id="uploadImage" name="uploadImage" onchange="checkImg();" />
				</div>

				</td>
			</tr>
			<%-- <tr><td><hr color="<%=sysFontColor %>"></td></tr> --%>
			<tr>
				<td align="center">
					<div id="msgImg"></div>
					<div id="UploadPhotoCancel" onclick="UploadPhotoCancel()">取&nbsp;&nbsp;消</div>
				</td>
			</tr>
		</table>
	</div>
	
		
		
		<div>
			<a href="javascript:ff_submit();" class="easyui-linkbutton">提交</a>
			<a href="index.jsp" class="easyui-linkbutton">返回</a>
		</div>
		</fieldset>
	</form>
	<script type="text/javascript">
		UE.getEditor('textEditor');
		function ff_submit(){
	        /* $('#ff').form('submit', {
	            success : function(data) {
	                var obj = jQuery.parseJSON(data);
	                $.messager.alert('提示', obj.message);
	            }
	        }); */
	        var add_lawyer_form = document.getElementById("add_lawyer_form");
			add_lawyer_form.submit(); 
		
		}
	</script>
</body>
</html>
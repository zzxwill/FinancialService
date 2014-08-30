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
<%-- <%@ include file="../check/checkAdminEx.jsp"%> --%>

<%-- <%@ include file="../include/package.jsp"%>  --%>

<%

/* AuthorityFilter authorityFilter = new AuthorityFilter(2);
if(!authorityFilter.check()) response.sendRedirect(request.getContextPath()+authorityFilter.getLoginPath()); */

DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
Lawyer lawyer = dao.fetch(Lawyer.class, Long.parseLong(request.getParameter("id")));
pageContext.setAttribute("lawyer", lawyer);

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
<script src="${ctx}/js/ask.js"></script>
<title>修改律师说法</title>
</head>
<body>
	<form id="edit_lawyer_form" action="submit_edit_lawyer.jsp" method="post" encType="multipart/form-data">



	 <fieldset data-role="fieldcontain">
	 
	 <input name="id" value="${lawyer.id}" type="hidden"/>
	
		<div>
			<label for="name">姓名</label> <input name="name" type="text" value= "${lawyer.name}"/>
		</div>
		<div>
            <label for="title">职称</label> <input name="title" type="text" value= "${lawyer.title}"/>
        </div>
		<div>
			<label for="description">描述</label>
			<textarea name="description" ><%=lawyer.getDescription()%></textarea>
		</div>
		<div>
			

		<label for="description">头像</label>
			<!-- <td width="50%" align="center"><div style="width:95%" id="ASKSelect" onclick="UploadPhoto();">头像</div></td> -->
			<input name="picfile" type="hidden" value="${lawyer.figure_path}" readonly="readonly"/>
            <img alt="没有图片" src="../upload/${lawyer.figure_path}" height="50px" width="50px"> 
            <div style="width:95%" id="ASKSelect" onclick="UploadPhoto();">重新上传</div>
           
		<!-- 	<td width="50%" align="center"><div  style="width:95%" id="ASKSelect" onclick="SelectKeShi();">选择科室</div></td> -->

		</div>
		
		<div id="UploadPhoto" class="UploadPhoto" >
		<!-- <div><big>上传照片</big></div><br> -->
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
	        var add_lawyer_form = document.getElementById("edit_lawyer_form");
			add_lawyer_form.submit(); 
		
		}
	</script>
</body>
</html>
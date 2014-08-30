 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="java.sql.Timestamp"%>
<%@include file="../common/taglibs.jsp"%>

<%
	
	SmartUpload su = new SmartUpload();
	su.initialize(pageContext);//上传初始化

	// 设定上传限制
	long MAXFILE = 5*1024*1024;
	su.setMaxFileSize(MAXFILE);
	//限制总上传数据的长度。
	su.setTotalMaxFileSize(2*MAXFILE);
	//设定允许上传的文件（通过扩展名限制）
	su.setAllowedFilesList("JPG,jpg,JPEG,jpeg,GIF,gif,BMP,bmp,PNG,png,,");
	
	boolean sign = true;
	String filename = null;

	//设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
	try {
		su.setDeniedFilesList("exe,bat,jsp,htm,html");
			
		//上传文件
		su.upload();
		//String Name = su.getRequest().getParameter("Name");
		com.jspsmart.upload.File myFile = su.getFiles().getFile(0);  
		String fileFullName  = myFile.getFileName();

		String ext = myFile.getFileExt();
		int file_size =myFile.getSize();
		
		//if((file_size>MAXFILE)||(null==ext)||ext.equals("")){
		if((file_size>MAXFILE)){
			//System.out.println("file_size:" + file_size +"\n");
		%>
			<script>
				alert('上传失败！文件大小:' +file_size/1024+'K超出了限定范围!\n\r最大为'+ MAXFILE/1024+'K');
				window.location="index.jsp";
			</script>
		<%
		}else if(file_size>0){

			Timestamp ts = new Timestamp(System.currentTimeMillis());
			filename = String.valueOf(ts.getTime());
			
			 //String ImageUrl = "E:\\code\\web-java\\file\\" ;
			 //String ImageUrl = "/usr/local/software/apache-tomcat-8.0.8/webapps/KYTPic/IllnessDes/" ;
			 //String ImageUrl = "C:\\Users\\IBM_ADMIN\\git\\git_repository\\FinancialService\\WebContent\\upload\\";
			 String ImageUrl = "upload/";
			 if((null==ext)||ext.equals("")){
				ImageUrl += filename; //保存路径  
				//filename = filename;
			 }else{
				 ImageUrl += filename + "." + ext; //保存路径  
				 filename = filename + "." + ext;
			 }

			//System.out.println("ImageUrl:" + ImageUrl +"\n");
			//将上传文件保存到指定目录
			myFile.saveAs(ImageUrl);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		sign = false;
	}
	
	if(sign==true)
	{
		System.out.println("上传成功\n");
		//out.println("<script>parent.callback('上传成功')</script>");
	}else
	{
		System.out.println("上传失败\n");
		//out.println("<script>parent.callback('上传失败')</script>");
	}
%>

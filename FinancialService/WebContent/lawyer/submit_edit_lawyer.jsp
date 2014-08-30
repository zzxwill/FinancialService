<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
</style>

</head>
  
     <%@ include file="../check/index.jsp"%> 
  <% //String weixinID = "oDK3oji70nN1CG77qYR_z_thFUBs"; 
  //oDK3oji70nN1CG77qYR_z_thFUBs
  //gh_f5c1c22104b0

	request.setCharacterEncoding("UTF-8");
 	String url = "../main.jsp";

	/* if(USERROLE==0){ //患者 */

  %>
  
 <body>
  <div data-role="page">
	<div data-role="header">
	
	<table width="100%">
		<tr>
			<td width="33%" align="center">
				<div id="backButton" style="width:60px;" onclick="closeWin();">
					<a href="javascrpt:closeWin();"></a>
				</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">提问成功</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">


<script>

</script>
	<%@ include file="upload.jsp"%> 
	<%
	 request.setCharacterEncoding("utf-8");
	 	int id = Integer.parseInt(su.getRequest().getParameter("id"));
	 	
	 	
	 	
		String name = su.getRequest().getParameter("name");
  		String title = su.getRequest().getParameter("title");
  		String description = su.getRequest().getParameter("description");
		//UserDaoPatient userDaoPatient = new UserDaoPatient();
		if(null==name||name.equals("")||null==title||title.equals("")||
				null==description||description.equals("")){
			//System.out.println("setup-null\n");
			%>
			
			<div style="color: red">
										<big>信息未填写完整，请重新填写，谢谢！
										</big>
									</div>
									
			
			<script language='javascript' type='text/javascript'>
					window.location = "<%=url %>";
			</script>
			<%	
	  	}else{

	  		String picture_path = null;
	  		
	  		
	  		
	  		if(sign==true){
	  			picture_path = filename;
	  		}/* else{
	  			picture_path = null;
	  		} */
	  		//System.out.println("picture_path:" + picture_path + "\n");
	  		
	  		/* String QuestionText = su.getRequest().getParameter("QuestionText");
	  		String ASKTel = su.getRequest().getParameter("ASKTel");
	  		int ASKGender_int = 0;
	  		ASKGender_int = Integer.parseInt(ASKGender);

	  		int ASKKeShi_int = Integer.parseInt(ASKKeShi);
	  		int ASKAge_int = Integer.parseInt(ASKAge); */
	  		
	  		HashMap hm = new HashMap();
	  		
	  		/* name = java.net.URLEncoder.encode(name,"UTF-8");
	  		name = java.net.URLEncoder.encode(name,"UTF-8"); */
	  		
	  		name = new String(name.getBytes(), "UTF-8");
	  		title = new String(title.getBytes(), "UTF-8");
	  		description = new String(description.getBytes(), "UTF-8");
	  		if(picture_path!=null){
	  			picture_path = new String(picture_path.getBytes(), "UTF-8");
	  			hm.put("figure_path", picture_path);
	  		}
	  		hm.put("id", id);
	  		
	  		hm.put("name", name);
	  		hm.put("title", title);
	  		hm.put("description", description);
	  		
	  		
	  		
	  		LawyerDao lawyer_dao = new LawyerDao();
	  		lawyer_dao.submit_update_lawyer_info(hm);
	  		
	  	%>
	  	<br><br>
	  <%-- 	<div>您所关心的问题是：</div><br>
	  	<div style="color:<%=sysFontColor %>"><%=QuestionText %></div><br> --%>
	  	<%
	  	if((null==picture_path)||(picture_path.equals(""))){
	  		;
	  	}else{
	  		%>
	  		<center>
	  		<img src="<%=P_IMAGES %><%=picture_path %>" border = "0px" width="50%"/>
	  		</center>
	  		<%
	  	}
	  	%>
	  	<br>
	  	<div>律师说法信息更新成功！</div><br>
	  	
	  	<%
	  	}
		
	%>
	</center>
	
	<%/* }else if(USERROLE==1){ //医生

		request.setCharacterEncoding("UTF-8");
		String qID = request.getParameter("qID"); */
	
	%>
	

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>
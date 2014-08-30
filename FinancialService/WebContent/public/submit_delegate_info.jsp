<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
   <%-- <%@ include file="../check/index.jsp"%>  --%>
<style type="text/css">
</style>


</head>

<body>



	<div data-role="page">


		<div data-role="content">
			

				<%
				
				if(session.getAttribute("USERID")==null){
					String url = "login.jsp";
					%>
					<div style="color: red">
										<big>您还未登录，请登录后操作，谢谢。正在跳转到登陆页面
										</big>
									</div>
									<script language='javascript' type='text/javascript'>
								setTimeout(" window.location = '<%=url %>' ",500);
									</script>
					
					<%
					return;
				}
				
				
    
     request.setCharacterEncoding("utf-8");
	
	 String mobile = request.getParameter("mobile");
	 String name = request.getParameter("name");
	 String email = request.getParameter("email");
	
	 String content = request.getParameter("comment");
	 


	 
	 
	 if(name == null || mobile==null ||email == null ||
			 content==null ){
		 
	%>
	<center>
			<div style="color:red"><big>提交错误！
				<br>正在返回主页，请稍后...</big>
			</div>
			</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = 'index.jsp' ",2000);
			</script>	 
		 	 
	<%	 
	 }else {
		 
	
	 
	 
		/*  site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
	 site_name = java.net.URLDecoder.decode(site_name,"UTF-8"); */
	 
	  name = java.net.URLEncoder.encode(name,"UTF-8");
	 name = java.net.URLEncoder.encode(name,"UTF-8");
	 content = java.net.URLEncoder.encode(content,"UTF-8");
	 content = java.net.URLEncoder.encode(content,"UTF-8"); 
	 

	 
		HashMap hm = new HashMap();
	
		hm.put("mobile",mobile );
		hm.put("name", name);
		hm.put("email",email );
	
		hm.put("content", content);
		hm.put("user_id", session.getAttribute("USERID").toString());
		
		
	
		DelegateDao delegate_dao = new DelegateDao();
		delegate_dao.submit_delegate_info(hm);
	// dao.submit_reservation_xuetang(hm);
	 
	 
	 
	 //发送成功预约的短信	

		
    %>
			
				<br>
		

				
			<% 
	
				String url= "invest_list.jsp" ;
				
			%>
				<center>
			<div style="color:red"><big>提交成功！
				<br>正在返回投资列表页面，请稍后...</big>
			</div>
			</center>

			 <script language='javascript' type='text/javascript'>
				 window.location.href = "<%=url%>";
				// window.opener.parent.document.location.reload();
                // window.close();
			</script>
		<%} %>		
		

		<div data-role="footer" data-id="myfooter" data-position="fixed">
		</div>

	</div>
	
	

</body>
</html>
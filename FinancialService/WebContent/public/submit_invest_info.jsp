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
	 String amount_str = request.getParameter("amount");
	 String period_id_str = request.getParameter("period_id");
	 String expect_rate_str = request.getParameter("expect_rate");
	 String guarantee_category_id_str = request.getParameter("guarantee_category");
	 String mobile = request.getParameter("mobile");
	 String name = request.getParameter("name");
	 String email = request.getParameter("email");
	 String qq = request.getParameter("qq");
	 String city = request.getParameter("cityid");
	 String comment = request.getParameter("comment");
	 


	 
	 
	 if(amount_str == null || period_id_str==null ||expect_rate_str == null ||
			 guarantee_category_id_str==null || mobile == null || city == null ){
		 
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
		 
		/*  String  = request.getParameter("amount");
		 String  = request.getParameter("period");
		 String  = request.getParameter("expect_rate");
		 String  = request.getParameter("guarantee_category");
		 String mobile = request.getParameter("mobile");
		 String  = request.getParameter("name");
		 String  = request.getParameter("email");
		 String  = request.getParameter("qq");
		 String  = request.getParameter("cityid");
		 String  = request.getParameter("comment"); */

	 
					//String  site= request.getParameter("site");
	 int amount = Integer.parseInt(amount_str);
	 int period_id = Integer.parseInt(period_id_str);
	 int expect_rate = Integer.parseInt(expect_rate_str);
	 int guarantee_category_id = Integer.parseInt(guarantee_category_id_str);
	 
	 
		/*  site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
	 site_name = java.net.URLDecoder.decode(site_name,"UTF-8"); */
	 
	/*  name = java.net.URLEncoder.encode(name,"UTF-8");
	 name = java.net.URLEncoder.encode(name,"UTF-8");
	 comment = java.net.URLEncoder.encode(comment,"UTF-8");
	 comment = java.net.URLEncoder.encode(comment,"UTF-8"); */
	 

	 
		HashMap hm = new HashMap();
		hm.put("amount", amount);
		hm.put("period_id",period_id );
		hm.put("expect_rate", expect_rate);
		hm.put("guarantee_category_id",guarantee_category_id );
		hm.put("mobile",mobile );
		hm.put("name", name);
		hm.put("email",email );
		hm.put("qq", qq);
		hm.put("city", city);
		hm.put("comment", comment);
		hm.put("user_id", session.getAttribute("USERID").toString());
		
		
	
		InvestDao invest_dao = new InvestDao();
		invest_dao.submit_invest_info(hm);
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page import="dao.*"%>

<%-- <%@ include file="../common/header.html"%> --%>
<jsp:include page="../common/header.jsp" flush="true" />

<link href="../css/invest/common.css" rel="stylesheet" type="text/css">
<style type="text/css">
.helplay {
	z-index: 3;
	position: absolute;
	padding: 0px;
	background-color: #FFFFFF;
	text-align: left;
	color: #9C7600;
	width: 300px;
	font-size: 15px;
	font-family: arial, sans-serif;
}
</style>
<script type="text/javascript" src="../js/invest/settab.js"></script>
<script type="text/javascript" src="../js/invest/gundong.js"></script>
<script type="text/javascript" src="../js/invest/WdatePicker.js"></script>
<link href="../css/invest/WdatePicker.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">

  var dkje , nx ,yxq ,sjhm ,button ,dkxxAction,cityid;
  var partten = /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|18[1-9]\d{8}$/;

//初始化参数
  function initParam(){
	  dkje = document.getElementById("dkje");
	  nx = document.getElementById("nx");
	  yxq = document.getElementById("yxq");
	  sjhm = document.getElementById("sjhm");
	  button = document.getElementById("button");
	  dkxxAction = document.getElementById("dkxxAction");
	  cityid = document.getElementById("cityid");
  }
    

  //登录
  function toSubmit(){
	  initParam();
	  if(dkje.value==""){
		  alert("请输入投资金额！");
		  dkje.focus();
		  return false ;
	  }else if(sjhm.value==""){
		  alert("请输入手机号码！");
		  sjhm.focus();
		  return false ;
	  }else if(!partten.test(sjhm.value)){
		  alert("你输入的手机号码有误，请重新输入！");
		  sjhm.value = "" ;
		  sjhm.focus();
		  return false ;
	  }else if(nx.value==""){
		  alert("请输入期望年利率！");
		  nx.focus();
		  return false ;
	  }else if(cityid.value==""){
		  alert("请选择所在城市！");
		  return false ;
	  }else{
		  button.disabled = "true" ;
		  dkxxAction.submit();
	  }
	 
  }

  var citykey = [["14301","长沙市"],["14303","株洲市"],["14304","湘潭市"],["14305","常德市"],["14306","衡阳市"],["14307","岳阳市"],["14308","邵阳市"],["14309","益阳市"],["14302","娄底市"],["143010","怀化市"],["143011","郴州市"],["143012","永州市"],["143013","张家界"],["143014","湘西自治州"]] ;


  function onSelectCity(){
      document.getElementById("cityDiv").style.display = "";
  }

  function onSelect(id){
	  initParam();
      var showCity =  document.getElementById("showCity") ;
      for(var i=0;i<citykey.length;i++){
  	    if(citykey[i][0]==id){
  	    	//cityid.value = id ;
  	    	/*直接去城市的名称  Will Zhou  7/13/2014*/
  	    	cityid.value=citykey[i][1];
  		    showCity.innerHTML = "你选择的城市："+citykey[i][1];
  		    document.getElementById("cityDiv").style.display = "none";
  		}
  	}
  }

</script>
<style id="clearly_highlighting_css" type="text/css">/* selection */
html.clearly_highlighting_enabled ::-moz-selection {
	background: rgba(246, 238, 150, 0.99);
}

html.clearly_highlighting_enabled ::selection {
	background: rgba(246, 238, 150, 0.99);
} /* cursor */
html.clearly_highlighting_enabled {
	/* cursor and hot-spot position -- requires a default cursor, after the URL one */
	cursor:
		url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--cursor.png")
		14 16, text;
} /* highlight tag */
em.clearly_highlight_element {
	font-style: inherit !important;
	font-weight: inherit !important;
	background-image:
		url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--yellow.png");
	background-repeat: repeat-x;
	background-position: top left;
	background-size: 100% 100%;
} /* the delete-buttons are positioned relative to this */
em.clearly_highlight_element.clearly_highlight_first {
	position: relative;
} /* delete buttons */
em.clearly_highlight_element a.clearly_highlight_delete_element {
	display: none;
	cursor: pointer;
	padding: 0;
	margin: 0;
	line-height: 0;
	position: absolute;
	width: 34px;
	height: 34px;
	left: -17px;
	top: -17px;
	background-image:
		url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--delete-sprite.png");
	background-repeat: no-repeat;
	background-position: 0px 0px;
}

em.clearly_highlight_element a.clearly_highlight_delete_element:hover {
	background-position: -34px 0px;
} /* retina */
@media ( min--moz-device-pixel-ratio : 2) , ( -webkit-min-device-pixel-ratio : 2)
		, ( min-device-pixel-ratio : 2) {
	em.clearly_highlight_element {
		background-image:
			url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--yellow@2x.png");
	}
	em.clearly_highlight_element a.clearly_highlight_delete_element {
		background-image:
			url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--delete-sprite@2x.png");
		background-size: 68px 34px;
	}
}
</style>
<style>
[touch-action="none"] {
	-ms-touch-action: none;
	touch-action: none;
}

[touch-action="pan-x"] {
	-ms-touch-action: pan-x;
	touch-action: pan-x;
}

[touch-action="pan-y"] {
	-ms-touch-action: pan-y;
	touch-action: pan-y;
}

[touch-action="scroll"],[touch-action="pan-x pan-y"],[touch-action="pan-y pan-x"]
	{
	-ms-touch-action: pan-x pan-y;
	touch-action: pan-x pan-y;
}
</style>
</head>
<body>

	<!-- <div class="banner_t index_banner_top">
		<div class="wp" id="main0"></div>
	</div> -->

	<div class="content about">
	<!-- 	<div class="a_banner"></div> -->
		<div class="about_body">
			<div>
				<form id="dkxxAction" name="dkxxAction"
					action="submit_invest_info.jsp" method="post">
					<input type="hidden" name="orderNum"  id="orderNum">
					<div class="reg2">
						<br> <br>
						<table class="xxx" border="0" cellpadding="0" cellspacing="0"
							align="center">
							<tbody>
								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">投资金额&nbsp;<span class="xx">*</span></td>
									<td width="30%"><input type="text" name="amount" 
										id="amount" style="width: 200px; margin-right: 8px;">万元
									</td>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">投资期限&nbsp;<span class="xx">*</span></td>
									<td width="30%"><select name="period_id" id="period_id">
											<%
												InvestDao invest_dao = new InvestDao();
												invest_dao.retrive_period();
												for (int i = 0; i < invest_dao.period_id.size(); i++) {
											%>

											<option value="<%=invest_dao.period_id.get(i)%>"><%=invest_dao.period_time.get(i)%>个月
											</option>

											<%
												}
											%>



									</select></td>
								</tr>
								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">期望年利率&nbsp;<span class="xx">*</span></td>
									<td width="30%"><input type="text" name="expect_rate"
										 id="expect_rate"
										style="width: 200px; margin-right: 8px;">%</td>

									<td class="t" align="right" width="20%" valign="middle"
										height="50">担保类别&nbsp;<span class="xx">*</span></td>
									<td width="30%"><select name="guarantee_category"
										id="guarantee_category">
											<%
												//InvestDao invest_dao = new InvestDao();
												invest_dao.retrive_guarantee_category();
												for (int i = 0; i < invest_dao.guarantee_category_id.size(); i++) {
											%>

											<option value="<%=invest_dao.guarantee_category_id.get(i)%>"><%=invest_dao.guarantee_category_name.get(i)%></option>
											<%
												}
											%>
									</select></td>
								</tr>
								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">手机号码&nbsp;<span class="xx">*</span></td>
									<td width="30%"><input type="text" name="mobile" 
										id="mobile"></td>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">姓名&nbsp;</td>
									<td width="30%"><input type="text" name="name" 
										id="name"></td>
								</tr>
								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">EMAIL&nbsp;</td>
									<td width="30%"><input type="text" name="email" 
										id="email"></td>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">QQ号码&nbsp;</td>
									<td width="30%"><input type="text" name="qq" 
										id="qq"></td>
								</tr>

								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">所在城市<!-- [<a style="cursor: hand"
										onclick="onSelectCity()">请选择</a>] -->&nbsp;<span class="xx">*</span></td>
									<td width="30%" colspan="3">
										<!-- <div id="selectDiv">
											<div id="showCity"></div>
										</div>
										<div style="display: none" id="cityDiv" class="helplay">
											<table class="xxx" border="0" cellpadding="0" cellspacing="0"
												width="100%">
												<tbody>
													<tr>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14301&#39;)">长沙市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14303&#39;)">株洲市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14304&#39;)">湘潭市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14305&#39;)">常德市</a></td>
													</tr>
													<tr>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14306&#39;)">衡阳市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14307&#39;)">岳阳市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14308&#39;)">邵阳市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14309&#39;)">益阳市</a></td>
													</tr>
													<tr>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;14302&#39;)">娄底市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;143010&#39;)">怀化市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;143011&#39;)">郴州市</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;143012&#39;)">永州市</a></td>
													</tr>

													<tr>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;143013&#39;)">张家界</a></td>
														<td><a style="cursor: hand"
															onclick="onSelect(&#39;143014&#39;)">湘西自治州</a></td>
														<td></td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>  --><input name="cityid"  id="cityid">

									</td>
								</tr>
								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">备注&nbsp;</td>
									<td width="30%" colspan="3"><textarea name="comment" cols="60"
											rows="5" id="comment"></textarea></td>
								</tr>
								<tr>
									<td align="center" valign="middle" colspan="4"><span
										class="xx"></span></td>
								</tr>
								<tr>
									<!-- <td style="text-align: center" valign="middle" height="50"
										colspan="4"><input type="button" value=" "
										onclick="return toSubmit();" id="button" name="button"
										class="btn_zc_ty"></td> -->
										<td style="text-align: center" valign="middle" height="50"
										colspan="4"><input type="submit" value=" "
										 id="button" name="button"
										class="btn_zc_ty"></td>
								</tr>
							</tbody>
						</table>
						<div class="xieyi_title">律邦投资管理民间金融服务平台信息发布规范</div>
						<div class="xieyi_txt">

							一、律邦投资管理民间金融服务平台禁止及限制发布的信息定义<br> <br>
							1、律邦投资管理民间金融服务平台用户信息发布提示<br> <br>

							<p>
								用户在发布投融资信息前，应当仔细阅读《律邦投资管理民间金融服务平台信息发布规范》，并予以遵守。由于发布下列信息所引起的法律责任由用户完全承担，与律邦投资管理民间金融服务平台无关。一旦发现用户发布任何违反本规范的信息，律邦投资管理民间金融服务平台有权立即予以删除，并保留警告、暂停服务，直至终止服务的权力，请各用户予以理解并自觉遵守。</p>
							<br> <br> 2、律邦投资管理民间金融服务平台禁止及限制发布的信息<br> <br>
							<p>1）涉及任何侵犯他人知识产权的信息；</p>

							<p>2）涉及任何形式的个人隐私或公司商业机密的信息；</p>

							<p>3）与民间投融资完全不相关的信息；</p>

							<p>4）违反国家相关法律法规政策的信息；</p>

							<p>5）其它经本网站认定不应或不宜发布的信息；</p>

							<br> 二、律邦投资管理民间金融服务平台用户信息审核发布规则<br> <br>

							<p>1、用户应确保发布的信息真实合法有效；</p>

							<p>2、用户应确保发布的信息不重复。</p>
							<br>
						</div>
					</div>
				</form>




			</div>
		</div>
		<div class="cl"></div>
	</div>

	<script type="text/javascript">
	function showImg() {
		var o = document.getElementById("outerdiv");
		o.style.display = "block";
		o.onclick = function() {
			var imgdiv = document.getElementById("outerdiv");
			imgdiv.style.display = "none";
		};
	}
</script>

	<%-- <%@ include file="../common/footer.html"%>	 --%>
	<jsp:include page="../common/footer.jsp" flush="true" />
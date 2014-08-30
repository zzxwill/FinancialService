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
					action="submit_delegate_info.jsp" method="post">
					<input type="hidden" name="orderNum"  id="orderNum">
					<div class="reg2">
						<br> <br>
						<table class="xxx" border="0" cellpadding="0" cellspacing="0"
							align="center">
							<tbody>
								
								<tr>
								<td class="t" align="right" width="20%" valign="middle"
										height="50">姓名&nbsp;</td>
									<td width="30%"><input type="text" name="name" 
										id="name"></td>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">电话&nbsp;<span class="xx"></span></td>
									<td width="30%"><input type="text" name="mobile" 
										id="mobile"></td>
									
								</tr>
								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">EMAIL&nbsp;</td>
									<td width="30%"><input type="text" name="email" 
										id="email"></td>
									<td class="t" align="right" width="20%" valign="middle"
										height="50" colspan="2"></td>
									
								</tr>

							
								<tr>
									<td class="t" align="right" width="20%" valign="middle"
										height="50">需要委托的服务&nbsp;</td>
									<td width="30%" colspan="3"><textarea name="comment" cols="60"
											rows="5" id="content"></textarea></td>
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
										class="btn_submit"></td>
								</tr>
							</tbody>
						</table>
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
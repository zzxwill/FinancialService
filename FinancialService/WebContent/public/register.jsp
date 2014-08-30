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
<script type="text/javascript" src="../js/jquery.min.js"> </script>

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

var username,pawd,rpawd,yzm,cityid ;

var partten = /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|18[1-9]\d{8}$/;
  

//初始化参数
function initParam(){
	registerTel = document.getElementById("registerTel");
/* 	pawd = document.getElementById("pawd");
	rpawd = document.getElementById("rpawd");
	yzm = document.getElementById("yzm");
	cityid = document.getElementById("cityid"); */
}

//检查用户是否已经存在
function onCheck(){
	initParam();
	if(username.value!=""){
		jdKhxxService.findJdKhxxObjBySJHM(username.value,findJdKhxxObjBySJHM);
	}
}

//回调函数
function findJdKhxxObjBySJHM(obj){
	if(obj!=null){
	  alert("你输入的手机号码已经注册，请重新输入！")
	  username.value = "" ;
	  username.focus();
	}
}

//页面提交
function saveSubmit(){
	var return_flag = false;
	var  registerTel_obj = document.getElementById("registerTel");
	var registerTel = registerTel_obj.value;
	   var registerCode = document.getElementById("registerCode").value;  
	
	//initParam();
	if(registerTel==""){
		  alert("请输入手机号码！");
		  registerTel_obj.focus();
		  return false ;
	}/* else if(!partten.test(username.value)){
		  alert("你输入的手机号码有误，请重新输入！");
		  username.value = "" ;
		  username.focus();
		  return false ;
	}
	else if(pawd.value==""){
		  alert("请输入密码！");
		  pawd.focus();
		  return false ;  
	}else if(rpawd.value==""){
		  alert("请输入确认密码！");
		  rpawd.focus();
		  return false ;  
	}else if(pawd.value!=rpawd.value){
		   alert("二次输入的密码不一致，请重新输入！");
		   rpawd.value = "" ;
		   rpawd.focus();
		   return false ; 
	}else if(cityid.value==""){
		  alert("请选择所在城市！");
		  return false ;
	}else if(yzm.value==""){
		  alert("请输入验证码！");
		  yzm.focus();
		  return false ;  
	}	 */
	
	
	
	
	$(document).ready(function(){
		var msg = document.getElementById("msgRegister");
		  $("#register_button").click(function(){
	$.post("register_validate_code.jsp",
		    {
		      	registerCode:registerCode,
		      	registerTel:registerTel
		    },
		    function(data){
			   var html = $(data);
			   var validateStatus = html.find("#validateStatus").val();
			   if(validateStatus=="OK"){
				   var registerForm = document.getElementById("registerAction");
				  // return true;
			      	registerForm.submit(); 
				   //return_flag = true;
			  }else{
				  message = "验证码错误";
				 // alert(message);
				  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
				  //return_flag = false;
				 //return false;
				}
		      //alert("sendMsgStatus:" + sendMsgStatus);
		    }
		    
	);
	
	
	//return true ;
		  });
	});
	
	return false;
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
	    	cityid.value = id ;
		    showCity.innerHTML = "你选择的城市："+citykey[i][1];
		    document.getElementById("cityDiv").style.display = "none";
		}
	}
}


</script>


<script>
	    $(document).ready(function(){
	   		 //$("#registerTel").parent().css("-webkit-border-radius",".6em").css("border-left","1px solid #744501");
	    });
	    function setTelNull() {  
			document.getElementById("registerTel").value = "";
		}
		
	    var flagTel = 1;
		function getCode(){
			var seconds = 0;
			var message = null;
			
			flagTel = 1;
			var right = 1;	 
			var ifFlag = 1;

			var registerTel = document.getElementById("registerTel").value;
			var msg = document.getElementById("msgRegister");
			//2013-11-29
			   //if(!( /^1[3,5]\d{9}$/.test(tel))){
			if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57]|17[0-9])[0-9]{8}$/.test(registerTel))){
				 flagTel = 0;
				 message = "请输入正确的手机号！";
				 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			 }

		   if(flagTel==1){
			<%
			   UserDao user_dao = new UserDao();
			   user_dao.get_all_user_phone();
			   //int j=1;
			   for(int j=0;j<user_dao.user_phone.size();j++){
				  // System.out.println(j + " : " + userAdminDaoNew.UserNames[j] + "\n");
			   %>
				   if( (ifFlag==1) &&( registerTel == '<%=user_dao.user_phone.get(j)%>') )
					{
					    //alert(registerTel);
						flagTel = 0;
						ifFlag = 0;
						right = 0;
						message = "用户名(手机号)已注册，请重新输入！";
						msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
						//alert(message);
						//break;
				   	}
			<%} %>
				
			   	}
		   
			 
			 if(flagTel==1){

				document.getElementById("normalGetCode").style.display = "none";
				document.getElementById("waitGetCode").style.display = "block";
				
				message = "您输入的手机号可用！";
				msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
				
				 $(document).ready(function(){
					  $("#normalGetCode").click(function(){
					    $.post("register_code.jsp",
					    {
					      	registerTel:registerTel
					    },
					    function(data){
						   var html = $(data);
						   var sendMsgStatus = html.find("#sendMsgStatus").val();
					      //alert("sendMsgStatus:" + sendMsgStatus);
					    });
					  });
					  
				});
					
				 setInterval(function(){
					  	seconds += 1;
					  	document.getElementById('count').innerHTML = 60-seconds;
					  	if(seconds == 60){
					  		seconds = 0;
							document.getElementById("normalGetCode").style.display = "block";
							document.getElementById("waitGetCode").style.display = "none";
					  	}
				},1000);
			}
		}
	    
	    </script>


</head>
<body>

	<!-- <div class="banner_t index_banner_top">
		<div class="wp" id="main0"></div>
	</div> -->

<div class="content about">
<!--  <div class="a_banner"></div> -->
 <div class="about_body">
    
    <div class="a_right" style=" width:100%">
    <div class="weizhi" style="background:none; display:none"><a class="home_icon" href="#">您当前的位置:</a> <a href="index.jsp">首页</a> < <span class="d">用户注册</span> </div>
    <div class="wenzhang">   
    <form id="registerAction" name="registerAction" action="register_submit.jsp" method="post">
          <div class="border_l_r reg2">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody><tr>
    <td align="right" width="35%" valign="middle" height="50">手机号码&nbsp;<span class="xx">*</span></td>
   
    <td width="35%">
      <input type="text" name="registerTel" maxlength="30" value="" id="registerTel"/><span class="xx"></span>
      <div id="normalGetCode"><a id="SubmitButton" onclick="getCode()">获取验证码</a></div>
    				<div id="waitGetCode" style="display:none"><a data-theme="c" data-role="button" disabled="true"><span id="count">60</span>后重新获取</a></div>
    			
   </td>
<!--     <td width="30%">
    				<div id="normalGetCode"><a id="SubmitButton" onclick="getCode()">获取验证码</a></div>
    				<div id="waitGetCode" style="display:none"><a data-theme="c" data-role="button" disabled="true"><span id="count">60</span>后重新获取</a></div>
    			</td> -->
    			
  </tr>
  
  <tr>
    <td align="right" width="35%" valign="middle" height="50">验证码&nbsp;<span class="xx">*</span></td>
   
    <td width="35%">
      <input id="registerCode" name="registerCode" type="text" value="" />
    			
   </td>

    			
  </tr>
  
  
    <tbody><!-- <tr>
    <td align="right" width="35%" valign="middle" height="50">
    <div id="msgRegister" ></div>
    </td>
   
    <td width="35%">
     		
   </td>
    <td width="30%">
    				<div id="normalGetCode"><a id="SubmitButton" onclick="getCode()">获取验证码</a></div>
    				<div id="waitGetCode" style="display:none"><a data-theme="c" data-role="button" disabled="true"><span id="count">60</span>后重新获取</a></div>
    			</td>
    			
  </tr>
   -->
  
  
  
  <tr>
    <td align="right" width="35%" valign="middle" height="50">设置密码&nbsp;<span class="xx">*</span></td>
    <td width="65%">
    <input type="password" name="pawd" maxlength="8" id="pawd"/>     
    <span class="xx">(建议使用六位以上数字、字母、字符的结合)</span></td>
  </tr>
  <tr>
    <td align="right" width="35%" valign="middle" height="50">确认密码&nbsp;<span class="xx">*</span></td>
    <td width="65%">
     <input type="password" name="rpawd" maxlength="8" id="rpawd"/>     
      <span class="xx">(必须与刚才输入的密码一致)</span></td>
  </tr>
<!--   
  <tr>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">所在城市[<a style="cursor:hand" onclick="onSelectCity()">请选择</a>]&nbsp;<span class="xx">*</span></td>
    <td width="30%" colspan="3">
       <div id="selectDiv"><div id="showCity"></div></div>
<div style="display:none" id="cityDiv"  class="helplay">
<table class="xxx" border="0" cellpadding="0" cellspacing="0"  width="100%">
<tr>
<td><a style="cursor:hand"  onclick="onSelect('14301')">长沙市</a></td>
<td><a style="cursor:hand"  onclick="onSelect('14303')">株洲市</a></td>
<td><a style="cursor:hand"  onclick="onSelect('14304')">湘潭市</a></td>
<td><a style="cursor:hand"  onclick="onSelect('14305')">常德市</a></td>
</tr>
<tr>
<td><a style="cursor:hand"  onclick="onSelect('14306')">衡阳市</a> </td>
<td><a style="cursor:hand"  onclick="onSelect('14307')">岳阳市</a> </td>
<td><a style="cursor:hand"  onclick="onSelect('14308')">邵阳市</a> </td>
<td><a style="cursor:hand"  onclick="onSelect('14309')">益阳市</a> </td>
</tr>
<tr>
<td><a  style="cursor:hand"  onclick="onSelect('14302')">娄底市</a> </td>
<td><a  style="cursor:hand"  onclick="onSelect('143010')">怀化市</a></td>
<td><a style="cursor:hand"  onclick="onSelect('143011')">郴州市</a> </td>
<td><a  style="cursor:hand"  onclick="onSelect('143012')">永州市</a> </td>
</tr>

<tr>
<td><a style="cursor:hand"  onclick="onSelect('143013')">张家界</a></td>
<td><a style="cursor:hand"  onclick="onSelect('143014')">湘西自治州</a></td>
<td>  </td>
<td> </td>
</tr>
</table>
</div>
<input type="hidden" name="cityid" value="" id="cityid"/>

   </td>   
  </tr>
   -->
 <!--  <tr>
    <td align="right" width="35%" valign="middle" height="50">验证码&nbsp;<span class="xx">*</span></td>
    
    <td width="65%">
     <input type="text" name="yzm" value="" id="yzm"/>
         <img align="middle" class="yzm" src="image.jsp"></img>
      </td>
  </tr> -->
  <tr>
       <td colspan="2" align="center"><font color="red"></font></td>    
  </tr>
  <tr>
    <td align="center" valign="middle" height="50" colspan="2">
    <div id="msgRegister" ></div>
       <input  value=" " onclick="return saveSubmit();" id="register_button" name="register_button" class="btn_zc_ty">      
     </td>
    </tr>
</tbody></table>
<div class="xieyi_title">律邦投资民间金融服务平台用户协议</div>
<div class="xieyi_txt">
&#12288;  <p> 一、律邦投资民间金融服务平台对投融资双方提供免费发布信息、浏览信息的功能。只浏览不发布信息的用户无需注册，您可直接进行页面浏览；对于发布信息的用户可以选择先注册再发布信息，也可以选择直接发布信息并自动注册会员。</p><br>
    <p>二、如果您在注册会员时有什么疑问，可拨打律邦投资全国统一客服电话400-0699-360，或加企业QQ客服4000699360为QQ好友，以便律邦投资民间金融服务平台的工作人员协助您进行会员注册的人工服务。</p><br>
    <p>三、网上注册：凡是带*标志的项目为必填项，请认真填写，否则不能正确提交。</p><br>
&#12288;&#12288;<p>（一）律邦投资民间金融服务平台权利与义务：</p>
&#12288;&#12288;<p>1．按协议的服务内容及时准确地为会员提供信息和服务。</p>
&#12288;&#12288;<p>2．当会员违反协议规定内容时，律邦投资民间金融服务平台有权在不通知您的情况下，取消其会员资格，并停止提供协议承诺的服务。</p>
&#12288;&#12288;<p>3．有义务维护网站的正常秩序，对有损律邦投资民间金融服务平台及可能给其他会员或第三方带来不利的内容和行为，在不予通知的情况下采取必要行动以避免或减少损失的权利。</p>
&#12288;&#12288;<p>4．如发生火灾、水灾、暴动、骚乱、战争、自然灾害等不可抗力事故，以及律邦投资民间金融服务平台所不能控制之事件而影响提供服务时，律邦投资民间金融服务平台无须承担责任。</p><br>
&#12288;&#12288;<p>（二）会员权利与义务：</p>
&#12288;&#12288;<p>1．享受律邦投资民间金融服务平台提供的协议承诺的服务内容。</p>
&#12288;&#12288;<p>2．严格遵守协议内容。遵守国家法律法规政策规定，遵守交易规则，不得有非法经营行为及非法言论。</p>
&#12288;&#12288;<p>3．保证提供的信息及资料真实合法有效，不得含有虚假及不良内容，否则，造成对网站、会员及他人的伤害及损失由会员承担全部责任；若长期（超过一个月）不使用会员资格登陆的，律邦投资民间金融服务平台有权取消其会员资格。</p>
&#12288;&#12288;<p>4．会员应自行对律邦投资民间金融服务平台提供的会员身份信息保密。如果会员号或密码丢失或被盗用，会员须立即通知律邦投资民间金融服务平台，由律邦投资民间金融服务平台协助其对原有的会员身份信息进行更改，以避免或降低损失。</p>
&#12288;&#12288;<p>5．未取得律邦投资民间金融服务平台的书面允许，任何人不得以任何形式复制、散布、出售、出版、广播、转播律邦投资民间金融服务平台上的相关信息。</p><br>
    <p> 会员已认真阅读并完全认可上述协议内容，并自愿成为律邦投资民间金融服务平台的会员。</p>
</div>
        </div>
    </form>




  <div class="cl"></div>
    
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
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
				   var reset_password_action_form = document.getElementById("reset_password_action");
				  // return true;
			      	reset_password_action_form.submit(); 
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
	   		// $("#registerTel").parent().css("-webkit-border-radius",".6em").css("border-left","1px solid #744501");
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
						ifFlag = 0; //0：有这个手机号！ 1：没有这个手机号
						right = 0;
						
						/* message = "用户名(手机号)已注册，请重新输入！";
						msg.innerHTML = "<a style='color:red;'>" + message + "</a>"; */
						//alert(message);
						//break;
				   	}
			<%} %>
				
			   	}
		   
		   //没有这个手机号   Will Zhou   8/10/2014
		   if(ifFlag==1){
			   message = "用户名(手机号)不存在，请重新输入！";
				msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		   }
		   
		   
		   
			//有这个用户  Will Zhou 8/10/2014 
			 if(flagTel==0){

				document.getElementById("normalGetCode").style.display = "none";
				document.getElementById("waitGetCode").style.display = "block";
				
				message = "您输入的手机号有效！";
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
    <form id="reset_password_action" name="reset_password_action" action="reset_password_submit.jsp" method="post">
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
  
  
    <tbody>
    
  
  
  
  <tr>
    <td align="right" width="35%" valign="middle" height="50">设置新密码&nbsp;<span class="xx">*</span></td>
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
var ImgOK = true;

function SelectKeShi(){
	document.getElementById('SelectKeShi').style.display='block';
}

function SelectKeshiCancel(){
	document.getElementById('SelectKeShi').style.display='none';
	document.getElementById("SelectKeShi").value = "";
}

function SelectKeshiCertain(){
	document.getElementById('SelectKeShi').style.display='none';
}

function UploadPhoto(){
	document.getElementById('UploadPhoto').style.display='block';
}

function UploadPhotoCancel(){
	var uploadImage = document.getElementById('uploadImage') ;
	uploadImage.outerHTML = uploadImage.outerHTML;
	//uploadImage.value = null;
	document.getElementById("msgImg").style.display = "none";
	document.getElementById('UploadPhoto').style.display='none';
}

function browseBtnClick() {
//	document.getElementById("uploadImage").click(); 
	document.getElementById("uploadImage").click(); 
}

function ASKSubmit(){

	
	var QuestionText = document.getElementById("QuestionText").value;
	var ASKKeShi = $('input:radio[name="ASKKeShi"]:checked').val();
	//var ASKKeShi = document.getElementById("ASKKeShi").value;
	var ASKGender = document.getElementById("ASKGender").value;
	var ASKAge = document.getElementById("ASKAge").value;
	var ASKTel = document.getElementById("ASKTel").value;
	
   var message = null;
   var msg = document.getElementById("msgASK");
   var flag = 1;
   //alert("ASKKeShi:"+ ASKKeShi);
	if(null==QuestionText||QuestionText==""||null==ASKKeShi||ASKKeShi==""||
			null==ASKGender||ASKGender==""||null==ASKAge||ASKAge==""||
			null==ASKTel||ASKTel==""){
		  flag = 0;
	 	  message = "请您填写各项完整信息！";
		  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	}

	if(flag==1){
		if(!( /^[123456789]|([0-9]{2})$/.test(ASKAge))){
			 flag = 0;
			 message = "请输入年龄信息，如“23”！";
			 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		 }
	}
	
	if(flag==1){
		if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/.test(ASKTel))){
			 flag = 0;
			 message = "请输入正确的手机号！";
			 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		 }
	}
	if(flag==1){
		document.getElementById("ASKSubmit").style.display = "none";
		document.getElementById("ASKWaiting").style.display = "block";
		var ASKForm = document.getElementById("ASKForm");
		ASKForm.submit(); 
	}
}

function OthersASKButton(){
	document.getElementById("OthersASK").style.display = "block";
	document.getElementById("OwnASK").style.display = "none";
	
	document.getElementById('OthersASKButton').style.backgroundColor='#d8a14f';
	document.getElementById('OthersASKButton').style.color="white";
	document.getElementById('OwnASKButton').style.backgroundColor='';
	document.getElementById('OwnASKButton').style.color="#FF8C47";

}

function OwnASKButton(){
	document.getElementById("OthersASK").style.display = "none";
	document.getElementById("OwnASK").style.display = "block";
	
	document.getElementById('OwnASKButton').style.backgroundColor='#d8a14f';
	document.getElementById('OwnASKButton').style.color="white";
	document.getElementById('OthersASKButton').style.backgroundColor='';
	document.getElementById('OthersASKButton').style.color="#FF8C47";
}


function checkImg(){

	var uploadImage = document.getElementById("uploadImage").value;
	//alert("上传症状照片名：" + uploadImage);
	var msg = document.getElementById("msgImg");
	
	var pos = uploadImage.lastIndexOf(".");//无后缀名pos = -1;
	//alert("pos:" + pos);
	var lastname = uploadImage.substring(pos,uploadImage.length);
	//var uploadImage = lastname.toLowerCase();
	var ext = ['.jpg', '.jpeg', '.png','.bmp','.JPG','.JPEG','.PNG','.BMP','.gif','.GIF'];//jpg,jpeg,bmp,png,gif
	var flag = false;
	for(var i = 0; i < ext.length; i++)
	{
		//alert(ext[i]);
		if (uploadImage.indexOf(ext[i]) > 0)
		{
			flag = true;
			break;
		}
	}
	if(pos==-1){
		flag = true;
	}
	if(flag == false){
		 ImgOK = false;
		 
		 document.getElementById("msgImg").style.display = "block";
		 message = "只能上传.jpg、.jpeg、.bmp、.png、.gif、格式的图片!";
		 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	}else{
		ImgOK = true;
		alert("恭喜您，照片上传成功！ \n\r照片名：" + uploadImage);
		document.getElementById('UploadPhoto').style.display='none';
		document.getElementById("msgImg").style.display = "none";
		//message = "上传成功，请稍后...";
		//msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
	    //setTimeout(" document.getElementById('UploadPhoto').style.display='none' ",1500);
		//document.getElementById("msgImg").style.display = "none";
		//document.getElementById('UploadPhoto').style.display='none';
		//var uploadForm = document.getElementById("uploadForm");
		//uploadForm.submit(); 
		//document.getElementById("msg").style.display = "block";
	}
}
/*
function callback(msg)
{
	//alert("callback");
	document.getElementById("ImgSubmit").style.display = "none";
	document.getElementById("ImgWait").style.display = "none";
	document.getElementById("ImgCompletd").style.display = "block";
	
	//document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
	document.getElementById("msg").innerHTML = "<font color=red>"+msg+"</font>";
}

*/

 /* 主导航　*/
  function mainnav(m,n){ 
var tli=document.getElementById("menu"+m).getElementsByTagName("a"); /*获取选项卡的LI对象*/ 
var mli=document.getElementById("main"+m).getElementsByTagName("ul"); /*获取主显示区域对象*/ 
for(i=0;i<tli.length;i++){ 
  tli[i].className=i==n?"hover":""; /*更改选项卡的LI对象的样式，如果是选定的项则使用.hover样式*/ 
  mli[i].style.display=i==n?"block":"none"; /*确定主区域显示哪一个对象*/ }
}
  
 var menuArray = new Array(["about"],["lssf"]);
 
 function dispMenu(id){
	  for(var i=0;i<menuArray.length;i++){
		   if(id==menuArray[i]){
			   document.getElementById(id).style.display = "block" ;
		   }else{
			   document.getElementById(menuArray[i]).style.display = "none" ;
		   }
	  }
 }
 
 
 
  /* 主导航　*/
 function mainnavNew(m,n){ 
var tli=document.getElementById("menu"+m).getElementsByTagName("a"); /*获取选项卡的LI对象*/ 
var mli=document.getElementById("main"+m).getElementsByTagName("ul"); /*获取主显示区域对象*/ 
for(i=0;i<tli.length;i++){ 
  tli[i].className=i==n?"hover":""; /*更改选项卡的LI对象的样式，如果是选定的项则使用.hover样式*/ 
  mli[i].style.display=i==n?"block":"none"; /*确定主区域显示哪一个对象*/ }
}

/*首页借款信息和放款信息TAB切换*/
  function jdxx(m,n){ 
var tli=document.getElementById("jd"+m).getElementsByTagName("li"); /*获取选项卡的LI对象*/ 
var mli=document.getElementById("jdz"+m).getElementsByTagName("table"); /*获取主显示区域对象*/ 
for(i=0;i<tli.length;i++){ 
  tli[i].className=i==n?"hover":""; /*更改选项卡的LI对象的样式，如果是选定的项则使用.hover样式*/ 
  mli[i].style.display=i==n?"block":"none"; /*确定主区域显示哪一个对象*/ }
}
 
 
/* 幻灯片 */
 
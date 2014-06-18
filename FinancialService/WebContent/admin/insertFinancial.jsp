<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

<!--<form class="form-horizontal" id="financialForm" method="post" action="../sys/index.jsp">-->
<form class="form-horizontal" id="financialForm" method="post" action="../admin/editFinancialInfo.jsp?type=new">
	<div class="view"> 
       <!-- Button to trigger modal --> 
       <div align="right">
       <a id="myModalLinkFinancial" href="#myModalContainerFinancial" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">新建财务表</a> 
       </div>
       <!-- Modal -->
       <div id="myModalContainerFinancial" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelFinancial" aria-hidden="true">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h3 id="myModalLabelFinancial" contenteditable="true">新建财务表</h3>
         </div>
         <div class="modal-body" style="line-height:200%" >
         
<script>
    function checkNewFinancialInput()
    {
	   var form_datetimeNew = document.getElementById("form_datetimeNew").value;
	   var CashNew = document.getElementById("CashNew").value;
	   var ShuaKaNew = document.getElementById("ShuaKaNew").value;
	   var YaGaoKaNew = document.getElementById("YaGaoKaNew").value;
	   var ThirtyDaiJinQuanNew = document.getElementById("ThirtyDaiJinQuanNew").value;
	   var FiftyDaiJinQuanNew = document.getElementById("FiftyDaiJinQuanNew").value;
	   var TongKaNew = document.getElementById("TongKaNew").value;
	   var MeiTuanNew = document.getElementById("MeiTuanNew").value;
	   var NuoMiNew = document.getElementById("NuoMiNew").value;
	   var DianPingNew = document.getElementById("DianPingNew").value;
	   var ElevenDaiJinQuanNew = document.getElementById("ElevenDaiJinQuanNew").value;
	   var PreVipCashNew = document.getElementById("PreVipCashNew").value;
	   var PreVipShuaKaNew = document.getElementById("PreVipShuaKaNew").value;
	   var PreTongKaCashNew = document.getElementById("PreTongKaCashNew").value;
	   var PreTongKaShuaKaNew = document.getElementById("PreTongKaShuaKaNew").value;
	   var StandardSeatsNew = document.getElementById("StandardSeatsNew").value;
	   var ActualitySeatsNew = document.getElementById("ActualitySeatsNew").value;
	   var StandardDesksNew = document.getElementById("StandardDesksNew").value;
	   var ActualityDesksNew = document.getElementById("ActualityDesksNew").value;
	   var NoPeopleDesksNew = document.getElementById("NoPeopleDesksNew").value;

	   var message = null;
	   var msg = document.getElementById("msgFinancialNew");
	   var flag = 1; 
	   if(null==CashNew||CashNew == ""||null==ShuaKaNew||ShuaKaNew == ""
		   ||null==YaGaoKaNew||YaGaoKaNew == ""||null==ThirtyDaiJinQuanNew||ThirtyDaiJinQuanNew == ""
			   ||null==FiftyDaiJinQuanNew||FiftyDaiJinQuanNew == ""
		   ||null==TongKaNew||TongKaNew == ""||null==MeiTuanNew||MeiTuanNew == ""||null==NuoMiNew||NuoMiNew == ""
		   ||null==DianPingNew||DianPingNew == ""||null==ElevenDaiJinQuanNew||ElevenDaiJinQuanNew == ""
			   ||null==PreVipCashNew||PreVipCashNew == ""
		   ||null==PreVipShuaKaNew||PreVipShuaKaNew == ""||null==PreTongKaCashNew||PreTongKaCashNew == ""
			   ||null==PreTongKaShuaKaNew||PreTongKaShuaKaNew == ""
		   ||null==StandardSeatsNew||StandardSeatsNew == ""||null==ActualitySeatsNew||ActualitySeatsNew == ""
			   ||null==StandardDesksNew||StandardDesksNew == ""
		   ||null==ActualityDesksNew||ActualityDesksNew == ""||null==NoPeopleDesksNew||NoPeopleDesksNew == ""){
			  flag = 0;
		 	  message = "请输入正确的各项信息！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(null==form_datetimeNew||form_datetimeNew == ""){
		   flag = 0;
		   message = "请输入正确的财务表日期！";
		   msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
	   if(flag==1){
	      //var addrForm = document.forms("addrForm");
	      var financialNewForm = document.getElementById("financialForm");
	      financialNewForm.submit(); 
	   }
    }

</script>
         
           	    <center>
           	    <table width ="98%">
           	    	<tr>
			           	<td width="50%">
			           	  	 <table width="100%">
			           	     	<tr>
			           	     		<td align="center" width="35%">所属分店：</td>
			           	     		<td width="64%">
			           	     		<%
			           	     			ShopDao shopInsertFinancialDao = new ShopDao();
			           	     		%>
			           	     			<select name="shopSelectNew" id="shopSelectNew" data-native-menu="false" style="width:100%">
										<%for(int i=1;i<=shopInsertFinancialDao.getShopNum();i++){ 
											if(shopInsertFinancialDao.IsShopDel(i)==0){
											%>
											<option value="<%=i %>" >
												<%=shopInsertFinancialDao.getShopName(i) %>
											</option>
											<%}
										}%>
							        </select>
			           	     		</td>
			           	     		<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
			           	     	</tr>
           	     			</table> 
           	     		</td>
           	     		<td width="50%">
			           	     <table width ="100%">
			           	     	<tr>
			           	     		<td align="center" width="45%">财务表日期：</td>
			           	     		<td width="54%">
			           	     			<div class="input-append date form_datetimeNew">
										  	<input id="form_datetimeNew" name="form_datetimeNew" style="height:30px; width:80%;" type="text" value="" readonly>
										    <span class="add-on"><i class="icon-th"></i></span>
										</div>
										 
										<script type="text/javascript">
										    $(".form_datetimeNew").datetimepicker({
										        format: "yyyy-mm-dd",
										        autoclose: true,
										        todayBtn: true,
										        minView: 'month',
										        language:'zh-CN',
										        pickerPosition: "bottom-left"
										    });
										</script> 
			           	     		</td>
			           	     		<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
			           	     	</tr>
			           	     </table>
			           	 </td>
           	     	</tr>
           	     </table>
           	     <table width="95%"><tr><td><hr></td></tr></table>
           	    </center>         	     	
           	    <table width="100%" align="center" border="0" cellpadding="2" cellspacing="1" rules="cols">
           	    	<tr style="line-height:200%" >
           	    		<td width="50%" style="line-height:200%" >
			           	    <table  width="95%" align="center" border="0" cellpadding="1" cellspacing="1">
					    		<tr>
					    			<td align="left" width="39%" >现 &nbsp;金(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="CashNew" name="CashNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >刷 &nbsp;卡(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="ShuaKaNew" name="ShuaKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >雅高卡(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="YaGaoKaNew" name="YaGaoKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >30元券(张):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="ThirtyDaiJinQuanNew" name="ThirtyDaiJinQuanNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >50元券(张):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="FiftyDaiJinQuanNew" name="FiftyDaiJinQuanNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >通 &nbsp;卡(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="TongKaNew" name="TongKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >美&nbsp;团(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="MeiTuanNew" name="MeiTuanNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >糯&nbsp;米(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="NuoMiNew" name="NuoMiNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >点&nbsp;评(元) :</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="DianPingNew" name="DianPingNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >11元券(张):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" id="ElevenDaiJinQuanNew" name="ElevenDaiJinQuanNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
						    		
							</table>
						</td>
						<td width="50%">
						
							<table  width="95%" align="center" border="0" cellpadding="1" cellspacing="1">
					    		<tr>
					    			<td align="left" width="44%" >会员充现(元):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="PreVipCashNew" name="PreVipCashNew" style="width:90%;" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >会员刷卡(元):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="PreVipShuaKaNew" name="PreVipShuaKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >通卡充现(元):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="PreTongKaCashNew" name="PreTongKaCashNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >通卡刷卡(元):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="PreTongKaShuaKaNew" name="PreTongKaShuaKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >标准餐位(位):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="StandardSeatsNew" name="StandardSeatsNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >实际餐位(位):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="ActualitySeatsNew" name="ActualitySeatsNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >标准餐桌(张):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="StandardDesksNew" name="StandardDesksNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >实际餐桌(张):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="ActualityDesksNew" name="ActualityDesksNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >0人桌(张):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" id="NoPeopleDesksNew" name="NoPeopleDesksNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >&nbsp;</td>
					    			<td align="center" width="55%" height=30px>&nbsp;</td>
					    			<td width="1%">&nbsp;</td>
					    		</tr>
					    		
							</table>
						</td>
					</tr>
				</table>
<!--			           </p>-->
		
         </div>
         <div class="modal-footer">
         
         <table width="95%">
         	<tr>
         		<td width="66%" align="center"  valign="top">&nbsp;
         			<div id="msgFinancialNew"></div>
         		</td>
         		<td width="17%" align="center"  valign="bottom">
          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
          		</td>
				<td width="17%" align="center"  valign="bottom">
           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkNewFinancialInput()"/>
           		</td>
           	</tr>
          </table>

         </div>
       </div>
     </div>
</form>

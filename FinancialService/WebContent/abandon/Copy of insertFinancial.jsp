<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

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
           	    <center>
           	     <table width ="90%">
           	     	<tr>
           	     		<td align="center" width="30%">选取财务表时间：</td>
           	     		<td width="50%">
           	     			<div class="input-append date form_datetimeNew">
							  	<input name="form_datetimeNew" style="height:30px; width:100%;" type="text" value="" readonly>
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
           	     		<td width="20%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
           	     	</tr>
           	     </table> 
           	    </center>         	     	
           	    <table width="100%" align="center" border="0" cellpadding="2" cellspacing="1" rules="cols">
           	    	<tr style="line-height:200%" >
           	    		<td width="50%" style="line-height:200%" >
			           	    <table  width="95%" align="center" border="0" cellpadding="1" cellspacing="1">
					    		<tr>
					    			<td align="left" width="39%" >现 &nbsp;金(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="CashNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >刷 &nbsp;卡(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="ShuaKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >雅高卡(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="YaoGaoKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >30元券(张):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="ThirtyDaiJinQuanNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >50元券(张):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="FiftyDaiJinQuanNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >通 &nbsp;卡(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="TongKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >美&nbsp;团(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="MeiTuanNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >糯&nbsp;米(元):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="NuoMiNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >点&nbsp;评(元) :</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="DianPingNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="39%" >11元券(张):</td>
					    			<td align="center" width="60%">
					    				<input style="height:30px; width:90%" type="text" name="ElevenDaiJinQuanNew" value=""/>
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
					    				<input style="height:30px; width:90%" type="text" name="PreVipCashNew" style="width:90%;" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >会员刷卡(元):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="PreVipShuaKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >通卡充现(元):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="PreTongKaCashNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >通卡刷卡(元):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="PreTongKaShuaKaNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >标准餐位(位):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="StandardSeatsNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >实际餐位(位):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="ActualitySeatsNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >标准餐桌(张):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="StandardDesksNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >实际餐桌(张):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="ActualityDesksNew" value=""/>
					    			</td>
					    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
					    		</tr>
					    		<tr>
					    			<td align="left" width="44%" >0人桌(张):</td>
					    			<td align="center" width="55%">
					    				<input style="height:30px; width:90%" type="text" name="NoPeopleDesksNew" value=""/>
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
           <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
<!--			           <input type="submit" class="btn btn-primary" contenteditable="true" value="保存设置" />-->
           <button type="submit" class="btn btn-primary" contenteditable="true">保存设置</button>
         </div>
       </div>
     </div>
</form>

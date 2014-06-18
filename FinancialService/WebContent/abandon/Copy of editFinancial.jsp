<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>

<%
FinancialDao financialAdminDao = new FinancialDao();
int chartNum = 0;
chartNum = financialAdminDao.getFinancialNum();

int FId = 0;
for(FId=1;FId<=chartNum;FId++){
	financialAdminDao.getFinancialInfo(FId);
%>

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr>
		<td width="50%">&nbsp; &nbsp; &nbsp; &nbsp;财务表编号&nbsp;<%=FId %>&nbsp;,&nbsp;<strong> 日期： &nbsp;<%=financialAdminDao.chartDate %></strong></td>
		<td width="50%" valign="bottom" align="center">
		<br>
<!--		<form class="form-horizontal" id="financialForm<%=FId %>" method="post" action="../sys/index.jsp">-->
		<form class="form-horizontal" id="financialForm<%=FId %>" method="post" action="../admin/editFinancialInfo.jsp?type=edit&FId=<%=FId %>">
			<div class="view"> 
		       <!-- Button to trigger modal --> 
		       <div align="right">
		       <a id="myModalLink<%=FId %>" href="#myModalContainerFinancial<%=FId %>" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">编辑</a> 
		       </div>
		       <!-- Modal -->
		       <div id="myModalContainerFinancial<%=FId %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel<%=FId %>" aria-hidden="true">
		         <div class="modal-header">
		           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		           <h3 id="myModalLabel<%=FId %>" contenteditable="true">编辑财务表信息</h3>
		         </div>
		         <div class="modal-body" style="line-height:200%" >
	           	    <center>
	           	     <table width ="90%">
	           	     	<tr>
	           	     		<td align="center" width="30%">选取财务表时间：</td>
	           	     		<td width="50%">
	           	     			<div class="input-append date form_datetime<%=FId %>">
								  	<input name="form_datetime<%=FId %>" style="height:30px; width:100%;" type="text" value="<%=financialAdminDao.chartDate %>" readonly>
								    <span class="add-on"><i class="icon-th"></i></span>
								</div>
								 
								<script type="text/javascript">
								    $(".form_datetimeNew<%=FId %>").datetimepicker({
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
	           	     <table width="100%">
						<tr>
							<td align="center" width="30%">是否删除财务表：</td>
							<%
							if(financialAdminDao.IsFinancialDel(FId)==1){
							%>
								
								<td align="right" width="10%">否</td>
								<td valign="middle" align="center" width="10%">
									<input type="radio" name="financialRadio<%=FId %>" value="0"></td>
								<td width="10%">&nbsp;</td>
								<td align="right" width="10%">是</td>
								<td valign="middle" align="center" width="10%">
									<input type="radio" checked name="financialRadio<%=FId %>" value="1"></td>
							<%
							}else{
							%>
								<td align="right" width="10%">否</td>
								<td valign="middle" align="center" width="10%">
									<input type="radio" checked name="financialRadio<%=FId %>" value="0"></td>
								<td width="10%">&nbsp;</td>
								<td align="right" width="10%">是</td>
								<td valign="middle" align="center" width="10%">
									<input type="radio" name="financialRadio<%=FId %>" value="1"></td>
							
							<%} %>
								<td align="right" width="20%">&nbsp;</td>
							</tr>
						</table>  
							   	     	
		           	    <table width="100%" align="center" border="0" cellpadding="2" cellspacing="1" rules="cols">
		           	    	<tr style="line-height:200%" >
		           	    		<td width="50%" style="line-height:200%" >
					           	    <table  width="95%" align="center" border="0" cellpadding="1" cellspacing="1">
							    		<tr>
							    			<td align="left" width="39%" >现 &nbsp;金(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="Cash<%=FId %>" value="<%=financialAdminDao.Cash %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >刷 &nbsp;卡(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="ShuaKa<%=FId %>" value="<%=financialAdminDao.ShuaKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >雅高卡(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="YaoGaoKa<%=FId %>" value="<%=financialAdminDao.YaGaoKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >30元券(张):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="ThirtyDaiJinQuan<%=FId %>" value="<%=financialAdminDao.ThirtyDaiJinQuan %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >50元券(张):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="FiftyDaiJinQuan<%=FId %>" value="<%=financialAdminDao.FiftyDaiJinQuan %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >通 &nbsp;卡(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="TongKa<%=FId %>" value="<%=financialAdminDao.TongKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >美&nbsp;团(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="MeiTuan<%=FId %>" value="<%=financialAdminDao.MeiTuan %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >糯&nbsp;米(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="NuoMi<%=FId %>" value="<%=financialAdminDao.NuoMi %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >点&nbsp;评(元) :</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="DianPing<%=FId %>" value="<%=financialAdminDao.DianPing %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >11元券(张):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" name="ElevenDaiJinQuan<%=FId %>" value="<%=financialAdminDao.ElevenDaiJinQuan %>"/>
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
							    				<input style="height:30px; width:90%" type="text" name="PreVipCash<%=FId %>" style="width:90%;" value="<%=financialAdminDao.PreVipCash %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >会员刷卡(元):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="PreVipShuaKa<%=FId %>" value="<%=financialAdminDao.PreVipShuaKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >通卡充现(元):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="PreTongKaCash<%=FId %>" value="<%=financialAdminDao.PreTongKaCash %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >通卡刷卡(元):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="PreTongKaShuaKa<%=FId %>" value="<%=financialAdminDao.PreTongKaShuaKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >标准餐位(位):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="StandardSeats<%=FId %>" value="<%=financialAdminDao.StandardSeats %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >实际餐位(位):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="ActualitySeats<%=FId %>" value="<%=financialAdminDao.ActualitySeats %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >标准餐桌(张):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="StandardDesks<%=FId %>" value="<%=financialAdminDao.StandardDesks %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >实际餐桌(张):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="ActualityDesks<%=FId %>" value="<%=financialAdminDao.ActualityDesks %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >0人桌(张):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" name="NoPeopleDesks<%=FId %>" value="<%=financialAdminDao.NoPeopleDesks %>"/>
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
		         </div>
		         <div class="modal-footer">
		           <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
		<!--			           <input type="submit" class="btn btn-primary" contenteditable="true" value="保存设置" />-->
		           <button type="submit" class="btn btn-primary" contenteditable="true">保存设置</button>
		         </div>
		       </div>
		     </div>
		</form>		
		</td>
	</tr>
</table>

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr>
		<td align="center" width="10%" bgcolor="#DBEAF9"><strong><big>销售收入</big></strong></td>
		<td width="90%">
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0">
				<tr align="center" bgcolor="#D5D5D5">
					<td align="center"><p style="color:red;"><strong>收款额(元)</strong></p></td>
					<td align="center"><strong>现&nbsp;金(元)</strong></td>
					<td align="center"><strong>刷&nbsp;卡(元)</strong></td>
					<td align="center"><strong>雅高卡(元)</strong></td>
					<td align="center"><strong>30元券(张)</strong></td>
					<td align="center"><strong>50代金券(张)</strong></td>
					<td align="center"><strong>通&nbsp;卡(元)</strong></td>
					<td align="center"><strong>美&nbsp;团(元)</strong></td>
					<td align="center"><strong>糯&nbsp;米(元)</strong></td>
					<td align="center"><strong>点&nbsp;评(元)</strong></td>
					<td align="center"><strong>11元券(张)</strong></td>
				</tr>
				<tr align="center">
					<td align="center"><p style="color:red;"><%=financialAdminDao.Sum %></p></td>
					<td align="center"><%=financialAdminDao.Cash %></td>
					<td align="center"><%=financialAdminDao.ShuaKa %></td>
					<td align="center"><%=financialAdminDao.YaGaoKa %></td>
					<td align="center"><%=financialAdminDao.ThirtyDaiJinQuan %></td>
					<td align="center"><%=financialAdminDao.FiftyDaiJinQuan %></td>
					<td align="center"><%=financialAdminDao.TongKa %></td>
					<td align="center"><%=financialAdminDao.MeiTuan %></td>
					<td align="center"><%=financialAdminDao.NuoMi %></td>
					<td align="center"><%=financialAdminDao.DianPing %></td>
					<td align="center"><%=financialAdminDao.ElevenDaiJinQuan %></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="10%" bgcolor="#DBEAF9"><strong><big>储蓄核算</big></strong></td>
		<td width="90%">
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0">
				<tr align="center" bgcolor="#D5D5D5">
					<td align="center"><p style="color:red;"><strong>会员充值(元)</strong></p></td>
					<td align="center"><strong>会员充现(元)</strong></td>
					<td align="center"><strong>会员充卡(元)</strong></td>
					<td align="center"><p style="color:red;"><strong>通卡充值(元)</strong></p></td>
					<td align="center"><strong>通卡充现(元)</strong></td>
					<td align="center"><strong>通卡刷卡(元)</strong></td>
				</tr>
				<tr align="center">
					<td align="center"><p style="color:red;"><%=financialAdminDao.PreVipRecharge %></p></td>
					<td align="center"><%=financialAdminDao.PreVipCash %></td>
					<td align="center"><%=financialAdminDao.PreVipShuaKa %></td>
					<td align="center"><p style="color:red;"><%=financialAdminDao.PreTongKaRecharge %></p></td>
					<td align="center"><%=financialAdminDao.PreTongKaCash %></td>
					<td align="center"><%=financialAdminDao.PreTongKaShuaKa %></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="10%" bgcolor="#DBEAF9"><strong><big>财务分析</big></strong></td>
		<td width="90%">
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0">
				<tr align="center" bgcolor="#D5D5D5">
					<td align="center"><strong>标准餐位(位)</strong></td>
					<td align="center"><strong>实际餐位(位)</strong></td>
					<td align="center"><p style="color:red;"><strong>翻位率(%)</strong></p></td>
					<td align="center"><strong>标准餐桌(张)</strong></td>
					<td align="center"><strong>实际餐桌(张)</strong></td>
					<td align="center"><p style="color:red;"><strong>翻台率(%)</strong></p></td>
					<td align="center"><strong>0人桌(张)</strong></td>
				</tr>
				<tr align="center">
					<td align="center"><%=financialAdminDao.StandardSeats %></td>
					<td align="center"><%=financialAdminDao.ActualitySeats %></td>
					<td align="center"><p style="color:red;"><%=financialAdminDao.SeatRate %></p></td>
					<td align="center"><%=financialAdminDao.StandardDesks %></td>
					<td align="center"><%=financialAdminDao.ActualityDesks %></td>
					<td align="center"><p style="color:red;"><%=financialAdminDao.DeskRate %></p></td>
					<td align="center"><%=financialAdminDao.NoPeopleDesks %></td>
				</tr>
			</table>
		</td>
	</tr>

</table>

<%} %>
<br>

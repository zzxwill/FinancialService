<%@ include file="../common/header.jsp"%>

<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css" />

	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="5" bgcolor="#FFFFFF"><img src="../images/space.gif"
				width="2" height="2" /></td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="312" align="center" bgcolor="#AF190B"><table
					width="945" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><img src="../images/Banner01.jpg" width="945" height="312" /></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="10" bgcolor="#CCCCCC"><img src="../images/space.gif"
				width="2" height="2" /></td>
		</tr>
	</table>
	
				<table width="945" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="../images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="../images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="../images/rz3.gif" width="482"
										height="27" /></td>
									<td width="84%" align="right"><img src="../images/wetuo.gif"
										width="84" height="18" /></td>
								</tr>
							</table></td>
						<td width="27" bgcolor="#FFFFFF"><img src="../images/l6.jpg"
							width="27" height="41" /></td>
					</tr>
					<tr>
						<td background="../images/L2.jpg"><img src="../images/L2.jpg"
							width="31" height="179" /></td>
						<td height="200" align="center" bgcolor="#E5E3E4">
						
						<table
								width="99%" border="0" cellspacing="0" cellpadding="0">
								
								<tr>
    <td  class="t" height="50" valign="middle" width="20%">融资金额&nbsp;<span class="xx">*</span></td>
    <td width="30%" >
      <input type="text" name="jkje" size="10" value="" id="jkje" style="width:200px; margin-right:8px;"/>万元
   </td>
   <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">融资期限&nbsp;<span class="xx">*</span></td>
    <td width="30%">
         
		<select name="jkqx" id="jkqx">
    <option value="1">1个月</option>
    <option value="2">2个月</option>
    <option value="3">3个月</option>
    <option value="4">4个月</option>
    <option value="5">5个月</option>
    <option value="6">6个月</option>
    <option value="7">7个月</option>
    <option value="8">8个月</option>
    <option value="9">9个月</option>
    <option value="10">10个月</option>
    <option value="11">11个月</option>
    <option value="12">12个月</option>


</select>
 
   </td>
  </tr>
  <tr>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">期望年利率&nbsp;<span class="xx">*</span></td>
    <td width="30%" >
      <input type="text" name="nx" value="" id="nx" style="width:200px; margin-right:8px;"/>% 
   </td>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">担保类别&nbsp;<span class="xx">*</span></td>
    <td width="30%" >
       
		<select name="dywlx" id="dywlx">
    <option value="0">房屋抵押</option>
    <option value="3">保证人担保</option>
    <option value="4">担保公司担保</option>
    <option value="5">土地抵押</option>
    <option value="6">在建工程抵押</option>
    <option value="7">股权质押</option>
    <option value="8">车辆质押</option>
    <option value="9">林权抵押</option>
    <option value="10">知识产权质押</option>


</select>
 
   </td>
  </tr>
   <tr>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">融资用途&nbsp;<span class="xx">*</span></td>
    <td width="30%" colspan="3">
      <input type="text" name="jkyt" value="" id="jkyt"/> &nbsp;<span class="xx">(简要描述)</span>
   </td>
   </tr>
   <tr>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">还款来源&nbsp;<span class="xx">*</span></td>
    <td width="30%" colspan="3">
      <input type="text" name="hkly" value="" id="hkly"/> &nbsp;<span class="xx">(简要描述)</span>
   </td>  
  </tr>
  
  <tr>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">手机号码&nbsp;<span class="xx">*</span></td>
    <td width="30%">
      <input type="text" name="sjhm" value="" id="sjhm"/>
   </td>  
     <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">姓名&nbsp;</td>
    <td width="30%" >
      <input type="text" name="xm" value="" id="xm"/>
   </td>  
  </tr>
  
  <tr>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">EMAIL&nbsp;</td>
    <td width="30%" >
      <input type="text" name="email" value="" id="email"/>
   </td>   
   <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">QQ号码&nbsp;</td>
    <td width="30%" colspan="3">
      <input type="text" name="qq" value="" id="qq"/>
   </td>
  </tr>
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
    <tr>
    <td class="t" align="right" width="20%" valign="middle" height="50"  align="right">备注&nbsp;</td>
    <td width="30%" colspan="3">
     <textarea name="bz" cols="60" rows="5" id="bz"></textarea>
   </td>   
  </tr>
   <tr>
    <td align="center" valign="middle" colspan="4">
        <span class="xx"></span>
    </td>   
  </tr>
  <tr>
    <td style="text-align:center" valign="middle" height="50" colspan="4">
       <input type="button"  value=" " onclick="return toSubmit();" id="button" name="button" class="btn_zc_ty" >      
     </td>
    </tr>
								
								
								
								
							</table></td>
						<td background="../images/L7.jpg"><img src="../images/l7.jpg"
							width="27" height="179" /></td>
					</tr>
					<tr>
						<td height="23" bgcolor="#FFFFFF"><img src="../images/L3.jpg"
							width="31" height="23" /></td>
						<td background="../images/L5.jpg">&nbsp;</td>
						<td bgcolor="#FFFFFF"><img src="../images/l8.jpg" width="27"
							height="23" /></td>
					</tr>
				</table>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="8"><img src="../images/space.gif" width="2"
							height="2" /></td>
					</tr>
				</table></td>
		</tr>
	</table>
	
	
<%@ include file="../common/footer.jsp"%>	

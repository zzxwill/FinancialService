<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%-- <%@ include file="../common/header.html"%> --%>
<jsp:include page="../common/header.jsp" flush="true"/> 
<link href="../css/index.css" rel="stylesheet" type="text/css" />

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
	<table width="100%" height="225" border="0" cellpadding="0"
		cellspacing="0" class="bg">
		<tr></tr>
		<tr>
			<td align="center" valign="top"><table width="945" border="0"
					cellpadding="0" cellspacing="0" class="mbg">
					<tr>
						<td width="25">&nbsp;</td>
						<td width="195" height="110"><a href="#"><img
								src="../images/an01.jpg" border="0" width="184" height="61"
								id="Image1"
								onmouseover="MM_swapImage('Image1','','../images/an012.jpg',1)"
								onmouseout="MM_swapImgRestore()" /></a></td>
						<td width="212"><a href="#"><img src="../images/an02.jpg"
								border="0" width="184" height="61" id="Image2"
								onmouseover="MM_swapImage('Image2','','../images/an022.jpg',1)"
								onmouseout="MM_swapImgRestore()" /></a></td>
						<td width="449"><table width="98%" border="0" align="left"
								cellpadding="0" cellspacing="0" class="search">
								<tr>
									<td height="80"><table width="96%" border="0"
											align="center" cellpadding="0" cellspacing="0"
											class="search_txt">
											<tr>
												<td width="60">类 型：</td>
												<td width="59"><form id="form1" name="form1"
														method="post" action="">
														<input type="checkbox" name="checkbox" id="checkbox" /> <label
															for="checkbox"></label> 融资
													</form></td>
												<td width="75"><form id="form2" name="form2"
														method="post" action="">
														<input type="checkbox" name="checkbox2" id="checkbox2" />
														<label for="checkbox2"></label> 投资
													</form></td>
												<td width="91"><form id="form3" name="form2"
														method="post" action="">
														<input type="checkbox" name="checkbox3" id="checkbox3" />
														<label for="checkbox3"></label> 融资产品
													</form></td>
												<td width="79"><form id="form4" name="form2"
														method="post" action="">
														<input type="checkbox" name="checkbox4" id="checkbox4" />
														<label for="checkbox4"></label> 金融产品
													</form></td>
												<td width="55"><form id="form5" name="form2"
														method="post" action="">
														<input type="checkbox" name="checkbox5" id="checkbox5" />
														<label for="checkbox5"></label> 不限
													</form></td>
											</tr>
											<tr>
												<td>投资时间：</td>
												<td><form id="form6" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox6" id="checkbox6" />
														<label for="checkbox6"></label> 6个月
													</form></td>
												<td><form id="form7" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox7" id="checkbox7" />
														<label for="checkbox7"></label> 1年
													</form></td>
												<td><form id="form8" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox8" id="checkbox8" />
														<label for="checkbox8"></label> 2年
													</form></td>
												<td><form id="form9" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox9" id="checkbox9" />
														<label for="checkbox9"></label> 3年以上
													</form></td>
												<td><form id="form10" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox10" id="checkbox10" />
														<label for="checkbox10"></label> 不限
													</form></td>
											</tr>
											<tr>
												<td>年 涨 幅：</td>
												<td><form id="form11" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox11" id="checkbox11" />
														<label for="checkbox11"></label> 0-5%
													</form></td>
												<td><form id="form12" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox12" id="checkbox12" />
														<label for="checkbox12"></label> 5%-10%
													</form></td>
												<td><form id="form13" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox13" id="checkbox13" />
														<label for="checkbox13"></label> 10%-30%
													</form></td>
												<td><form id="form14" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox14" id="checkbox14" />
														<label for="checkbox14"></label> 30%以上
													</form></td>
												<td><form id="form15" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox15" id="checkbox15" />
														<label for="checkbox15"></label> 不限
													</form></td>
											</tr>
											<tr>
												<td>综合评级：</td>
												<td><form id="form16" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox16" id="checkbox16" />
														<label for="checkbox16"></label> 1星
													</form></td>
												<td><form id="form17" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox17" id="checkbox17" />
														<label for="checkbox17"></label> 2星
													</form></td>
												<td><form id="form18" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox18" id="checkbox18" />
														3星
													</form></td>
												<td><form id="form19" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox19" id="checkbox19" />
														<label for="checkbox19"></label> 4星
													</form></td>
												<td><form id="form20" name="form2" method="post"
														action="">
														<input type="checkbox" name="checkbox20" id="checkbox20" />
														5星
													</form></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td width="64" valign="middle" class="copyright"><p>
								&nbsp;&nbsp;&nbsp;<a href="#"><img src="../images/search.jpg"
									border="0" width="24" height="23" /></a><br /> 快速搜索
							</p></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="../images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="../images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="../images/d1.gif" width="441"
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
						<td align="center" bgcolor="#E5E3E4"><table width="98%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="465"><table width="96%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td height="20" align="center"><img
													src="../images/space.gif" width="2" height="2" /></td>
											</tr>
										</table>
										<table width="96%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td align="center"><img src="../images/tz01.gif"
													width="435" height="52" /></td>
											</tr>
										</table>
										<table width="96%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td align="center"><img src="../images/tz02.gif"
													width="435" height="52" /></td>
											</tr>
										</table>
										<table width="96%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td align="center"><img src="../images/tz03.gif"
													width="435" height="52" /></td>
											</tr>
										</table></td>
									<td width="47%"><table width="99%" border="0"
											cellpadding="0" cellspacing="0" class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="../images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="../images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="../images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="../images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="../images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="../images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td background="../images/l7.jpg"><img src="../images/l7.jpg"
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
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="../images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="../images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="../images/rz.gif" width="178"
										height="27" /></td>
									<td width="84%" align="right"><img src="../images/wetuo.gif"
										width="84" height="18" /></td>
								</tr>
							</table></td>
						<td width="27" bgcolor="#FFFFFF"><img src="../images/l6.jpg"
							width="27" height="41" /></td>
					</tr>
					<tr>
						<td background="../images/la1.gif"><img src="../images/la1.gif"
							width="31" height="29" /></td>
						<td height="230" align="center" bgcolor="#F5E1CF"><table
								width="95%" border="0" cellpadding="0" cellspacing="0"
								class="rongzitxt">
								<tr>
									<td width="180" height="15" align="center">融资金额（万元）</td>
									<td width="135" align="center">期限（月）</td>
									<td width="117" align="center">年利率（%）</td>
									<td width="100" align="center">担保类型</td>
									<td width="100" align="center">发布日期</td>
									<td width="100" align="center">信息状态</td>
									<td width="108" align="center">查看详情<img
										src="../images/space.gif" width="2" height="2" /></td>
								</tr>
							</table>
							<table width="95%" border="0" cellpadding="0" cellspacing="0"
								class="news2">
								<tr>
									<td width="180" align="center">460</td>
									<td width="135" align="center">1</td>
									<td width="117" align="center">24</td>
									<td width="100" align="center">房屋抵押</td>
									<td width="100" align="center">2014-05-14</td>
									<td width="100" align="center">已审核</td>
									<td width="108" align="center">详细情况</td>
								</tr>
							</table>
							<table width="95%" border="0" cellpadding="0" cellspacing="0"
								class="news2">
								<tr>
									<td width="180" align="center">460</td>
									<td width="135" align="center">1</td>
									<td width="117" align="center">24</td>
									<td width="100" align="center">房屋抵押</td>
									<td width="100" align="center">2014-05-14</td>
									<td width="100" align="center">已审核</td>
									<td width="108" align="center">详细情况</td>
								</tr>
							</table>
							<table width="95%" border="0" cellpadding="0" cellspacing="0"
								class="news2">
								<tr>
									<td width="180" align="center">460</td>
									<td width="135" align="center">1</td>
									<td width="117" align="center">24</td>
									<td width="100" align="center">房屋抵押</td>
									<td width="100" align="center">2014-05-14</td>
									<td width="100" align="center">已审核</td>
									<td width="108" align="center">详细情况</td>
								</tr>
							</table>
							<table width="95%" border="0" cellpadding="0" cellspacing="0"
								class="news2">
								<tr>
									<td width="180" align="center">460</td>
									<td width="135" align="center">1</td>
									<td width="117" align="center">24</td>
									<td width="100" align="center">房屋抵押</td>
									<td width="100" align="center">2014-05-14</td>
									<td width="100" align="center">已审核</td>
									<td width="108" align="center">详细情况</td>
								</tr>
							</table>
							<table width="95%" border="0" cellpadding="0" cellspacing="0"
								class="news2">
								<tr>
									<td width="180" align="center">460</td>
									<td width="135" align="center">1</td>
									<td width="117" align="center">24</td>
									<td width="100" align="center">房屋抵押</td>
									<td width="100" align="center">2014-05-14</td>
									<td width="100" align="center">已审核</td>
									<td width="108" align="center">详细情况</td>
								</tr>
							</table>
							<table width="95%" border="0" cellpadding="0" cellspacing="0"
								class="news2">
								<tr>
									<td width="180" align="center">460</td>
									<td width="135" align="center">1</td>
									<td width="117" align="center">24</td>
									<td width="100" align="center">房屋抵押</td>
									<td width="100" align="center">2014-05-14</td>
									<td width="100" align="center">已审核</td>
									<td width="108" align="center">详细情况</td>
								</tr>
							</table></td>
						<td background="../images/la2.gif"><img src="../images/la2.gif"
							width="27" height="19" /></td>
					</tr>
					<tr>
						<td height="21" bgcolor="#FFFFFF"><img src="../images/la4.gif"
							width="31" height="21" /></td>
						<td background="../images/la5.gif"><img src="../images/la5.gif"
							width="28" height="21" /></td>
						<td bgcolor="#FFFFFF"><img src="../images/la3.gif" width="27"
							height="21" /></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="110" align="center" bgcolor="#FFFFFF"><p>
								<img src="../images/ad01.gif" width="919" height="119" /><br />
							</p></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="../images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="../images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="../images/rz2.gif" width="482"
										height="27" /></td>
									<td width="84%" align="right"><img src="../images/wetuo.gif"
										width="84" height="18" /></td>
								</tr>
							</table></td>
						<td width="27" bgcolor="#FFFFFF"><img src="../images/l6.jpg"
							width="27" height="41" /></td>
					</tr>
					<tr>
						<td background="../images/la1.gif"><img src="../images/la1.gif"
							width="31" height="29" /></td>
						<td height="180" align="center" bgcolor="#F5E1CF"><table
								width="99%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="48%"><table width="99%" border="0"
											cellspacing="0" cellpadding="0">
											<tr>
												<td><table width="99%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td align="left" class="title"><table width="99%"
																	border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td width="100"><img src="../images/xm1.jpg"
																			width="82" height="121" /></td>
																		<td><table width="95%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td height="30" align="left" class="title">
																						某金融机构高管个人经营借款</td>
																				</tr>
																			</table>
																			<table width="95%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td height="35" align="left" class="txt">借款人系某融资性担保公司的法定代表人，名下拥有包括某融资性担保公司在内的多家公司股份、多套房产..</td>
																				</tr>
																			</table>
																			<table width="98%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td height="35" align="left" class="txt2">金额：150万
																						年利率：12% 期限：12个月 进度80%</td>
																				</tr>
																			</table>
																			<table width="95%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td align="left" class="title">经办律师：王律师 <br />
																						联系方式：0571-85387122 QQ:123123333
																					</td>
																				</tr>
																			</table></td>
																	</tr>
																</table></td>
														</tr>
													</table></td>
											</tr>
										</table></td>
									<td width="50%" height="160" align="right"><table
											width="99%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="100"><img src="../images/xm1.jpg" width="82"
													height="121" /></td>
												<td><table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="30" align="left" class="title">
																某金融机构高管个人经营借款</td>
														</tr>
													</table>
													<table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="35" align="left" class="txt">借款人系某融资性担保公司的法定代表人，名下拥有包括某融资性担保公司在内的多家公司股份、多套房产..</td>
														</tr>
													</table>
													<table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="35" align="left" class="txt2">金额：150万
																年利率：12% 期限：12个月 进度80%</td>
														</tr>
													</table>
													<table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td align="left" class="title">经办律师：王律师 <br />
																联系方式：0571-85387122 QQ:123123333
															</td>
														</tr>
													</table></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td background="../images/la2.gif">&nbsp;</td>
					</tr>
					<tr>
						<td height="21" bgcolor="#FFFFFF"><img src="../images/la4.gif"
							width="31" height="21" /></td>
						<td background="../images/la5.gif"><img src="../images/la5.gif"
							width="28" height="21" /></td>
						<td bgcolor="#FFFFFF"><img src="../images/la3.gif" width="27"
							height="21" /></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
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
						<td height="200" align="center" bgcolor="#E5E3E4"><table
								width="99%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="438"><table width="434" border="0"
											cellspacing="0" cellpadding="0">
											<tr>
												<td width="110"><img src="../images/photo.jpg" width="84"
													height="118" /></td>
												<td align="left"><table width="330" border="0"
														cellpadding="0" cellspacing="0">
														<tr>
															<td height="30" align="left" class="title">
																工银绝对收益混合发起B 代码：000672</td>
														</tr>
													</table>
													<table width="330" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="20" colspan="2" align="left" class="txt">单位净值（2014-05-27）：1.0570（-0.28%）</td>
														</tr>
														<tr>
															<td height="18" align="left" class="txt">类 型：
																混合型|中高风险</td>
															<td height="18" align="left" class="txt">成 立 日：
																2001-12-18</td>
														</tr>
														<tr>
															<td height="20" align="left" class="txt">管 理 人： 华夏基金</td>
															<td height="20" align="left" class="txt">基金经理： 童汀 等
															</td>
														</tr>
														<tr>
															<td height="20" align="left" class="txt">规 模：
																81.36亿元（14-03-31）</td>
															<td height="20" align="left" class="txt">评级： 5星</td>
														</tr>
													</table>
													<table width="330" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td align="left" class="title">经办律师：王律师 <br />
																联系方式：0571-85387122 QQ:123123333
															</td>
														</tr>
													</table></td>
											</tr>
										</table></td>
									<td width="438" height="160" align="left"><table
											width="434" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="110"><img src="../images/photo.jpg" width="84"
													height="118" /></td>
												<td align="left"><table width="330" border="0"
														cellpadding="0" cellspacing="0">
														<tr>
															<td height="30" align="left" class="title">
																工银绝对收益混合发起B 代码：000672</td>
														</tr>
													</table>
													<table width="330" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="20" colspan="2" align="left" class="txt">单位净值（2014-05-27）：1.0570（-0.28%）</td>
														</tr>
														<tr>
															<td height="18" align="left" class="txt">类 型：
																混合型|中高风险</td>
															<td height="18" align="left" class="txt">成 立 日：
																2001-12-18</td>
														</tr>
														<tr>
															<td height="20" align="left" class="txt">管 理 人： 华夏基金</td>
															<td height="20" align="left" class="txt">基金经理： 童汀 等
															</td>
														</tr>
														<tr>
															<td height="20" align="left" class="txt">规 模：
																81.36亿元（14-03-31）</td>
															<td height="20" align="left" class="txt">评级： 5星</td>
														</tr>
													</table>
													<table width="330" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td align="left" class="title">经办律师：王律师 <br />
																联系方式：0571-85387122 QQ:123123333
															</td>
														</tr>
													</table></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td background="../images/l7.jpg"><img src="../images/l7.jpg"
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
				<table width="945" border="0" cellpadding="0" cellspacing="0"
					class="mbg">
					<tr>
						<td width="14">&nbsp;</td>
						<td width="323" height="110" valign="top"><table width="85%"
								border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="22">&nbsp;</td>
								</tr>
							</table>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="22"><img src="../images/d1.jpg" width="323"
										height="50" /></td>
								</tr>
							</table>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="22">&nbsp;</td>
								</tr>
							</table>
							<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="../images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%" height="33">某金融机构高管个人经营借款风险调查</td>
								</tr>
							</table>
							<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="../images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%" height="33">某金融机构高管个人经营借款风险调查</td>
								</tr>
							</table>
							<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="../images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%">某金融机构高管个人经营借款风险调查</td>
								</tr>
							</table>
							<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="../images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%" height="33">某金融机构高管个人经营借款风险调查</td>
								</tr>
							</table>
							<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="../images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%" height="33">某金融机构高管个人经营借款风险调查</td>
								</tr>
							</table>
							<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="../images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%">某金融机构高管个人经营借款风险调查</td>
								</tr>
							</table></td>
						<td width="12"><img src="../images/ge.jpg" width="12"
							height="281" /></td>
						<td width="307" valign="top"><table width="85%" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td height="22">&nbsp;</td>
								</tr>
							</table>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="22"><img src="../images/lv.jpg" width="307"
										height="50" /></td>
								</tr>
							</table>
							<table width="93%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="177" align="left" valign="top"><span
										class="title">徐 雳 主任律师 </span><br /> <span class="search_txt">中国民主建国会会员<br />
											浙江大学法学硕士<br /> 清华大学总裁班结业<br /> 浙江法商学院客座教授、<br /> 经济师资格、<br />
											具有SAC一级证券从业资格、<br /> 会计从业资格<br /> 民建杭州下城区五支部副主任<br />
											杭州台州商会副会长<br /> 民建杭州市企业家协会常务理事
									</span></td>
									<td width="117" align="right" valign="top"><br /> <img
										src="../images/photo.jpg" width="84" height="118" /></td>
								</tr>
							</table></td>
						<td width="12" valign="middle" class="copyright"><p>
								&nbsp;&nbsp;&nbsp;<img src="../images/ge.jpg" width="12"
									height="281" /><br />
							</p></td>
						<td width="259" valign="middle" class="copyright"><img
							src="../images/ad2.jpg" width="266" height="281" /></td>
						<td width="18" valign="middle" class="copyright">&nbsp;</td>
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
	
	
<%-- <%@ include file="../common/footer.html"%>	 --%>
<jsp:include page="../common/footer.jsp" flush="true"/>

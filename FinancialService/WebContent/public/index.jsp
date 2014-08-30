<%@page import="model.GuaranteeCategory"%>
<%@page import="java.util.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="org.nutz.dao.impl.*"%>
<%@page import="org.nutz.dao.*"%>
<%@page import="model.*"%>
<%@page import="database.Connections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<%
DataSource dataSource = Connections.getDataSource();
Dao dao = new NutDao(dataSource);
List<Article> articles = dao.query(Article.class, Cnd.where("status", "=", 1L).limit(6).desc("level").desc("id"));
pageContext.setAttribute("articles", articles);

List<Rzsj> rzsjs = dao.query(Rzsj.class, Cnd.NEW().limit(2).desc("id"));
pageContext.setAttribute("rzsjs", rzsjs);

List<Jrtj> jrtjs = dao.query(Jrtj.class, Cnd.NEW().limit(2).desc("id"));
pageContext.setAttribute("jrtjs", jrtjs);


/*Display one item of lawyer information  Will Zhou  8/22/2014*/
List<Lawyer> lawyers = dao.query(Lawyer.class, Cnd.where("status", "=", 1L).limit(1).desc("id"));
pageContext.setAttribute("lawyers", lawyers);

List<Financing> financings = dao.query(Financing.class, Cnd.where("status", "=", "1").limit(dao.createPager(0, 6)));
for (Financing item : financings) {  
    dao.fetchLinks(item, null);
}
pageContext.setAttribute("financings", financings);
%>
<jsp:include page="../common/header.jsp" flush="true"/> 
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />

	<!-- <table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="5" bgcolor="#FFFFFF"><img src="../images/space.gif"
				width="2" height="2" /></td>
		</tr>
	</table> -->
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="312" align="center" bgcolor="#AF190B"><table
					width="945" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><img src="${ctx}/images/Banner01.jpg" width="945" height="312" /></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="10" bgcolor="#CCCCCC"><img src="${ctx}/images/space.gif"
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
						<td width="195" height="110"><a href="${ctx}/public/wyrz.jsp"><img
								src="${ctx}/images/an01.jpg" border="0" width="184" height="61"
								id="Image1"
								onmouseover="MM_swapImage('Image1','','../images/an012.jpg',1)"
								onmouseout="MM_swapImgRestore()" /></a></td>
						<td width="212"><a href="${ctx}/public/invest.jsp"><img src="${ctx}/images/an02.jpg"
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
								&nbsp;&nbsp;&nbsp;<a href="#"><img src="${ctx}/images/search.jpg"
									border="0" width="24" height="23" /></a><br /> 快速搜索
							</p></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="${ctx}/images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="${ctx}/images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="${ctx}/images/d1.gif" width="441"
										height="27" /></td>
									<td width="84%" align="right"><img src="${ctx}/images/wetuo.gif"
										width="84" height="18" /></td>
								</tr>
							</table></td>
						<td width="27" bgcolor="#FFFFFF"><img src="${ctx}/images/l6.jpg"
							width="27" height="41" /></td>
					</tr>
					<tr>
						<td background="${ctx}/images/L2.jpg"><img src="${ctx}/images/L2.jpg"
							width="31" height="179" /></td>
						<td align="center" bgcolor="#E5E3E4"><table width="98%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="465"><table width="96%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td height="20" align="center"><img
													src="${ctx}/images/space.gif" width="2" height="2" /></td>
											</tr>
										</table>
										<table width="96%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td align="center"><img src="${ctx}/images/tz01.gif"
													width="435" height="52" /></td>
											</tr>
										</table>
										<table width="96%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td align="center"><img src="${ctx}/images/tz02.gif"
													width="435" height="52" /></td>
											</tr>
										</table>
										<table width="96%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td align="center"><img src="${ctx}/images/tz03.gif"
													width="435" height="52" /></td>
											</tr>
										</table></td>
									<td width="47%"><table width="99%" border="0"
											cellpadding="0" cellspacing="0" class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="${ctx}/images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="${ctx}/images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="${ctx}/images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="${ctx}/images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="${ctx}/images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table>
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="news2">
											<tr>
												<td width="18%" align="center"><img
													src="${ctx}/images/jiantou.gif" width="8" height="9" /></td>
												<td width="82%">某金融机构高管个人经营借款风险调查</td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td background="${ctx}/images/l7.jpg"><img src="${ctx}/images/l7.jpg"
							width="27" height="179" /></td>
					</tr>
					<tr>
						<td height="23" bgcolor="#FFFFFF"><img src="${ctx}/images/L3.jpg"
							width="31" height="23" /></td>
						<td background="${ctx}/images/L5.jpg">&nbsp;</td>
						<td bgcolor="#FFFFFF"><img src="${ctx}/images/l8.jpg" width="27"
							height="23" /></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="${ctx}/images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="${ctx}/images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="${ctx}/images/rz.gif" width="178"
										height="27" /></td>
									<td width="84%" align="right"><img src="${ctx}/images/wetuo.gif"
										width="84" height="18" /></td>
								</tr>
							</table></td>
						<td width="27" bgcolor="#FFFFFF"><img src="${ctx}/images/l6.jpg"
							width="27" height="41" /></td>
					</tr>
					<tr>
						<td background="${ctx}/images/la1.gif"><img src="${ctx}/images/la1.gif"
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
										src="${ctx}/images/space.gif" width="2" height="2" /></td>
								</tr>
							</table>
							<c:forEach var="item" items="${financings}">
							<table width="95%" border="0" cellpadding="0" cellspacing="0"
								class="news2">
								<tr>
									<td width="180" align="center">${item.amount}</td>
									<td width="135" align="center">${item.period.time}</td>
									<td width="117" align="center">${item.rate}</td>
									<td width="100" align="center">${item.guaranteeCategory.name}</td>
									<td width="100" align="center"><fmt:formatDate value="${item.publishDate}" pattern="yyyy-MM-dd"/></td>
									<td width="100" align="center"><c:if test="${item.status == 1}">审核</c:if><c:if test="${item.status != 1}">未审核</c:if></td>
									<td width="108" align="center"><a href="rzdetail.jsp?id=${item.id}">详细情况</a></td>
								</tr>
							</table>
							</c:forEach>
						</td>
						<td background="${ctx}/images/la2.gif"><img src="${ctx}/images/la2.gif"
							width="27" height="19" /></td>
					</tr>
					<tr>
						<td height="21" bgcolor="#FFFFFF"><img src="${ctx}/images/la4.gif"
							width="31" height="21" /></td>
						<td background="${ctx}/images/la5.gif"><img src="${ctx}/images/la5.gif"
							width="28" height="21" /></td>
						<td bgcolor="#FFFFFF"><img src="${ctx}/images/la3.gif" width="27"
							height="21" /></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="110" align="center" bgcolor="#FFFFFF"><p>
								<img src="${ctx}/images/ad01.gif" width="919" height="119" /><br />
							</p></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="${ctx}/images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="${ctx}/images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="${ctx}/images/rz2.gif" width="482"
										height="27" /></td>
									<td width="84%" align="right"><img src="${ctx}/images/wetuo.gif"
										width="84" height="18" /></td>
								</tr>
							</table></td>
						<td width="27" bgcolor="#FFFFFF"><img src="${ctx}/images/l6.jpg"
							width="27" height="41" /></td>
					</tr>
					<tr>
						<td background="${ctx}/images/la1.gif"><img src="${ctx}/images/la1.gif"
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
																		<td width="100"><img src="${rzsjs[0].pic}"
																			width="82" height="121" /></td>
																		<td><table width="95%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td height="30" align="left" class="title">
																						${rzsjs[0].name}</td>
																				</tr>
																			</table>
																			<table width="95%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td height="35" align="left" class="txt">${rzsjs[0].context}</td>
																				</tr>
																			</table>
																			<table width="98%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td height="35" align="left" class="txt2">金额：${rzsjs[0].amount}
																						年利率：${rzsjs[0].rate}期限：${rzsjs[0].duration} 进度${rzsjs[0].progress}</td>
																				</tr>
																			</table>
																			<table width="95%" border="0" cellpadding="0"
																				cellspacing="0">
																				<tr>
																					<td align="left" class="title">经办律师：${rzsjs[0].layer} <br />
																						联系方式：${rzsjs[0].contact}
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
												<td width="100"><img src="${rzsjs[1].pic}" width="82"
													height="121" /></td>
												<td><table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="30" align="left" class="title">
																${rzsjs[1].name}</td>
														</tr>
													</table>
													<table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="35" align="left" class="txt">${rzsjs[1].context}</td>
														</tr>
													</table>
													<table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="35" align="left" class="txt2">金额：${rzsjs[1].amount}
                                                                                                                                                                                                                        年利率：${rzsjs[1].rate}期限：${rzsjs[1].duration} 进度${rzsjs[1].progress}</td>
														</tr>
													</table>
													<table width="95%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td align="left" class="title">经办律师：${rzsjs[1].layer}<br />
																联系方式：${rzsjs[1].contact}
															</td>
														</tr>
													</table></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td background="${ctx}/images/la2.gif">&nbsp;</td>
					</tr>
					<tr>
						<td height="21" bgcolor="#FFFFFF"><img src="${ctx}/images/la4.gif"
							width="31" height="21" /></td>
						<td background="${ctx}/images/la5.gif"><img src="${ctx}/images/la5.gif"
							width="28" height="21" /></td>
						<td bgcolor="#FFFFFF"><img src="${ctx}/images/la3.gif" width="27"
							height="21" /></td>
					</tr>
				</table>
				<table width="945" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30" bgcolor="#FFFFFF"><img src="${ctx}/images/L1.jpg"
							width="31" height="41" /></td>
						<td valign="middle" background="${ctx}/images/L4.jpg"><table
								width="99%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="16%"><img src="${ctx}/images/rz3.gif" width="482"
										height="27" /></td>
									<td width="84%" align="right"><img src="${ctx}/images/wetuo.gif"
										width="84" height="18" /></td>
								</tr>
							</table></td>
						<td width="27" bgcolor="#FFFFFF"><img src="${ctx}/images/l6.jpg"
							width="27" height="41" /></td>
					</tr>
					<tr>
						<td background="${ctx}/images/L2.jpg"><img src="${ctx}/images/L2.jpg"
							width="31" height="179" /></td>
						<td height="200" align="center" bgcolor="#E5E3E4"><table
								width="99%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="438"><table width="434" border="0"
											cellspacing="0" cellpadding="0">
											<tr>
												<td width="110"><img src="${jrtjs[0].pic}" width="84"
													height="118" /></td>
												<td align="left"><table width="330" border="0"
														cellpadding="0" cellspacing="0">
														<tr>
															<td height="30" align="left" class="title">
																${jrtjs[0].name} 代码：${jrtjs[0].code}</td>
														</tr>
													</table>
													<table width="330" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="20" colspan="2" align="left" class="txt">单位净值（${jrtjs[0].iopvdate}）：${jrtjs[0].iopv}</td>
														</tr>
														<tr>
															<td height="18" align="left" class="txt">类 型：
																${jrtjs[0].type}</td>
															<td height="18" align="left" class="txt">成 立 日：
																${jrtjs[0].startdate}</td>
														</tr>
														<tr>
															<td height="20" align="left" class="txt">管 理 人： ${jrtjs[0].admin}</td>
															<td height="20" align="left" class="txt">基金经理：${jrtjs[0].manager}
															</td>
														</tr>
														<tr>
															<td height="20" align="left" class="txt">规 模：
																${jrtjs[0].scale}</td>
															<td height="20" align="left" class="txt">评级：${jrtjs[0].grade}星</td>
														</tr>
													</table>
													<table width="330" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td align="left" class="title">经办律师：${jrtjs[0].layer} <br />
																联系方式：${jrtjs[0].contact}
															</td>
														</tr>
													</table></td>
											</tr>
										</table></td>
									<td width="438" height="160" align="left"><table
											width="434" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="110"><img src="${jrtjs[1].pic}" width="84"
                                                    height="118" /></td>
                                                <td align="left"><table width="330" border="0"
                                                        cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="30" align="left" class="title">
                                                                ${jrtjs[1].name} 代码：${jrtjs[1].code}</td>
                                                        </tr>
                                                    </table>
                                                    <table width="330" border="0" cellpadding="0"
                                                        cellspacing="0">
                                                        <tr>
                                                            <td height="20" colspan="2" align="left" class="txt">单位净值（${jrtjs[1].iopvdate}）：${jrtjs[1].iopv}</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="18" align="left" class="txt">类 型：
                                                                ${jrtjs[1].type}</td>
                                                            <td height="18" align="left" class="txt">成 立 日：
                                                                ${jrtjs[1].startdate}</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="20" align="left" class="txt">管 理 人： ${jrtjs[1].admin}</td>
                                                            <td height="20" align="left" class="txt">基金经理：${jrtjs[1].manager}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="20" align="left" class="txt">规 模：
                                                                ${jrtjs[1].scale}</td>
                                                            <td height="20" align="left" class="txt">评级：${jrtjs[1].grade}星</td>
                                                        </tr>
                                                    </table>
                                                    <table width="330" border="0" cellpadding="0"
                                                        cellspacing="0">
                                                        <tr>
                                                            <td align="left" class="title">经办律师：${jrtjs[1].layer} <br />
                                                                                                                                                                                                                            联系方式：${jrtjs[1].contact}
                                                            </td>
                                                        </tr>
                                                    </table></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td background="${ctx}/images/l7.jpg"><img src="${ctx}/images/l7.jpg"
							width="27" height="179" /></td>
					</tr>
					<tr>
						<td height="23" bgcolor="#FFFFFF"><img src="${ctx}/images/L3.jpg"
							width="31" height="23" /></td>
						<td background="${ctx}/images/L5.jpg">&nbsp;</td>
						<td bgcolor="#FFFFFF"><img src="${ctx}/images/l8.jpg" width="27"
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
									<td height="22"><a href="${ctx}/public/articlelist.jsp"><img src="${ctx}/images/d1.jpg" width="323"
										height="50" /></a></td>
								</tr>
							</table>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="22">&nbsp;</td>
								</tr>
							</table>
							<c:forEach var="item" items="${articles}">
							<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="${ctx}/images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%" height="33"><a href="${ctx}/public/articledetail.jsp?id=${item.id}">${item.title}</a></td>
								</tr>
							</table>
							</c:forEach>
						</td>
						<td width="12"><img src="${ctx}/images/ge.jpg" width="12"
							height="281" /></td>
						<td width="307" valign="top"><table width="85%" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td height="22">&nbsp;</td>
								</tr>
							</table>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="22"><img src="${ctx}/images/lv.jpg" width="307"
										height="50" /></td>
								</tr>
							</table>
							
							<c:forEach var="item" items="${lawyers}">
							<table width="93%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="177" align="left" valign="top"><span
										class="title">${item.name} ${item.title} </span><br /> <span class="search_txt">${item.description}
									</span></td>
									<td width="117" align="right" valign="top"><br /> <img
										src="${ctx}/upload/${item.figure_path}" width="84" height="118" /></td>
								</tr>
							</table>
							
							
							
							
						<%-- 	<table width="97%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="news2">
								<tr>
									<td width="30" align="center"><img src="${ctx}/images/jian.jpg"
										width="15" height="15" /></td>
									<td width="88%" height="33"><a href="${ctx}/public/articledetail.jsp?id=${item.id}">${item.title}</a></td>
								</tr>
							</table> --%>
							</c:forEach>
							
							
							<%-- <table width="93%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="177" align="left" valign="top"><span
										class="title">徐 雳 主任律师 </span><br /> <span class="search_txt">中国民主建国会会员<br />
											浙江大学法学硕士<br /> 清华大学总裁班结业<br /> 浙江法商学院客座教授、<br /> 经济师资格、<br />
											具有SAC一级证券从业资格、<br /> 会计从业资格<br /> 民建杭州下城区五支部副主任<br />
											杭州台州商会副会长<br /> 民建杭州市企业家协会常务理事
									</span></td>
									<td width="117" align="right" valign="top"><br /> <img
										src="${ctx}/images/photo.jpg" width="84" height="118" /></td>
								</tr>
							</table> --%></td>
						<td width="12" valign="middle" class="copyright"><p>
								&nbsp;&nbsp;&nbsp;<img src="${ctx}/images/ge.jpg" width="12"
									height="281" /><br />
							</p></td>
						<td width="259" valign="middle" class="copyright"><img
							src="${ctx}/images/ad2.jpg" width="266" height="281" /></td>
						<td width="18" valign="middle" class="copyright">&nbsp;</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="8"><img src="${ctx}/images/space.gif" width="2"
							height="2" /></td>
					</tr>
				</table></td>
		</tr>
	</table>
	
	
<%-- <%@ include file="${ctx}/common/footer.html"%>	 --%>
<jsp:include page="../common/footer.jsp" flush="true"/>

 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%>  
 <%@ include file="../check/index.jsp"%> 
 <%//@ include file="../check/checkAdmin.jsp"%>  
 <%String checkedName = (String)session.getAttribute("loginedUserName"); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 
	 <%@ include file="../include/tableCSS.jsp"%> 

  </head>

  <body>
 
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../sys";
	String info = null;
	String type = request.getParameter("type");
	String financialID_tostring = request.getParameter("FId");
	if(null==type||type.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
<%		
	}else{
		if(type.equals("edit")){ //编辑
			//System.out.println("edit\n");
			if(null==financialID_tostring||financialID_tostring.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%
			}
			else{
				int id = Integer.parseInt(financialID_tostring);
				String datetime_tostring = request.getParameter("form_datetime"+id);
				if(null==datetime_tostring||datetime_tostring.equals("")){
					//System.out.println("editdatetimenull\n");
	%>
					<script language='javascript' type='text/javascript'>
						window.location = "<%=url%>";
					</script>
	<%				
				 }else{
					FinancialDao financialDao = new FinancialDao();

					String shopID_tostring = request.getParameter("shopSelect"+id);
					if(null==shopID_tostring||shopID_tostring.equals("")){
						//System.out.println("shopnull\n");
					%>
						<script language='javascript' type='text/javascript'>
							window.location = "<%=url%>";
						</script>
					<%				
					}else{
						//TODO
						UserDao user = new UserDao();
						//int userID = 2;
						int userID = user.getUserID(checkedName);
						int shopID = Integer.parseInt(shopID_tostring);
						//System.out.println("shopID:" + shopID + "\n");
						String chartDate = request.getParameter("form_datetime"+id);
						String Cash_tostring = request.getParameter("Cash"+id);
						String ShuaKa_tostring = request.getParameter("ShuaKa"+id);
						String YaGaoKa_tostring = request.getParameter("YaGaoKa"+id);
						String ThirtyDaiJinQuan_tostring = request.getParameter("ThirtyDaiJinQuan"+id);
						String FiftyDaiJinQuan_tostring = request.getParameter("FiftyDaiJinQuan"+id);
						String TongKa_tostring = request.getParameter("TongKa"+id);
						String MeiTuan_tostring = request.getParameter("MeiTuan"+id);
						String NuoMi_tostring = request.getParameter("NuoMi"+id);
						String DianPing_tostring = request.getParameter("DianPing"+id);
						String ElevenDaiJinQuan_tostring = request.getParameter("ElevenDaiJinQuan"+id);
						
						String PreVipCash_tostring = request.getParameter("PreVipCash"+id);
						String PreVipShuaKa_tostring = request.getParameter("PreVipShuaKa"+id);
						String PreTongKaCash_tostring = request.getParameter("PreTongKaCash"+id);
						String PreTongKaShuaKa_tostring = request.getParameter("PreTongKaShuaKa"+id);
						
						String StandardSeats_tostring = request.getParameter("StandardSeats"+id);
						String ActualitySeats_tostring = request.getParameter("ActualitySeats"+id);
						String StandardDesks_tostring = request.getParameter("StandardDesks"+id);
						String ActualityDesks_tostring = request.getParameter("ActualityDesks"+id);
						String NoPeopleDesks_tostring = request.getParameter("NoPeopleDesks"+id);
						
						if((null==chartDate)||(chartDate.equals(""))
								||(null==Cash_tostring)||(Cash_tostring.equals(""))
								||(null==ShuaKa_tostring)||(ShuaKa_tostring.equals(""))
								||(null==YaGaoKa_tostring)||(YaGaoKa_tostring.equals(""))
								||(null==ThirtyDaiJinQuan_tostring)||(ThirtyDaiJinQuan_tostring.equals(""))
								||(null==FiftyDaiJinQuan_tostring)||(FiftyDaiJinQuan_tostring.equals(""))
								||(null==TongKa_tostring)||(TongKa_tostring.equals(""))
								||(null==MeiTuan_tostring)||(NuoMi_tostring.equals(""))
								||(null==NuoMi_tostring)||(NuoMi_tostring.equals(""))
								||(null==DianPing_tostring)||(DianPing_tostring.equals(""))
								||(null==ElevenDaiJinQuan_tostring)||(ElevenDaiJinQuan_tostring.equals(""))
								
								||(null==PreVipCash_tostring)||(PreVipCash_tostring.equals(""))
								||(null==PreVipShuaKa_tostring)||(PreVipShuaKa_tostring.equals(""))
								||(null==PreTongKaCash_tostring)||(PreTongKaCash_tostring.equals(""))
								||(null==PreTongKaShuaKa_tostring)||(PreTongKaShuaKa_tostring.equals(""))
								
								||(null==StandardSeats_tostring)||(ActualitySeats_tostring.equals(""))
								||(null==ActualitySeats_tostring)||(ActualitySeats_tostring.equals(""))
								||(null==StandardDesks_tostring)||(StandardDesks_tostring.equals(""))
								||(null==ActualityDesks_tostring)||(ActualityDesks_tostring.equals(""))
								||(null==NoPeopleDesks_tostring)||(NoPeopleDesks_tostring.equals(""))
								
						){
						%>
							<script language='javascript' type='text/javascript'>
								window.location = "<%=url%>";
							</script>
						<%}else{
							
							double Cash = Double.parseDouble(Cash_tostring);
							double ShuaKa = Double.parseDouble(ShuaKa_tostring);
							double YaGaoKa = Double.parseDouble(YaGaoKa_tostring);
							int ThirtyDaiJinQuan = Integer.parseInt(ThirtyDaiJinQuan_tostring);
							int FiftyDaiJinQuan = Integer.parseInt(FiftyDaiJinQuan_tostring);
							double TongKa = Double.parseDouble(TongKa_tostring);
							double MeiTuan = Double.parseDouble(MeiTuan_tostring);
							double NuoMi = Double.parseDouble(NuoMi_tostring);
							double DianPing = Double.parseDouble(DianPing_tostring);
							int ElevenDaiJinQuan = Integer.parseInt(ElevenDaiJinQuan_tostring);
							
							double PreVipCash = Double.parseDouble(PreVipCash_tostring);
							double PreVipShuaKa = Double.parseDouble(PreVipShuaKa_tostring);
							double PreTongKaCash = Double.parseDouble(PreTongKaCash_tostring);
							double PreTongKaShuaKa = Double.parseDouble(PreTongKaShuaKa_tostring);
							
							int StandardSeats = Integer.parseInt(StandardSeats_tostring);
							int ActualitySeats = Integer.parseInt(ActualitySeats_tostring);
							int StandardDesks = Integer.parseInt(StandardDesks_tostring);
							int ActualityDesks = Integer.parseInt(ActualityDesks_tostring);
							int NoPeopleDesks = Integer.parseInt(NoPeopleDesks_tostring);
							
							financialDao.modifyFinancial(id, userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks);
						}
						//financialDao.modifyFinancialByAdmin(chartID, userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks, deleteChart)
					}
				}
			}
		}
		else if(type.equals("new")){ //新建
			//System.out.println("new\n");
			String datetime_tostring = request.getParameter("form_datetimeNew");
			if(null==datetime_tostring||datetime_tostring.equals("")){
				System.out.println("new-datetimenull\n");
%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
<%				
			 }else{
			 	String shopID_tostring = request.getParameter("shopSelectNew");
				if(null==shopID_tostring||shopID_tostring.equals("")){
					System.out.println("Newshopnull\n");
				%>
					<script language='javascript' type='text/javascript'>
						window.location = "<%=url%>";
					</script>
				<%				
				}else{
				 
					FinancialDao financialDao = new FinancialDao();
					//String telephone = request.getParameter("telephone" + id);
						
					String chartDate = request.getParameter("form_datetimeNew");
					String Cash_tostring = request.getParameter("CashNew");
					String ShuaKa_tostring = request.getParameter("ShuaKaNew");
					String YaGaoKa_tostring = request.getParameter("YaGaoKaNew");
					String ThirtyDaiJinQuan_tostring = request.getParameter("ThirtyDaiJinQuanNew");
					String FiftyDaiJinQuan_tostring = request.getParameter("FiftyDaiJinQuanNew");
					String TongKa_tostring = request.getParameter("TongKaNew");
					String MeiTuan_tostring = request.getParameter("MeiTuanNew");
					String NuoMi_tostring = request.getParameter("NuoMiNew");
					String DianPing_tostring = request.getParameter("DianPingNew");
					String ElevenDaiJinQuan_tostring = request.getParameter("ElevenDaiJinQuanNew");
					
					String PreVipCash_tostring = request.getParameter("PreVipCashNew");
					String PreVipShuaKa_tostring = request.getParameter("PreVipShuaKaNew");
					String PreTongKaCash_tostring = request.getParameter("PreTongKaCashNew");
					String PreTongKaShuaKa_tostring = request.getParameter("PreTongKaShuaKaNew");
					
					String StandardSeats_tostring = request.getParameter("StandardSeatsNew");
					String ActualitySeats_tostring = request.getParameter("ActualitySeatsNew");
					String StandardDesks_tostring = request.getParameter("StandardDesksNew");
					String ActualityDesks_tostring = request.getParameter("ActualityDesksNew");
					String NoPeopleDesks_tostring = request.getParameter("NoPeopleDesksNew");
					
					/*
					System.out.println("3:" + chartDate + ","+ "4:" + Cash_tostring + ","+ "5:" + ShuaKa_tostring + ","
							+ "6:" + YaGaoKa_tostring + ","+ "7:" + ThirtyDaiJinQuan_tostring + ","+ "8:" + FiftyDaiJinQuan_tostring + ","+ "9:" + TongKa_tostring + ","+ "10:" + MeiTuan_tostring
							+ ","+ "11:" + NuoMi_tostring + ","+ "12:" + DianPing_tostring + ","+ "13:" + ElevenDaiJinQuan_tostring + ","+ "14:" + PreVipCash_tostring + ","
							+ "15:" + PreVipShuaKa_tostring + ","+ "16:" + PreTongKaCash_tostring + ","+ "17:" + PreTongKaShuaKa_tostring + ","+ "18:" + StandardSeats_tostring + ","
							+ "19:" + ActualitySeats_tostring + ","+ "20:" + StandardDesks_tostring + ","+ "21:" + ActualityDesks_tostring + ","+ "22:" + NoPeopleDesks_tostring);
					*/
					
					if((null==chartDate)||(chartDate.equals(""))
							||(null==Cash_tostring)||(Cash_tostring.equals(""))
							||(null==ShuaKa_tostring)||(ShuaKa_tostring.equals(""))
							||(null==YaGaoKa_tostring)||(YaGaoKa_tostring.equals(""))
							||(null==ThirtyDaiJinQuan_tostring)||(ThirtyDaiJinQuan_tostring.equals(""))
							||(null==FiftyDaiJinQuan_tostring)||(FiftyDaiJinQuan_tostring.equals(""))
							||(null==TongKa_tostring)||(TongKa_tostring.equals(""))
							||(null==MeiTuan_tostring)||(NuoMi_tostring.equals(""))
							||(null==NuoMi_tostring)||(NuoMi_tostring.equals(""))
							||(null==DianPing_tostring)||(DianPing_tostring.equals(""))
							||(null==ElevenDaiJinQuan_tostring)||(ElevenDaiJinQuan_tostring.equals(""))
							
							||(null==PreVipCash_tostring)||(PreVipCash_tostring.equals(""))
							||(null==PreVipShuaKa_tostring)||(PreVipShuaKa_tostring.equals(""))
							||(null==PreTongKaCash_tostring)||(PreTongKaCash_tostring.equals(""))
							||(null==PreTongKaShuaKa_tostring)||(PreTongKaShuaKa_tostring.equals(""))
							
							||(null==StandardSeats_tostring)||(ActualitySeats_tostring.equals(""))
							||(null==ActualitySeats_tostring)||(ActualitySeats_tostring.equals(""))
							||(null==StandardDesks_tostring)||(StandardDesks_tostring.equals(""))
							||(null==ActualityDesks_tostring)||(ActualityDesks_tostring.equals(""))
							||(null==NoPeopleDesks_tostring)||(NoPeopleDesks_tostring.equals(""))
							
					){
						//System.out.println("new-contentnull\n");
					%>
						<script language='javascript' type='text/javascript'>
							window.location = "<%=url%>";
						</script>
					<%}else{
						
						//int userID = 2;
						UserDao user = new UserDao();
						int userID = user.getUserID(checkedName);
						int shopID = Integer.parseInt(shopID_tostring);;
						
						double Cash = Integer.parseInt(Cash_tostring);
						double ShuaKa = Double.parseDouble(ShuaKa_tostring);
						double YaGaoKa = Double.parseDouble(YaGaoKa_tostring);
						int ThirtyDaiJinQuan = Integer.parseInt(ThirtyDaiJinQuan_tostring);
						int FiftyDaiJinQuan = Integer.parseInt(FiftyDaiJinQuan_tostring);
						double TongKa = Double.parseDouble(TongKa_tostring);
						double MeiTuan = Double.parseDouble(MeiTuan_tostring);
						double NuoMi = Double.parseDouble(NuoMi_tostring);
						double DianPing = Double.parseDouble(DianPing_tostring);
						int ElevenDaiJinQuan = Integer.parseInt(ElevenDaiJinQuan_tostring);
						
						double PreVipCash = Double.parseDouble(PreVipCash_tostring);
						double PreVipShuaKa = Double.parseDouble(PreVipShuaKa_tostring);
						double PreTongKaCash = Double.parseDouble(PreTongKaCash_tostring);
						double PreTongKaShuaKa = Double.parseDouble(PreTongKaShuaKa_tostring);
						
						int StandardSeats = Integer.parseInt(StandardSeats_tostring);
						int ActualitySeats = Integer.parseInt(ActualitySeats_tostring);
						int StandardDesks = Integer.parseInt(StandardDesks_tostring);
						int ActualityDesks = Integer.parseInt(ActualityDesks_tostring);
						int NoPeopleDesks = Integer.parseInt(NoPeopleDesks_tostring);
						
						/*
						System.out.println("1:" + userID + ","+ "2:" + shopID + ","+ "3:" + chartDate + ","+ "4:" + Cash + ","+ "5:" + ShuaKa + ","
								+ "6:" + YaGaoKa + ","+ "7:" + ThirtyDaiJinQuan + ","+ "8:" + FiftyDaiJinQuan + ","+ "9:" + TongKa + ","+ "10:" + MeiTuan
								+ ","+ "11:" + NuoMi + ","+ "12:" + DianPing + ","+ "13:" + ElevenDaiJinQuan + ","+ "14:" + PreVipCash + ","
								+ "15:" + PreVipShuaKa + ","+ "16:" + PreTongKaCash + ","+ "17:" + PreTongKaShuaKa + ","+ "18:" + StandardSeats + ","
								+ "19:" + ActualitySeats + ","+ "20:" + StandardDesks + ","+ "21:" + ActualityDesks + ","+ "22:" + NoPeopleDesks);
						*/
						financialDao.insertFinancial(userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks);
						//financialDao.modifyFinancialByAdmin(id, userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks, 0);
					}
					//financialDao.modifyFinancialByAdmin(chartID, userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks, deleteChart)
				}
			}
		}
	}
	
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>

</body>
</html>
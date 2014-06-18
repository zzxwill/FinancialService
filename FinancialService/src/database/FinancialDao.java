package database;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*; 
import java.text.*;


import database.Connections;
import database.UserDao;

public class FinancialDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;

	public int userID = 0;
	public String userName = null;
	public int shopID = 0; 
	public String shopName = null;
	public String chartDate = null; 
	public double Sum = 0.00;
	public double Cash = 0.00;
	public double ShuaKa = 0.00; 
	public double YaGaoKa = 0.00; 
	public int ThirtyDaiJinQuan = 0; 
	public int FiftyDaiJinQuan = 0;
	public double TongKa = 0.00; 
	public double MeiTuan = 0.00; 
	public double NuoMi = 0.00; 
	public double DianPing = 0.00; 
	public int ElevenDaiJinQuan = 0;
	public double PreVipRecharge = 0.00;
	public double PreVipCash = 0.00; 
	public double PreVipShuaKa = 0.00; 
	public double PreTongKaRecharge = 0.00;
	public double PreTongKaCash = 0.00; 
	public double PreTongKaShuaKa = 0.00;
	public int StandardSeats = 0; 
	public int ActualitySeats = 0; 
	public double SeatRate = 0.00;
	public int StandardDesks = 0; 
	public int ActualityDesks = 0;
	public double DeskRate = 0.00;
	public int NoPeopleDesks = 0;
	//public int deleteChart = 0;
	
	
	//新建财务表，共22个参数
	public void insertFinancial(int userID, int shopID, String chartDate, double Cash, 
			double ShuaKa, double YaGaoKa, int ThirtyDaiJinQuan, int FiftyDaiJinQuan,
			double TongKa, double MeiTuan, double NuoMi, double DianPing, int ElevenDaiJinQuan,
			double PreVipCash, double PreVipShuaKa, double PreTongKaCash, double PreTongKaShuaKa,
			int StandardSeats, int ActualitySeats, int StandardDesks, int ActualityDesks, 
			int NoPeopleDesks) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();
		
		double sum = 0.00;
		double preVipRecharge = 0.00;
		double preTongKaRecharge = 0.00;
		double seatRate = 0.00;
		double deskRate = 0.00;
		
		//共31列
		String sql = "insert into financialcharts values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int financialID = tool.generateID("financialcharts");
			if (financialID == -1) {
				return;
			}
			//DateFormat d1 = DateFormat.getDateInstance();
			//ps.setDate(arg0, arg1)
			ps.setInt(1, financialID);
			ps.setInt(2, userID);
			ps.setInt(3, shopID);
			ps.setString(4, chartDate);
			
			sum = Cash + ShuaKa + YaGaoKa + 30.00*ThirtyDaiJinQuan + 50.00*FiftyDaiJinQuan
				+ TongKa + MeiTuan + NuoMi + DianPing + 11.00*ElevenDaiJinQuan ;
			ps.setDouble(5, sum);
			
			ps.setDouble(6, Cash);
			ps.setDouble(7, ShuaKa);
			ps.setDouble(8, YaGaoKa);
			ps.setInt(9, ThirtyDaiJinQuan);
			ps.setInt(10, FiftyDaiJinQuan);
			ps.setDouble(11, TongKa);
			ps.setDouble(12, MeiTuan);
			ps.setDouble(13, NuoMi);
			ps.setDouble(14, DianPing);
			ps.setInt(15, ElevenDaiJinQuan);
			
			preVipRecharge = PreVipCash + PreVipShuaKa;
			ps.setDouble(16, preVipRecharge);
			ps.setDouble(17, PreVipCash);
			ps.setDouble(18, PreVipShuaKa);
			
			preTongKaRecharge = PreTongKaCash + PreTongKaShuaKa;
			ps.setDouble(19, preTongKaRecharge);
			ps.setDouble(20, PreTongKaCash);
			ps.setDouble(21, PreTongKaShuaKa);
			
			ps.setInt(22, StandardSeats);
			ps.setInt(23, ActualitySeats);
			seatRate = (double)100.00*ActualitySeats/StandardSeats;
			ps.setDouble(24, seatRate);
			
			ps.setInt(25, StandardDesks);
			ps.setInt(26, ActualityDesks);
			deskRate = (double)100.00*ActualityDesks/StandardDesks;
			ps.setDouble(27, deskRate);
			
			ps.setInt(28, NoPeopleDesks);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(29, ts);
			ps.setTimestamp(30, ts);
			ps.setInt(31, 0);

			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//用户修改财务表信息,共23个参数
	public void modifyFinancial(int chartID, int userID, int shopID, String chartDate, double Cash, 
			double ShuaKa, double YaGaoKa, int ThirtyDaiJinQuan, int FiftyDaiJinQuan,
			double TongKa, double MeiTuan, double NuoMi, double DianPing, int ElevenDaiJinQuan,
			double PreVipCash, double PreVipShuaKa, double PreTongKaCash, double PreTongKaShuaKa,
			int StandardSeats, int ActualitySeats, int StandardDesks, int ActualityDesks, 
			int NoPeopleDesks ) throws SQLException {
		
		conn = Connections.getConnection();
		
		double sum = 0.00;
		double preVipRecharge = 0.00;
		double preTongKaRecharge = 0.00;
		double seatRate = 0.00;
		double deskRate = 0.00;
		
		sum = Cash + ShuaKa + YaGaoKa + 30.00*ThirtyDaiJinQuan + 50.00*FiftyDaiJinQuan
			+ TongKa + MeiTuan + NuoMi + DianPing + 11.00*ElevenDaiJinQuan ;
		preVipRecharge = PreVipCash + PreVipShuaKa;
		preTongKaRecharge = PreTongKaCash + PreTongKaShuaKa;
		seatRate = (double)100.00*ActualitySeats/StandardSeats;
		deskRate = (double)100.00*ActualityDesks/StandardDesks;
		
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		sql = "update financialcharts set userID = '" + userID + "'"
			+ " , sum = '" + sum + "'" 	
			+ " , shopID = '" + shopID + "'" + " , chartDate = '" + chartDate + "'" 
		 	+ " , Cash = '" + Cash + "'" + " , ShuaKa = '" + ShuaKa + "'" 
		 	+ " , YaGaoKa = '" + YaGaoKa + "'" + " , ThirtyDaiJinQuan = '" + ThirtyDaiJinQuan + "'" 
		 	+ " , FiftyDaiJinQuan = '" + FiftyDaiJinQuan + "'" + " , TongKa = '" + TongKa + "'" 
		 	+ " , MeiTuan = '" + MeiTuan + "'" + " , NuoMi = '" + NuoMi + "'" 
		 	+ " , DianPing = '" + DianPing + "'" 
		 	+ " , DianPing = '" + DianPing + "'" 
		 	+ " , preVipRecharge = '" + preVipRecharge + "'" 
		 	+ " , PreVipCash = '" + PreVipCash + "'" + " , PreVipShuaKa = '" + PreVipShuaKa + "'" 
		 	+ " , preTongKaRecharge = '" + preTongKaRecharge + "'"
		 	+ " , PreTongKaCash = '" + PreTongKaCash + "'" + " , PreTongKaShuaKa = '" + PreTongKaShuaKa + "'" 
		 	+ " , StandardSeats = '" + StandardSeats + "'" + " , ActualitySeats = '" + ActualitySeats + "'" 
		 	+ " , seatRate = '" + seatRate + "'" 
		 	+ " , StandardDesks = '" + StandardDesks + "'" + " , ActualityDesks = '" + ActualityDesks + "'" 
		 	+ " , deskRate = '" + deskRate + "'"  
		 	+ " , NoPeopleDesks = '" + NoPeopleDesks + "'" 
		 	+ " , updateDate = '" + ts + "'"
		 	+ " where chartID = " + chartID ;

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//管理员修改财务表信息
	public void modifyFinancialByAdmin(int chartID, int userID, int shopID, String chartDate, double Cash, 
			double ShuaKa, double YaGaoKa, int ThirtyDaiJinQuan, int FiftyDaiJinQuan,
			double TongKa, double MeiTuan, double NuoMi, double DianPing, int ElevenDaiJinQuan,
			double PreVipCash, double PreVipShuaKa, double PreTongKaCash, double PreTongKaShuaKa,
			int StandardSeats, int ActualitySeats, int StandardDesks, int ActualityDesks, 
			int NoPeopleDesks, int deleteChart) throws SQLException {
			
			conn = Connections.getConnection();
			
			double sum = 0.00;
			double preVipRecharge = 0.00;
			double preTongKaRecharge = 0.00;
			double seatRate = 0.00;
			double deskRate = 0.00;
			
			sum = Cash + ShuaKa + YaGaoKa + 30.00*ThirtyDaiJinQuan + 50.00*FiftyDaiJinQuan
				+ TongKa + MeiTuan + NuoMi + DianPing + 11.00*ElevenDaiJinQuan ;
			preVipRecharge = PreVipCash + PreVipShuaKa;
			preTongKaRecharge = PreTongKaCash + PreTongKaShuaKa;
			seatRate = (double)100.00*ActualitySeats/StandardSeats;
			deskRate = (double)100.00*ActualityDesks/StandardDesks;
			
			String sql = null;
			Timestamp ts = new Timestamp(System.currentTimeMillis()); 

			sql = "update financialcharts set userID = '" + userID + "'"
				+ " , sum = '" + sum + "'" 	
				+ " , shopID = '" + shopID + "'" + " , chartDate = '" + chartDate + "'" 
			 	+ " , Cash = '" + Cash + "'" + " , ShuaKa = '" + ShuaKa + "'" 
			 	+ " , YaGaoKa = '" + YaGaoKa + "'" + " , ThirtyDaiJinQuan = '" + ThirtyDaiJinQuan + "'" 
			 	+ " , FiftyDaiJinQuan = '" + FiftyDaiJinQuan + "'" + " , TongKa = '" + TongKa + "'" 
			 	+ " , MeiTuan = '" + MeiTuan + "'" + " , NuoMi = '" + NuoMi + "'" 
			 	+ " , DianPing = '" + DianPing + "'" 
			 	+ " , DianPing = '" + DianPing + "'" 
			 	+ " , preVipRecharge = '" + preVipRecharge + "'" 
			 	+ " , PreVipCash = '" + PreVipCash + "'" + " , PreVipShuaKa = '" + PreVipShuaKa + "'" 
			 	+ " , preTongKaRecharge = '" + preTongKaRecharge + "'"
			 	+ " , PreTongKaCash = '" + PreTongKaCash + "'" + " , PreTongKaShuaKa = '" + PreTongKaShuaKa + "'" 
			 	+ " , StandardSeats = '" + StandardSeats + "'" + " , ActualitySeats = '" + ActualitySeats + "'" 
			 	+ " , seatRate = '" + seatRate + "'" 
			 	+ " , StandardDesks = '" + StandardDesks + "'" + " , ActualityDesks = '" + ActualityDesks + "'" 
			 	+ " , deskRate = '" + deskRate + "'"  
			 	+ " , NoPeopleDesks = '" + NoPeopleDesks + "'" 
			 	+ " , updateDate = '" + ts + "'" + " , deleteChart = '" + deleteChart + "'"
			 	+ " where chartID = " + chartID ;

			try {	
				stmt = conn.createStatement();
				stmt.execute(sql);
				
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	//删除财务表
	public void deleteFinancial(int chartID) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update financialcharts set updateDate = '" + ts + "'"
		+ " , deleteChart = '" + 1 + "'" + " where chartID = " + chartID ;

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询财务表信息
	public void getFinancialInfo(int chartID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from financialcharts where chartID=" + chartID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				
				UserDao userDao = new UserDao();
				ShopDao shopDao = new ShopDao();

				userID = rs.getInt(2);
				userName = userDao.getUserName(userID);
				shopID = rs.getInt(3); 
				shopName = shopDao.getShopName(shopID);
				chartDate = rs.getString(4); 
				Sum = rs.getDouble(5);
				Cash = rs.getDouble(6);
				ShuaKa = rs.getDouble(7); 
				YaGaoKa = rs.getDouble(8); 
				ThirtyDaiJinQuan = rs.getInt(9); 
				FiftyDaiJinQuan = rs.getInt(10);
				TongKa = rs.getDouble(11); 
				MeiTuan = rs.getDouble(12); 
				NuoMi = rs.getDouble(13); 
				DianPing = rs.getDouble(14); 
				ElevenDaiJinQuan = rs.getInt(15);
				PreVipRecharge = rs.getDouble(16);
				PreVipCash = rs.getDouble(17); 
				PreVipShuaKa = rs.getDouble(18); 
				PreTongKaRecharge = rs.getDouble(19);
				PreTongKaCash = rs.getDouble(20); 
				PreTongKaShuaKa = rs.getDouble(21);
				StandardSeats = rs.getInt(22); 
				ActualitySeats = rs.getInt(23); 
				SeatRate = rs.getDouble(24);
				StandardDesks = rs.getInt(25); 
				ActualityDesks = rs.getInt(26);
				DeskRate = rs.getDouble(27);
				NoPeopleDesks = rs.getInt(28);

			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询财务表数量
	public int getFinancialNum() throws SQLException {
		int chartNum = 0;
		conn = Connections.getConnection();
		String sql = "select * from financialcharts ";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				chartNum++;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chartNum;
	}
	
	//查询财务表是否禁用
	public int IsFinancialDel(int chartID) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from financialcharts where chartID = " + chartID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("deleteChart");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}

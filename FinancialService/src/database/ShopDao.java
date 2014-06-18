package database;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import database.Connections;
import database.Tools;

public class ShopDao {
	
	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public int shopID = 0;
	public String shopName = null;
	public String shopKeeper = null; 
	public String shopKeeperTel = null;
	
	public int ShopNum = 0;
	public String ShopNames[];
	
	//新建商铺
	public void insertShop(String shopName, String shopKeeper, String shopKeeperTel) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into shopcharts values(?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int shopID = tool.generateID("shopcharts");
			if (shopID == -1) {
				return;
			}
			ps.setInt(1, shopID);
			ps.setString(2, shopName);
			ps.setString(3, shopKeeper);
			ps.setString(4, shopKeeperTel);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			//System.out.println("ts:" + ts + "\n");
			ps.setTimestamp(5, ts);
			ps.setTimestamp(6, ts);
			ps.setInt(7, 0);
			//ps.setDouble(, total);
			//System.out.println("ps2:" + ps + "\n");
			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//修改商铺
	public void modifyShop(int shopID, String shopName, String shopKeeper, String shopKeeperTel, int deleteShop) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update shopcharts set shopName = '" + shopName + "'"
		+ " , shopKeeper = '" + shopKeeper + "'" + " , shopKeeperTel = '" + shopKeeperTel + "'"
		+ " , updateDate = '" + ts + "'" + " , deleteShop = '" + deleteShop + "'" 
		+ " where shopID = " + shopID ;

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
	
	//删除商铺
	public void deleteShop(int shopID) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update shopcharts set updateDate = '" + ts + "'"
		+ " , deleteShop = '" + 1 + "'" + " where shopID = " + shopID ;

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
	
	//查询商铺名
	public String getShopName(int shopID) throws SQLException {
		String shopName = null;
		conn = Connections.getConnection();
		String sql = "select * from shopcharts where shopID=" + shopID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				shopName = rs.getString("shopName");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shopName;
	}
	
	//查询所有商铺名
	public void getAllShopNames() throws SQLException {
		int NUM = 500;
		ShopNames = new String[NUM];
		conn = Connections.getConnection();
		String sql = "select * from shopcharts";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 1;
			while (rs.next()) {
				ShopNames[index] = rs.getString("shopName");
				index++;
			}
			ShopNum = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询商铺信息
	public void getShopInfo(int shopID) throws SQLException {
		conn = Connections.getConnection();
		String sql = "select * from shopcharts where shopID=" + shopID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				shopName = rs.getString("shopName");
				shopKeeper = rs.getString("shopKeeper");
				shopKeeperTel = rs.getString("shopKeeperTel");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询商铺数量
	public int getShopNum() throws SQLException {
		int shopNum = 0;
		conn = Connections.getConnection();
		String sql = "select * from shopcharts ";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				shopNum++;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shopNum;
	}
	
	//查询商铺是否禁用
	public int IsShopDel(int shopID) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from shopcharts where shopID = " + shopID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("deleteShop");
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

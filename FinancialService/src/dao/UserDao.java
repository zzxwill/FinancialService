package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import tools.Tools;
import database.Connections;

public class UserDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public String UserName = null;
	public String UserTel = null;
	public int UserGroup = 0;
	public int DeleteUser = 0;
	
	public int UserNum = 0;
	public String UserNames[];
	public String UserNames_ChangGuan[];
	public String UserTels_ChangGuan[];
	public ArrayList<String> user_phone = new ArrayList<String>();
	public int role_id = 0;
	
	
	/**
	 * @function: 查询所有Tel
	 * @author:   Will Zhou
	 * @date:     Jul 7, 2014 9:04:02 PM 
	 */
	public void get_all_user_phone() throws SQLException {
		
		
		conn = Connections.getConnection();
		String sql = "select * from user ";
		try {
		
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				user_phone.add(rs.getString("phone"));
			
			}
		
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
		/**
		 * @function: 新建注册用户
		 * @author:   Will Zhou
		 * @date:     Jul 13, 2014 2:02:11 PM 
		 */
		public void insertUser(String userTel, String userPWD) {
			
			conn = Connections.getConnection();
			

			String sql = "insert into user(phone, password, createDate) values(?,?,?)";
			try {
				ps = conn.prepareStatement(sql);
			
				ps.setString(1, userTel);
				ps.setString(2, userPWD);
				Timestamp ts = new Timestamp(System.currentTimeMillis());  
				ps.setTimestamp(3, ts);
			

				ps.execute();
				
				ps.close();
				conn.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		

				/**
				 * @function: reset用户密码
				 * @author:   Will Zhou
				 * @date:     Aug 10, 2014 10:53:30 PM 
				 */
				public void reset_user_password(String userTel, String userPWD) throws SQLException {
					
					conn = Connections.getConnection();
					String sql = null;
					//Timestamp ts = new Timestamp(System.currentTimeMillis()); 
					
					//if(null==userPWD || userPWD.equals("")){
						sql = "update user set password = '" + userPWD + "'" +  " where phone = " + userTel ;
					//}

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
				
		
		
		/**
		 * @function: 根据Tel查询id
		 * @author:   Will Zhou
		 * @date:     Jul 13, 2014 8:50:52 PM 
		 */
		public int get_userid_by_phone(String tel) throws SQLException {

			conn = Connections.getConnection();
			String sql = "select * from user where phone='" + tel + "'";
			int id= 0;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					id = rs.getInt("id");
				}
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return id;
		}
		
		
		
		
		/**
		 * @function: 获取用户的角色 
		 * @author:   Will Zhou 
		 * @date:     Jul 18, 2014 7:36:56 AM  
		 */
		public int get_user_role(int user_id) throws SQLException {			
			conn = Connections.getConnection();
			String sql = "SELECT role_id  FROM `user_role` WHERE user_id = " + user_id +" and status = 1";
			
			try {			
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					role_id = rs.getInt(1);				
				}			
				stmt.close();
				conn.close();				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return role_id;
		}
		
	//新建用户
	public void insertUser(String userName, String userPWD, String userTel, int userGroup) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into usercharts values(?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int userID = tool.generateID("usercharts");
			if (userID == -1) {
				return;
			}
			ps.setInt(1, userID);
			ps.setString(2, userName);
			ps.setString(3, userPWD);
			ps.setString(4, userTel);
			ps.setInt(5, userGroup);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(6, ts);
			ps.setTimestamp(7, ts);
			ps.setInt(8, 0);

			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	//新建调理师用户
	public void insertTiaoLiShiUser(String userName, int changguan_id, String userTel, String introduction) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();
		//System.out.println(name + "," + changguan_id + "," + userTel + ","  + introduction );
		String sql = "insert into 04tiaolishi values(?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04tiaolishi");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setString(2, userName);
			ps.setString(3, userName);
			ps.setInt(4, changguan_id);
			ps.setString(5, userTel);
			ps.setString(6, introduction);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(7, ts);
			ps.setTimestamp(8, ts);
			ps.setInt(9, 0);
			
			System.out.println("insert Tiaolioshi : " + userName + "\n");
			
			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除调理师用户
	public void deleteTiaoLiShiUser(String userName) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update 04tiaolishi set updateDate = '" + ts + "'"
		+ " , delete_tiaolishi = '" + 1 + "'" + " where userName = '" + userName + "'";

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
	
	//管理员修改调理师用户信息
	public void modifyTiaoLiShiUserByAdmin(String userName, int changguan_id, String userTel, int delete_tiaolishi) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		sql = "update 04tiaolishi set userTel = '" + userTel + "'"
			+ " , changguan_id = '" + changguan_id + "'" + " , updateDate = '" + ts + "'"	
			+ " , delete_tiaolishi = '" + delete_tiaolishi + "'" + " where userName = '" + userName + "'" ;

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
	
	//用户修改用户信息
	public void modifyUser(int userID, String userPWD, String userTel) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		if(null==userPWD||userPWD.equals("")){
			sql = "update usercharts set userTel = '" + userTel + "'"
				+ " , updateDate = '" + ts + "'" + " where userID = " + userID ;
		}else{
			sql = "update usercharts set userPWD = '" + userPWD + "'"
			 	+ " , userTel = '" + userTel + "'" + " , updateDate = '" + ts + "'" 
			 	+ " where userID = " + userID ;
		}

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
	
	//管理员修改用户信息
	public void modifyUserByAdmin(int userID, String userPWD, String userTel, int userGroup, int deleteUser) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		if(null==userPWD||userPWD.equals("")){
			sql = "update usercharts set userTel = '" + userTel + "'"
				+ " , userGroup = '" + userGroup + "'" + " , updateDate = '" + ts + "'"	
				+ " , deleteUser = '" + deleteUser + "'" + " where userID = " + userID ;
		}else{
			sql = "update usercharts set userPWD = '" + userPWD + "'"
				+ " , userTel = '" + userTel + "'" + " , userGroup = '" + userGroup + "'" 
				+ " , updateDate = '" + ts + "'" + " , deleteUser = '" + deleteUser + "'" 
				+ " where userID = " + userID ;
		}

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
	
	//删除用户
	public void deleteUser(int userID) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update usercharts set updateDate = '" + ts + "'"
		+ " , deleteUser = '" + 1 + "'" + " where userID = " + userID ;

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
	
	//查询用户信息
	public void getUserInfo(int userID) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID ='" + userID + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				UserName = rs.getString("userName");
				UserTel = rs.getString("userTel");
				UserGroup = rs.getInt("userGroup");
				DeleteUser = rs.getInt("deleteUser");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户名
	public String getUserName(int userID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID=" + userID;
		String userName= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				userName = rs.getString("userName");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userName;
	}
	
	//查询所有用户名
	public void getAllUserNames() throws SQLException {
		int NUM = 500;
		UserNames = new String[NUM];
		conn = Connections.getConnection();
		String sql = "select * from usercharts";
		//String userName= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 1;
			while (rs.next()) {
				UserNames[index] = rs.getString("userName");
				index++;
			}
			UserNum = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户id(根据用户名)
	public int getUserID(String userName) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'";
		int id= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt("userID");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
	//查询用户数量
	public int getUserNum() throws SQLException {
		int userNum = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				userNum++;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userNum;
	}
	
	
	//查询用户是否禁用
	public int IsUserDel(int userID) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID = " + userID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("deleteUser");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//查询用户是否为管理员
	public int IsUserAdmin(String userName) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("userGroup");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//查询用户角色
		public int check_user_role(String userName) throws SQLException {
			int flag = 0;
			conn = Connections.getConnection();
			String sql = "select * from usercharts where userName = '" + userName + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					flag = rs.getInt("userGroup");
				}
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return flag;
		}
		
		//查询用户角色
		public int check_user_role(int userID) throws SQLException {
			int flag = 0;
			conn = Connections.getConnection();
			String sql = "select * from usercharts where userID = '" + userID + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					flag = rs.getInt("userGroup");
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

package database;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import database.Connections;
//import security.PasswordUtil;


public class UserDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public String UserName = null;
	public String UserTel = null;
	public int UserGroup = 0;
	
	public int UserNum = 0;
	public String UserNames[];
	
	String table_prefix = "04";
	
	
	//医生信息  Will Zhou  5/13/2014
	public ArrayList<Integer> doctor_id = new ArrayList<Integer>();
	public ArrayList<String> doctor_name = new ArrayList<String>();
	public ArrayList<String> doctor_gender = new ArrayList<String>();
	public ArrayList<Integer> doctor_age = new ArrayList<Integer>();
	public ArrayList<String> doctor_mobile = new ArrayList<String>();
	public ArrayList<String> doctor_master = new ArrayList<String>();
	public ArrayList<String> doctor_doctor_criteria = new ArrayList<String>();
	public ArrayList<String> doctor_department = new ArrayList<String>();
	public ArrayList<String> doctor_title = new ArrayList<String>();
	public ArrayList<String> doctor_validate_flag = new ArrayList<String>();

	
	
	
		
		
	
	/**
	 * @function: 展示医生列表 
	 * @author:   Will Zhou
	 * @date:     11:09:54 PM
	 */
	public void retrive_doctors() throws SQLException {

		conn = Connections4WeChat.getConnection();
		String sql = "SELECT `id`, `name`, (case when `gender`=0  then '男' else '女' end) as gender, `age`,  `mobile`, `master`, `doctor_criteria`, `department`, `title`,  (case when validate_flag=0  then '否' else '是' end) as validate_flag  FROM `04user_doctor`  ";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);	
			while (rs.next()) {
				//department[index] = rs.getString(1);
				doctor_id.add(rs.getInt(1));
				doctor_name.add(rs.getString(2));
				doctor_gender.add(rs.getString(3));
				doctor_age.add(rs.getInt(4));
				doctor_mobile.add(rs.getString(5));
				doctor_master.add(rs.getString(6));
				doctor_doctor_criteria.add(rs.getString(7));
				doctor_department.add(rs.getString(8));
				doctor_title.add(rs.getString(9));
				doctor_validate_flag.add(rs.getString(10));
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	public void retrive_patients() throws SQLException {

		conn = Connections4WeChat.getConnection();
		String sql = "SELECT `id`, `name`, (case when `gender`=0  then '男' else '女' end) as gender, `age`,  `mobile` FROM `04user`  ";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);	
			while (rs.next()) {
				//department[index] = rs.getString(1);
				doctor_id.add(rs.getInt(1));
				doctor_name.add(rs.getString(2));
				doctor_gender.add(rs.getString(3));
				doctor_age.add(rs.getInt(4));
				doctor_mobile.add(rs.getString(5));
			
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
		String sql = "select * from usercharts where userID=" + userID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				UserName = rs.getString("userName");
				UserTel = rs.getString("userTel");
				UserGroup = rs.getInt("userGroup");
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

}

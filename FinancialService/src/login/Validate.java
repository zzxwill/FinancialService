package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.Connections;

import security.PasswordUtil;

public class Validate {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;

	public String message = null;

	//密码已加密验证：
	public boolean validate_user(String userName, String userPWD) throws SQLException {
		boolean flag = false;
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'"
		  + " and deleteUser = '" + 0 + "'";
		 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()){
				String md5 = rs.getString("userPWD");
				PasswordUtil GP = new PasswordUtil();
				if(GP.verify(userPWD, md5)){
					flag = true;
				}
			}
//				else{
//					message = "您的用户名或密码错误，请重新登陆！";
//				}
//			}else{
//				message = "没有该用户，请重新登陆！";
//			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 密码已加密验证：

	
	/**
	 * @function: 验证终端用户(非后台管理用户)登录
	 * @author:   Will Zhou
	 * @date:     Jul 13, 2014 5:56:24 PM 
	 */
	public boolean validate_end_user(String userName, String userPWD)
			throws SQLException {
		boolean flag = false;
		conn = Connections.getConnection();
		String sql = "select * from user where phone = '" + userName + "'"
				+ " and status = 1";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String md5 = rs.getString("password");
				PasswordUtil GP = new PasswordUtil();
				if (GP.verify(userPWD, md5)) {
					flag = true;
				}
			}
			// else{
			// message = "您的用户名或密码错误，请重新登陆！";
			// }
			// }else{
			// message = "没有该用户，请重新登陆！";
			// }
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 密码未加密验证：
	/*
	 * public boolean validate(String userName, String userPWD) throws
	 * SQLException { boolean flag = false; conn = Connections.getConnection();
	 * //String sql = "select * from usercharts where userName = '" + userName +
	 * "'"; String sql = "select * from usercharts where userName = '" +
	 * userName + "'" + " and userPWD = '" + userPWD + "'" +
	 * " and deleteUser = '" + 0 + "'";
	 * 
	 * try { stmt = conn.createStatement(); rs = stmt.executeQuery(sql); if
	 * (rs.next()){ flag = true; } stmt.close(); conn.close(); } catch
	 * (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } return flag; }
	 */

}

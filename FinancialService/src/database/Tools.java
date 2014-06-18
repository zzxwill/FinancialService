package database;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.Connections;

public class Tools {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	// 生成下一个ID。下一个ID值=数据库中已有的最大ID值+1
	public int generateID(String flag) {
		int id = -1;
		String sql = null;
		conn = Connections.getConnection();
		if(flag.equals("shopcharts")){
			sql = "select max(shopID) as shopID from shopcharts";
		}
		else if(flag.equals("financialcharts")){
			sql = "select max(chartID) as chartID from financialcharts";
		}
		else if(flag.equals("usercharts")){
			sql = "select max(userID) as userID from usercharts";
		}
			
		//System.out.println(sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//System.out.println(rs);
			if (rs.next()) {
				if(flag.equals("shopcharts")){
					id = rs.getInt("shopID");
				}
				else if(flag.equals("financialcharts")){
					id = rs.getInt("chartID");
				}
				else if(flag.equals("usercharts")){
					id = rs.getInt("userID");
				}
				id++;
			}
			stmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	// 判断字符串的编码
	public static String getEncoding(String str) {
		String encode = "GB2312";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s = encode;
				//System.out.println(encode);
				return s;
			}
		} catch (Exception exception) {
		}
		encode = "ISO-8859-1";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s1 = encode;
				//System.out.println(encode);
				return s1;
			}
		} catch (Exception exception1) {
		}
		encode = "UTF-8";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s2 = encode;
				//System.out.println(encode);
				return s2;
			}
		} catch (Exception exception2) {
		}
		encode = "GBK";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s3 = encode;
				//System.out.println(encode);
				return s3;
			}
		} catch (Exception exception3) {
		}
		return "";
	}

}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import database.Connections;
import tools.Tools;
//import security.PasswordUtil;

public class ValidateCodeDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	private long interval = 30*60*1000; //三十分钟间隔
	
	//新建code
	public void insertValidateCode(String mobile, String code) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into validate_code(`mobile`, `code`, `createDate`, `deadline`) values(?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			/*int id = tool.generateID("validate_code");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);*/
			ps.setString(1, mobile);
			ps.setString(2, code);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(3, ts);
			Timestamp ts2 = new Timestamp(ts.getTime()+interval);
			ps.setTimestamp(4, ts2);

			ps.execute();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	//根据mobile查询code
	public String getValidateCode(String mobile) throws SQLException {

		conn = Connections.getConnection();
		//System.out.println("mobile:" + mobile + "\n");
		String sql = "select * from validate_code where mobile = '" + mobile + "'";
		String code = null;
		Timestamp deadline = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			Timestamp curTS = new Timestamp(System.currentTimeMillis()); 
			while (rs.next()) {
				deadline = rs.getTimestamp("deadline");
				if(curTS.getTime()>deadline.getTime()){
					//code = null;
					//System.out.println("chaoshi:" + curTS + "\n");
				}else{
					code = rs.getString("code");
				}
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("code:" + code + "\n");
		return code;
	}
	
	//删除code
	public void deleteValidateCode(String mobile) throws SQLException {
		
		conn = Connections.getConnection();

		String sql = "delete from validate_code where mobile = '" + mobile + "'";
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

	
}

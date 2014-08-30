package dao;

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
import java.util.HashMap;

import database.Connections;


public class DelegateDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	private Statement stmt_doctor_avaialble_amount = null;
	private ResultSet rs_doctor_avaialble_amount = null;
	private Connection conn_doctor_avaialble_amount = null;
	private PreparedStatement ps_doctor_avaialble_amount = null;
	
	public String UserName = null;
	public String UserTel = null;
	public int UserGroup = 0;
	
	public int UserNum = 0;
	public String UserNames[];
	
	
	
	
	
	
	/**
	 * @function: 提交投资信息
	 * @author:   Will Zhou
	 * @throws UnsupportedEncodingException 
	 * @date:     Jun 23, 2014 3:47:23 PM 
	 */
	public void submit_delegate_info(HashMap hm) throws UnsupportedEncodingException {
		Connection conn = Connections.getConnection();
		
		String  mobile= (String) hm.get("mobile");
		String  name= (String) hm.get("name");
		String  email=  (String)hm.get("email");
		
		
		String  content=  (String)hm.get("content");
		int user_id = Integer.valueOf((String) hm.get("user_id"));
		
		
		name = java.net.URLDecoder.decode(name,"UTF-8");
		name = java.net.URLDecoder.decode(name,"UTF-8");
		content = java.net.URLDecoder.decode(content,"UTF-8"); 
		content = java.net.URLDecoder.decode(content,"UTF-8");

		
		  Date currentTime = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = dateFormat.format(currentTime); 				
		

		String sql = "INSERT INTO `delegate`(  `mobile`, `name`, `email`,  `content`, `date`, user_id) VALUES('"
				+ mobile + "', '"+ name + "', '"+ email + "', '"+ content + "', '"+ date + "', "+ user_id +")";
				
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
	
	

	
	public static void main(String args[]) throws SQLException{
		InvestDao d = new InvestDao();
		d.retrive_doctor_reservation();
	}
	
}

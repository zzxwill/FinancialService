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

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class LawyerDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	
	//担保类别
	public ArrayList<Integer> guarantee_category_id = new ArrayList<Integer>();
	public ArrayList<String> guarantee_category_name = new ArrayList<String>();
	
	//投资期限
	public ArrayList<Integer> period_id = new ArrayList<Integer>();
	public ArrayList<String> period_time = new ArrayList<String>();
	
	
	/**
	 * @function: 提交投资信息
	 * @author:   Will Zhou
	 * @throws UnsupportedEncodingException 
	 * @date:     Jun 23, 2014 3:47:23 PM 
	 */
	public void submit_lawyer_info(HashMap hm) throws UnsupportedEncodingException {
		Connection conn = Connections.getConnection();
	
  		
  		String  name= (String) hm.get("name");
  		String  title= (String) hm.get("title");
  		String  description= (String) hm.get("description");
  		String  figure_path= (String) hm.get("figure_path");
  		
  		/*name = java.net.URLDecoder.decode(name,"UTF-8");
		name = java.net.URLDecoder.decode(name,"UTF-8");*/
		
		
	/*	name = java.net.URLDecoder.decode(name,"UTF-8");
		name = java.net.URLDecoder.decode(name,"UTF-8");
		comment = java.net.URLDecoder.decode(comment,"UTF-8"); 
		comment = java.net.URLDecoder.decode(comment,"UTF-8");*/

		
		  Date currentTime = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = dateFormat.format(currentTime); 
		
		
				
		

		String sql = "INSERT INTO `lawyer`( `name`, `title`, `description`, `figure_path`, `date`) VALUES('"
				+ name + "', '"+ title + "', '"+ description + "', '"+ figure_path + "', '"+ date  +"')";
				
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
		LawyerDao d = new LawyerDao();
		//d.retrive_doctor_reservation();
	}
	
}

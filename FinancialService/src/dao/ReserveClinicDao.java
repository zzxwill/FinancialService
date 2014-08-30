package dao;

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
import tools.Tools;
//import security.PasswordUtil;

/**
 * @function: 
 * @author:   Will Zhou
 * @date:     7:05:56 PM
 */
/**
 * @function: 
 * @author:   Will Zhou
 * @date:     12:12:47 AM
 */
/**
 * @function: 
 * @author:   Will Zhou
 * @date:     12:12:55 AM
 */
/**
 * @function: 
 * @author:   Will Zhou
 * @date:     12:13:08 AM
 */
public class ReserveClinicDao {

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
	
	// 用于切换开发和部署的配置
	//String table_prefix = "";
	String table_prefix = "04";
	
	
	//医生信息  Will Zhou  5/13/2014
	public int department_num;
	public int  department_id[];	
	public String  department[];
	
	
	//可预约门诊时间信息  Will Zhou  5/13/2014
	//public int department_num;
	public ArrayList<Integer> outpatient_id = new ArrayList<Integer>();
	public ArrayList<String> outpatient_date = new ArrayList<String>();
	public ArrayList<String> time = new ArrayList<String>();
	public ArrayList<String> outpatient_type = new ArrayList<String>();
	public ArrayList<Integer> amount = new ArrayList<Integer>();
	
	//患者的预约信息  Will Zhou  5/13/2014
	//public ArrayList<Long> clinic_id = new ArrayList<Long>();
	public ArrayList<String> clinic_site = new ArrayList<String>();
	public ArrayList<String> clinic_department = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_name = new ArrayList<String>();
	/*public ArrayList<Long> clinic_doctorid = new ArrayList<Long>();
	public ArrayList<Long> clinic_patient_illness_id = new ArrayList<Long>();
	public ArrayList<Boolean> clinic_treat_flag = new ArrayList<Boolean>();*/
	public ArrayList<String> clinic_date = new ArrayList<String>();
	
	public ArrayList<String> shanggongfang_adjust_type = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_programe = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_book_date = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_book_master = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_name = new ArrayList<String>();
	
	public ArrayList<String> shanggongfang_assess_type = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_programe = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_book_date = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_book_master = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_name = new ArrayList<String>();
	
	public ArrayList<String> xuetang = new ArrayList<String>();
	public ArrayList<String> xuetang_name = new ArrayList<String>();
	
	//医生预约信息
	//SELECT  `site`, n.`department`, i.name, i.purpose , `date` FROM   reservation_normal n,  reservation_patient_illness i where n.patient_illness_id = i.id
	public ArrayList<String> clinic_doctor_site = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_department = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_patient_name = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_purpose = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_date = new ArrayList<String>();
	
	
	
	
	
	
	public int doctor_num;
	public int  doctor_id[];
	public String  name[];
	public String  title[];
	public int  doctor_available_amount[];
	
	private int NUM = 1000;
	

	
	/**
	 * @function: 获取科室
	 * @author:   Will Zhou
	 * @date:     May 13, 2014 10:37:40 PM 
	 */
	public void retrive_deparment() throws SQLException {

		conn = Connections.getConnection();
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";

		String sql = "SELECT id as department_id, name as department FROM " + table_prefix + "department";


		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 0;
			department = new String[NUM];
			department_id = new int[NUM];
			while (rs.next()) {
				department_id[index] = rs.getInt(1);
				department[index] = rs.getString(2);
				//name[index] = rs.getString(2);
				//title[index] = rs.getString(3);
				
				index++;
				
			}
			department_num = index;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	//
	public void retrive_doctors_by_deparment(int department_id) throws SQLException {

		conn = Connections.getConnection();
		String sql = "SELECT u.id as doctor_id ,u.name, u.title FROM  " + table_prefix + "user_doctor u  WHERE u.department = " + department_id;
		
		//当前日期    Will Zhou   5/24/2014
		Date currentTime = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = dateFormat.format(currentTime);
		
		//当周周日的日期
		//date_sub(curdate(),INTERVAL WEEKDAY(curdate())-6 DAY) 
		//当前医生还剩余的号  当天--周日
		//String sql_doctor_available_amount = "SELECt sum(total_amount - used_amount) FROM 04outpatient_info i, 04outpatient_doctor d WHERE i.id = d.outpatient_id and  date between curdate() and date_sub(curdate(),INTERVAL WEEKDAY(curdate())-6 DAY) and d.doctor_id = " ;
		
		

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
		
			
			
			int index = 0;
			doctor_id = new int[NUM];
			name = new String[NUM];
			title = new String[NUM];
			doctor_available_amount = new int[NUM];
			
			
			while (rs.next()) {
				//department[index] = rs.getString(1);
				doctor_id[index] =rs.getInt(1);
				
				
				
				name[index] = rs.getString(2);
				title[index] = rs.getString(3);
				
				String sql_doctor_available_amount = "SELECt sum(total_amount - used_amount) FROM 04outpatient_info i, 04outpatient_doctor d WHERE i.id = d.outpatient_id and  date between curdate() and date_sub(curdate(),INTERVAL WEEKDAY(curdate())-6 DAY) and d.doctor_id = " ;
				sql_doctor_available_amount += rs.getInt(1);
				conn_doctor_avaialble_amount = Connections.getConnection();
				stmt_doctor_avaialble_amount = conn_doctor_avaialble_amount.createStatement();
				rs_doctor_avaialble_amount = stmt_doctor_avaialble_amount.executeQuery(sql_doctor_available_amount);
				/*private Statement  = null;
				private ResultSet  = null;
				private Connection  = null;
				private PreparedStatement ps_doctor_avaialble_amount = null;*/
				doctor_available_amount[index]=0;
				while(rs_doctor_avaialble_amount.next()){
					doctor_available_amount[index] = rs.getInt(1);
				}
				
				
				
				
				
				index++;
				
			}
			doctor_num = index;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	

	/**
	 * @function: 查询出诊信息
	 * @author:   Will Zhou
	 * @date:     May 20, 2014 7:06:42 PM 
	 */
	public void retrive_outpatient() throws SQLException {

		conn = Connections.getConnection();
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";

		String sql = "SELECT `id` as outpatient_id, `date` as outpatient_date, `time`, `type` as outpatient_type, `amount` FROM " + table_prefix + "outpatient_info";


		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 0;
			/*public ArrayList<Integer>  = new ArrayList<Integer>();
			public ArrayList<String>  = new ArrayList<String>();
			public ArrayList<String>  = new ArrayList<String>();
			public ArrayList<String> outpatient_type = new ArrayList<String>();*/
		/*	department = new String[NUM];
			department_id = new int[NUM];*/
			while (rs.next()) {
				outpatient_id.add(rs.getInt(1));
				outpatient_date.add(rs.getString(2));
				time.add(rs.getString(3));
				outpatient_type.add(rs.getString(4));
				amount.add(rs.getInt(5));
				
			
				
				index++;
				
			}
			department_num = index;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	/**
	 * @function: 后去患者的预约信息
	 * @author:   Will Zhou
	 * @date:     May 22, 2014 12:13:16 AM 
	 */
	public void retrive_patien_reservation(int userid) throws SQLException {

		conn = Connections.getConnection();
		
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";
		String sql = "SELECT  `site`, n.`department`, d.name,  `date` FROM  " + table_prefix + "reservation_normal n, " + table_prefix + "reservation_patient_illness i,  " + table_prefix + "user_doctor d where n.patient_illness_id = i.id and n.doctorid = d.id and userid =  " + userid;
		String sql_shanggongfang_adjust = "SELECT type, `adjust_programe`, `book_date` as shanggongfang_adjust_book_date, `adjust_master`, name  as shanggongfang_adjust_name  FROM  " + table_prefix + "reservation_shanggongfang_adjust WHERE  username =  " + userid;
		String sql_shanggongfang_assess = "SELECT type, assess_programe, book_date as shanggongfang_assess_book_date, assess_master, name as shanggongfang_assess_name  FROM   " + table_prefix + "reservation_shanggongfang_assess  WHERE  username =  " + userid;
		String sql_xuetang = "SELECT `xuetang`, `name` as xuetang_name FROM   " + table_prefix + "reservation_xuetang WHERE  username =  " + userid;
		

		try {
			stmt = conn.createStatement();
			Statement stmt_shanggongfang_adjust = conn.createStatement();
			Statement stmt_shanggongfang_assess = conn.createStatement();
			Statement stmt_xuetang = conn.createStatement();
			
			
			
			rs = stmt.executeQuery(sql);
			
			ResultSet rs_shanggongfang_adjust = stmt_shanggongfang_adjust.executeQuery(sql_shanggongfang_adjust);
			
			ResultSet rs_shanggongfang_assess = stmt_shanggongfang_assess.executeQuery(sql_shanggongfang_assess);
			ResultSet rs_xuetang = stmt_xuetang.executeQuery(sql_xuetang);
			
			int index = 0;
			while (rs.next()) {
				clinic_site.add(rs.getString(1));
				clinic_department.add(rs.getString(2));
				clinic_doctor_name.add(rs.getString(3));
				clinic_date.add(rs.getString(4));
				index++;
			}
			
			index = 0;
			while (rs_shanggongfang_adjust.next()) {
				
				shanggongfang_adjust_type.add(rs_shanggongfang_adjust.getString(1));
				shanggongfang_adjust_programe.add(rs_shanggongfang_adjust.getString(2));
				shanggongfang_adjust_book_date.add(rs_shanggongfang_adjust.getString(3));
				shanggongfang_adjust_book_master.add(rs_shanggongfang_adjust.getString(4));
				shanggongfang_adjust_name.add(rs_shanggongfang_adjust.getString(5));
				index++;
			}
			
			
			index = 0;
			while (rs_shanggongfang_assess.next()) {
				
				shanggongfang_assess_type.add(rs_shanggongfang_assess.getString(1));
				shanggongfang_assess_programe.add(rs_shanggongfang_assess.getString(2));
				shanggongfang_assess_book_date.add(rs_shanggongfang_assess.getString(3));
				shanggongfang_assess_book_master.add(rs_shanggongfang_assess.getString(4));
				shanggongfang_assess_name.add(rs_shanggongfang_assess.getString(5));
				index++;
			}
			
			
			index = 0;
			while (rs_xuetang.next()) {
				
				xuetang.add(rs_xuetang.getString(1));
				xuetang_name.add(rs_xuetang.getString(2));
			
				index++;
			}
			
	
			
			
			
			department_num = index;
			stmt.close();
			stmt_shanggongfang_adjust.close();
			stmt_shanggongfang_assess.close();
			stmt_xuetang.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void retrive_doctor_reservation() throws SQLException {

		conn = Connections.getConnection();
		
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";
		String sql = "SELECT  `site`, n.`department`, i.name, i.purpose , `date` FROM   " + table_prefix + "reservation_normal n,  " + table_prefix + "reservation_patient_illness i where n.patient_illness_id = i.id ";
		
		try {
			stmt = conn.createStatement();
			
			
			
			
			rs = stmt.executeQuery(sql);
			
		
			int index = 0;
			while (rs.next()) {
			
				
				clinic_doctor_site.add(rs.getString(1));
				clinic_doctor_department.add(rs.getString(2));
				clinic_doctor_patient_name.add(rs.getString(3));
				clinic_doctor_purpose.add(rs.getString(4));
				
				clinic_doctor_date.add(rs.getString(5));
				index++;
			}
			
	
			
			
			
			department_num = index;
			stmt.close();
		
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static void main(String args[]) throws SQLException{
		ReserveClinicDao d = new ReserveClinicDao();
		d.retrive_doctor_reservation();
	}
	
}

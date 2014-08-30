package tools;

import java.util.Random;  
import java.util.Date; 
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
	
	
	public String RandCode = null;

	public String GenRandomNum(){
		
		Date date = new Date();  
        long timeMill = date.getTime();  
       // System.out.println("timeMill:" + timeMill + "\n");  
        Random rand = new Random(timeMill); 
        String str_code = "";
        for(int i = 0; i < 4; i++)  
        {  
        	str_code = str_code + String.valueOf(rand.nextInt(9));
            //System.out.println("str_code:" + str_code + "\n");  
        }
        
        RandCode = str_code;
		return str_code;
		
	}
	//验证码验证
	public int validateCode(String inputCode, String rightCode){
		
		if(null==inputCode||inputCode.equals("")||null==rightCode||rightCode.equals("")){
			return 0;
		}else{
			if(inputCode.equals(rightCode)){
				return 1;
			}else{
				return 0;
			}
		}
	}

	// 生成下一个ID。下一个ID值=数据库中已有的最大ID值+1
	public int generateID(String flag) {
		int id = -1;
		String sql = null;
		conn = Connections.getConnection();
		if(flag.equals("04user")){
			sql = "select max(id) as id from 04user";
		}
		
		else if(flag.equals("04user_doctor")){
			sql = "select max(id) as id from 04user_doctor";
		}
		
		else if(flag.equals("04weixinMapUser")){
			sql = "select max(id) as id from 04weixinMapUser";
		}
		
		else if(flag.equals("04ipmapuser")){//04ipmapuser
			sql = "select max(id) as id from 04ipmapuser";
		}
		
		else if(flag.equals("04question")){
			sql = "select max(id) as id from 04question";
		}
		
		else if(flag.equals("04answer")){
			sql = "select max(id) as id from 04answer";
		}
		
		else if(flag.equals("04question_delete_list")){
			sql = "select max(id) as id from 04question_delete_list";
		}
		
		else if(flag.equals("04site_doctor")){
			sql = "select max(id) as id from 04site_doctor";
		}
		
		else if(flag.equals("04validate_code")){
			sql = "select max(id) as id from 04validate_code";
		}
		
		else if(flag.equals("04tiaolishi")){
			sql = "select max(id) as id from 04tiaolishi";
		}
		/*
		else if(flag.equals("usercharts")){
			sql = "select max(userID) as userID from usercharts";
		}
		*/	
		
		//System.out.println(sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//System.out.println(rs);
			if (rs.next()) {
				if(flag.equals("04user")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04user_doctor")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04weixinMapUser")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04ipmapuser")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04question")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04answer")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04question_delete_list")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04site_doctor")){
					id = rs.getInt("id");
				}
				
				else if(flag.equals("04validate_code")){
					id = rs.getInt("id");
				}
				
				
				/*
				else if(flag.equals("usercharts")){
					id = rs.getInt("userID");
				}
				*/
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

/**
 * 用于连接孔医堂微信端的数据库
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class Connections4WeChat {
//public class connectionACE {
 
   /* public static Connection getConnection(){
    	String username = "db4sm1ji23kix8uy";
    	String password = "liliming1990";
    	String databaseName = username;
    	String host = "rdsayenemanerj2.mysql.rds.aliyuncs.com";
    	String port = "3306";
    	String driverName = "com.mysql.jdbc.Driver";
    	String dbUrl = "jdbc:mysql://";
    	String serverName = host + ":" + port + "/";
//    	serverName += databaseName + "?characterEncoding=utf8";
    	dbUrl += serverName + databaseName + "?characterEncoding=utf8";
    	//dbUrl = "jdbc:mysql://localhost:3306/drinkmarket?characterEncoding=utf8"
        Connection conn = null;
        try {
        	
            Class.forName(driverName).newInstance();
            conn = DriverManager.getConnection(dbUrl,username,password);
             
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         
        return conn;
         
    }*/
	public static Connection getConnection(){
		String username ="root";// "zzxwill_kyt";//"root";
    	String password = "";//"tXg8Z9Wn";//"";
    	String databaseName = username;
    	String host = "localhost";
    	String port = "3306";
    	String driverName = "com.mysql.jdbc.Driver";
    	String dbUrl = "jdbc:mysql://";
    	String serverName = host + ":" + port + "/";
//    	serverName += databaseName + "?characterEncoding=utf8";
    	//dbUrl += serverName + databaseName + "?characterEncoding=utf8";
    	dbUrl = "jdbc:mysql://localhost:3306/confuciusmedicine?characterEncoding=utf8";
    	//dbUrl = "jdbc:mysql://localhost:3306/zzxwill_kongyitang?characterEncoding=utf8";
        Connection conn = null;
        try {
        	
            Class.forName(driverName).newInstance();
            conn = DriverManager.getConnection(dbUrl,username,password);
             
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         
        return conn;
         
    }
}
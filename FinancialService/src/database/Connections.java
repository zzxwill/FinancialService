package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class Connections {

	public static DataSource dataSource = null;

	public static Connection getConnection() {
		/*String username = "lvbang5777";
		String password = "lb28955777";
		String driverName = "com.mysql.jdbc.Driver";
		String dbUrl = "jdbc:mysql://221.231.138.34:3306/lvbang5777?characterEncoding=utf8";*/
		String username = "zzxwill_zzx";
		String password = "9tiKUegM";
		String driverName = "com.mysql.jdbc.Driver";
		String dbUrl = "jdbc:mysql://zhouzhengxi.com:3306/zzxwill_financialcharts?characterEncoding=utf8";
		
		Connection conn = null;
		try {

			Class.forName(driverName).newInstance();
			conn = DriverManager.getConnection(dbUrl, username, password);

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

	public static synchronized DataSource getDataSource() throws Exception {
		if (dataSource == null) {
			Properties properties = new Properties();
			properties.load(Connections.class
					.getResourceAsStream("/config.properties"));
			dataSource = BasicDataSourceFactory
					.createDataSource(properties);
		}
		return dataSource;
	}

}
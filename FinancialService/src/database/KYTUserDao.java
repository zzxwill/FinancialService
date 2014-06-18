package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import database.connection;

public class KYTUserDao {
	private static final long USERID = 0;
	private Statement statement = null;
	private ResultSet rs = null;

	private int NUM = 1000;

	public String message = null;

	// 预约信息
	// public String site;
	// public String department;
	// public String doctorid;
	// public int patient_illness_id;

	// 用于切换开发和部署的配置
	//String table_prefix = "";
	String table_prefix = "04";

	// 提交望京馆信息
	public void submit_reservation(String illness_name, String purpose,
			String detail, long mobile, String name, String site,
			String department, int doctorid, int userid, int outpatient_id) {

		int patient_illness_id = 0;
		Connection conn = Connections.getConnection();

		String sql_reservation_patient_illness = "INSERT INTO `" + table_prefix + "reservation_patient_illness`( `illness_name`, `purpose`, `detail`, `mobile`, `name`) VALUES (?,?,?,?,?)";
		try {

			// insert table reservation_patient_illness
			PreparedStatement ps = conn
					.prepareStatement(sql_reservation_patient_illness);

			ps.setString(1, illness_name);
			ps.setString(2, purpose);
			ps.setString(3, detail);
			ps.setLong(4, mobile);
			ps.setString(5, name);
			

			ps.execute();

			// 获取reservation_patient_illness的id
			String sql_reservation_patient_illness_getID = "select max(id) as reservation_patient_illness_id from " +  table_prefix + "reservation_patient_illness";
			Statement st = conn.createStatement();
			ResultSet rs = st
					.executeQuery(sql_reservation_patient_illness_getID);
			if (rs.next()) {
				patient_illness_id = rs
						.getInt("reservation_patient_illness_id");
			}

			// 存reservation_patient_illness Will Zhou 5/9/2014
			
			
			
			//String sql_reservation_normal = "INSERT INTO `" + table_prefix + "reservation_normal`(`site`, `department`, `doctorid`, `patient_illness_id`, `date`) VALUES (?,?,?,?,?)";
			String sql_reservation_normal = "INSERT INTO `" + table_prefix + "reservation_normal`(`site`, `department`, `doctorid`, `patient_illness_id`, `date`, userid) VALUES (?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql_reservation_normal);
			ps.setString(1, site);
			ps.setString(2, department);
			ps.setInt(3, doctorid);
			if (patient_illness_id != 0) {
				ps.setInt(4, patient_illness_id);
			}
			
			Date currentTime = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = dateFormat.format(currentTime);
			ps.setString(5, date);
			//加入用户名 Will Zhou   5/21/2014
			ps.setLong(6, userid);
			

			ps.execute();
			
			
			//预约医生后，医生已使用的预约号增加一个  Will Zhou   5/24/2014
			String sql_outpatient_doctor = "UPDATE 04outpatient_doctor SET used_amount = used_amount +1 where outpatient_id = " + outpatient_id  + " and doctor_id=" + doctorid ;
			ps = conn.prepareStatement(sql_outpatient_doctor);
			ps.execute();
			

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 提交学堂预约信息 Will Zhou 5/11/2013
	public void submit_reservation_xuetang(HashMap hm4xuetang) {
		String xuetang = (String) hm4xuetang.get("xuetang");
		String name = (String) hm4xuetang.get("name");

		int gender = (Integer) hm4xuetang.get("gender");

		int age = (Integer) hm4xuetang.get("age");

		long mobile = (Long) hm4xuetang.get("mobile");
		String job = (String) hm4xuetang.get("job");
		String company = (String) hm4xuetang.get("company");
		String title = (String) hm4xuetang.get("title");
		
		long username = Long.valueOf(hm4xuetang.get("username").toString());

		Connection conn = connection.getConnection();

		String sql_reservation_xuetang = "INSERT INTO `" + table_prefix + "reservation_xuetang`(`xuetang`,`name`, `gender`, `age`, `mobile`, `job`, `company`, `title`,`username`,`date`) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {

			PreparedStatement ps = conn
					.prepareStatement(sql_reservation_xuetang);

			ps.setString(1, xuetang);
			ps.setString(2, name);
			ps.setInt(3, gender);
			ps.setInt(4, age);
			ps.setLong(5, mobile);
			ps.setString(6, job);
			ps.setString(7, company);
			ps.setString(8, title);

			// 临时指定username，应该从Li Ming那里获取
			//String username = "test_user";
			ps.setLong(9, username);

			Date currentTime = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = dateFormat.format(currentTime);

			ps.setString(10, date);

			ps.execute();

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 提交上工坊预约信息 Will Zhou 5/11/2013
	public void submit_reservation_shanggongfang(HashMap hm4shanggongfang) {
		String type = (String) hm4shanggongfang.get("type");
		String name = (String) hm4shanggongfang.get("name");

		int gender = (Integer) hm4shanggongfang.get("gender");

		int age = (Integer) hm4shanggongfang.get("age");

		long mobile = (Long) hm4shanggongfang.get("mobile");

		//
		String adjust_programe = new String();
		String book_date = (String) hm4shanggongfang.get("book_date");
		String adjust_master = new String();

		String assess_programe = new String();
		String assess_master = new String();
		
		long username = Long.valueOf(hm4shanggongfang.get("username").toString());

		if ("健康调理".equals(type)) {
			adjust_programe = (String) hm4shanggongfang.get("adjust_programe");
			adjust_master = (String) hm4shanggongfang.get("adjust_master");
		} else if ("健康评估".equals(type)) {
			assess_programe = (String) hm4shanggongfang.get("assess_programe");
			assess_master = (String) hm4shanggongfang.get("assess_master");
		}

		Connection conn = connection.getConnection();

		String sql_reservation_xuetang = "INSERT INTO `" + table_prefix + "reservation_shanggongfang_adjust`(`type`, `name`, `gender`, `age`, `mobile`, `adjust_programe`, `book_date`, `adjust_master`, `username`, `date`) VALUES (?,?,?,?,?,?,?,?,?,?)";

		String sql_reservation_xuetang_assess = "INSERT INTO `" + table_prefix + "reservation_shanggongfang_assess`(`type`, `name`, `gender`, `age`, `mobile`, `assess_programe`, `book_date`, `assess_master`, `username`, `date`) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement ps;

			if ("健康调理".equals(type)) {
				ps = conn.prepareStatement(sql_reservation_xuetang);
				ps.setString(6, adjust_programe);
				ps.setString(8, adjust_master);
			} else // if("健康评估".equals(type))
			{
				ps = conn.prepareStatement(sql_reservation_xuetang_assess);
				ps.setString(6, assess_programe);
				ps.setString(8, assess_master);
			}

			ps.setString(1, type);
			ps.setString(2, name);
			ps.setInt(3, gender);
			ps.setInt(4, age);
			ps.setLong(5, mobile);

			ps.setString(7, book_date);

			// 临时指定username，应该从Li Ming那里获取
			//String username = "test_user";
			ps.setLong(9, username);

			Date currentTime = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = dateFormat.format(currentTime);

			ps.setString(10, date);

			ps.execute();

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 饮料单价
	public double PRICE_OF_KUANGQUANSHUI = 0.0;
	public double PRICE_OF_HONGCHA = 0.0;
	public double PRICE_OF_LVCHA = 0.0;
	public double PRICE_OF_HONGNIU = 0.0;
	public double PRICE_OF_JIADUOBAO = 0.0;

	// 饮料描述
	public String DE_OF_KUANGQUANSHUI = null;
	public String DE_OF_HONGCHA = null;
	public String DE_OF_LVCHA = null;
	public String DE_OF_HONGNIU = null;
	public String DE_OF_JIADUOBAO = null;

	// 饮料信息
	public int drinkIds[];
	public String drinkNames[];
	public double drinkPrices[];
	public String descriptions[];
	public String imageNames[];
	public int drinkListNums[];
	public double drinkListPrices[];
	public String drinkUnits[];
	public int drinkNum = 0;

	// 建筑信息
	public int buildingIds[];
	public String buildingNames[];
	public int buildingNum = 0;

	// 订单信息
	public String orderList = null;
	public double total = 0.0;

	// 所有订单信息
	public int orderIDs[];
	public int useIDs[];
	public String orderLists[];
	public Timestamp createTimes[];
	public int informeds[];
	public double totals[];
	public int orderListNums = 0;

	// 指定用户今日所有已完成订单信息
	public int curOrderIDs[];
	public int curUseIDs[];
	public String curOrderLists[];
	public Timestamp curCreateTimes[];
	public String curDates[];
	public int curInformeds[];
	public double curTotals[];
	public int curOrderListNums = 0;

	// 用户信息
	public int userID = 0;
	public String weixinID = null;
	public String nickname = null;
	public String telphone = null;
	public int buildingID = 0;
	public String roomNum = null;
	public int score = 0;
	// public Timestamp createTime;
	// public Timestamp editTime;
	// public String remark = null;

	// 快递员信息
	public int expressID = 0;
	public String expressName = null;
	public String expressTel = null;
	public String expressEmail = null;

	// 查询所有建筑信息
	public void getBuildingAll() throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		int index = 1;
		buildingIds = new int[NUM];
		buildingNames = new String[NUM];
		String sql = "select * from building";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				buildingIds[index] = rs.getInt(1);
				buildingNames[index] = rs.getString(2);
				index++;
			}
			buildingNum = index - 1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 根据id查询建筑名字
	public String getBuildingName(int id) throws SQLException {
		String buildingName = null;
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from building where buildingID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				buildingName = rs.getString("buildingName");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buildingName;
	}

	// 根据id查询单价
	public double getPrice(int id) throws SQLException {
		double price = 0.0;
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price where drinkID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				price = rs.getDouble("drinkPrice");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}

	// 根据id查询饮料描述
	public String getDecription(int id) throws SQLException {
		String decription = null;
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price where drinkID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				decription = rs.getString("description");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return decription;
	}

	// 查询所有饮料信息
	public void getDrinkAll() throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		int index = 1;
		drinkIds = new int[NUM];
		drinkNames = new String[NUM];
		drinkPrices = new double[NUM];
		descriptions = new String[NUM];
		imageNames = new String[NUM];
		drinkListNums = new int[NUM];
		drinkListPrices = new double[NUM];
		drinkUnits = new String[NUM];
		String sql = "select * from price";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				drinkIds[index] = rs.getInt(1);
				drinkNames[index] = rs.getString(2);
				drinkPrices[index] = rs.getDouble(3);
				descriptions[index] = rs.getString(4);
				imageNames[index] = rs.getString(5);
				// drinkListNums[index] = 0;
				// drinkListPrices[index] = 0.0;
				drinkUnits[index] = rs.getString(6);
				index++;
				// System.out.println("\nPRICE_OF_KUANGQUANSHUI:" +
				// PRICE_OF_KUANGQUANSHUI);
			}
			drinkNum = index - 1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查询所有饮料单价
	public void getPriceAll() throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				PRICE_OF_KUANGQUANSHUI = getPrice(1);
				PRICE_OF_HONGCHA = getPrice(2);
				PRICE_OF_LVCHA = getPrice(3);
				PRICE_OF_HONGNIU = getPrice(4);
				PRICE_OF_JIADUOBAO = getPrice(5);
				// System.out.println("\nPRICE_OF_KUANGQUANSHUI:" +
				// PRICE_OF_KUANGQUANSHUI);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查询所有饮料描述
	public void getDecriptionAll() throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				DE_OF_KUANGQUANSHUI = getDecription(1);
				DE_OF_HONGCHA = getDecription(2);
				DE_OF_LVCHA = getDecription(3);
				DE_OF_HONGNIU = getDecription(4);
				DE_OF_JIADUOBAO = getDecription(5);
				// System.out.println("\nPRICE_OF_KUANGQUANSHUI:" +
				// PRICE_OF_KUANGQUANSHUI);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 新建订单信息
	public void insertOrder(String weixinID, String orderList, double total) {
		Connection conn = connection.getConnection();

		String sql = "insert into orderlist values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int orderID = generateID("orderlist");
			// System.out.println("\norderID:" + orderID);
			if (orderID == -1) {
				return;
			}
			ps.setInt(1, orderID);
			int userID = getUserID(weixinID);
			ps.setInt(2, userID);
			ps.setString(3, orderList);
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			// System.out.println("ts:" + ts + "\n");
			ps.setTimestamp(4, ts);
			Date currentTime = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateString = dateFormat.format(currentTime);
			ps.setString(5, dateString);
			ps.setInt(6, 0);
			ps.setDouble(7, total);

			ps.execute();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查询指定用户今日所有已完成订单信息
	public void getCurOrderList(int ID) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		int index = 1;

		curOrderIDs = new int[NUM];
		curUseIDs = new int[NUM];
		curOrderLists = new String[NUM];
		curCreateTimes = new Timestamp[NUM];
		curDates = new String[NUM];
		curInformeds = new int[NUM];
		curTotals = new double[NUM];
		// curOrderListNums = 0;
		Date currentTime = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = dateFormat.format(currentTime);

		String sql = "select * from orderlist where userID =" + ID
				+ " and date ='" + dateString + "'";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				curOrderIDs[index] = rs.getInt(1);
				curUseIDs[index] = rs.getInt(2);
				curOrderLists[index] = rs.getString(3);
				curCreateTimes[index] = rs.getTimestamp(4);
				// curDates[index] = rs.getString(5);
				curInformeds[index] = rs.getInt(6);
				curTotals[index] = rs.getDouble(7);
				index++;
			}
			curOrderListNums = index - 1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 根据状态informed是否发送，查询所有订单信息
	public void getOrderListInformed(int informed) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		int index = 1;
		orderIDs = new int[NUM];
		useIDs = new int[NUM];
		orderLists = new String[NUM];
		createTimes = new Timestamp[NUM];
		informeds = new int[NUM];
		totals = new double[NUM];
		String sql = "select * from orderlist where informed =" + informed;
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				orderIDs[index] = rs.getInt(1);
				useIDs[index] = rs.getInt(2);
				orderLists[index] = rs.getString(3);
				// createTimes[index] = rs.getTimestamp(4);
				// informeds[index] = rs.getInt(6);
				totals[index] = rs.getDouble(7);
				index++;
			}
			orderListNums = index - 1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 修改订单informed状态
	public void modifyOrderInformed(int orderID, int informed)
			throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "update orderlist set informed =" + informed
				+ " where orderID =" + orderID;

		// System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 新建用户信息
	public void insertUserInfo(String weixinID, String nickname,
			String telephone, int buildingID, String roomNum) {
		Connection conn = connection.getConnection();

		String sql = "insert into userinfo values(?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int userID = generateID("userinfo");
			if (userID == -1) {
				return;
			}
			// System.out.println("\nuserID:" + userID);
			ps.setInt(1, userID);
			ps.setString(2, weixinID);
			ps.setString(3, nickname);
			ps.setString(4, telephone);
			ps.setInt(5, buildingID);
			ps.setString(6, roomNum);
			ps.setInt(7, 0);
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			ps.setTimestamp(8, ts);
			ps.setTimestamp(9, ts);
			ps.setString(10, "");

			ps.execute();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 判断用户是否已经存在。
	public boolean isExist(String weixinID) {
		boolean flag = false;
		Connection conn = connection.getConnection();

		// String sql = "select * from users where weixinID='" + weixinID + "'";
		String sql = "select * from userinfo where weixinID=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, weixinID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 判断临时订单是否已经存在。
	public boolean isExistTmpOrder(String weixinID) {
		boolean flag = false;
		Connection conn = connection.getConnection();

		// String sql = "select * from users where weixinID='" + weixinID + "'";
		String sql = "select * from tmporder where weixinID=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, weixinID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 根据微信ID查询用户ID
	public int getUserID(String weixinID) throws SQLException {
		int userID = 0;
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where weixinID='" + weixinID + "'";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				userID = rs.getInt("userID");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userID;
	}

	// 修改用户信息
	public void modifyUserInfo(int userID, String telephone, int buildingID,
			String roomNum) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String sql = "update userinfo set telephone = '" + telephone + "'"
				+ " , buildingID = '" + buildingID + "'" + " , roomNum = '"
				+ roomNum + "'" + " , editTime = '" + ts + "'"
				+ " where userID = " + userID;

		// System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查询用户积分
	public int getUserScore(int userID) throws SQLException {
		int score = 0;
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where userID=" + userID;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				score = rs.getInt("score");
			}
			// conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return score;
	}

	// 修改用户积分
	public void modifyUserScoreInfo(int userID, int score) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		int oldScore = 0;
		oldScore = getUserScore(userID);
		int newScore = oldScore + score;
		String sql = "update userinfo set score = " + newScore
				+ " where userID = " + userID;
		// System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 根据微信号查询指定用户信息
	public void getUserInfoAll(String WXID) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where weixinID = '" + WXID + "'";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				userID = rs.getInt(1);
				weixinID = rs.getString(2);
				nickname = rs.getString(3);
				telphone = rs.getString(4);
				buildingID = rs.getInt(5);
				roomNum = rs.getString(6);
				score = rs.getInt(7);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 根据用户ID查询指定用户信息
	public void getUserInfoAll(int userID) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where userID =" + userID;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				// userID = rs.getInt(1);
				weixinID = rs.getString(2);
				nickname = rs.getString(3);
				telphone = rs.getString(4);
				buildingID = rs.getInt(5);
				roomNum = rs.getString(6);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 新建临时订单信息
	public void insertTmpOrder(String weixinID, String orderList, double total) {
		Connection conn = connection.getConnection();

		String sql = "insert into tmporder values(?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int orderID = generateID("tmporder");
			if (orderID == -1) {
				return;
			}
			// System.out.println("\nuserID:" + userID);
			ps.setInt(1, orderID);
			ps.setString(2, weixinID);
			ps.setString(3, orderList);
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			// System.out.println("ts:" + ts + "\n");
			ps.setTimestamp(4, ts);
			ps.setDouble(5, total);
			// System.out.println("ps2:" + ps + "\n");
			ps.execute();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 根据微信ID查询临时订单ID
	public int getTmpOrderID(String weixinID) throws SQLException {
		int orderID = 0;
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from tmporder where weixinID='" + weixinID + "'";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				orderID = rs.getInt("orderID");
				// System.out.println("ID:" + orderID + "\n");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderID;
	}

	// 修改临时订单信息
	public void modifyTmpOrder(int orderID, String orderList, double total)
			throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		String sql = "update tmporder set orderList = '" + orderList + "'"
				+ " , total = '" + total + "'" + " where orderID = " + orderID;

		// System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 根据id查询临时订单信息
	public void getTmpOrder(int id) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from tmporder where orderID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				orderList = rs.getString("orderList");
				total = rs.getDouble("total");
				// System.out.println("****orderList:" + orderList + "\n");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 删除临时订单信息
	public void deleteTmpOrder(String weixinID) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		// String sql = "select * from users where userID=" + id;
		String sql = "delete from tmporder where weixinID = '" + weixinID + "'";
		statement.execute(sql);
		try {
			// System.out.println("删除微信号为：" + weixinID + "的临时订单成功！\n");
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查询指定快递员信息
	public void getExpressInfo(int id) throws SQLException {
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		String sql = "select * from expressinfo where expressID = '" + id + "'";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				expressID = rs.getInt(1);
				expressName = rs.getString(2);
				expressTel = rs.getString(3);
				expressEmail = rs.getString(4);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * // 删除用户 public void deleteUser(int id) throws SQLException{ Connection
	 * conn = connection.getConnection(); statement = conn.createStatement(); //
	 * String sql = "select * from users where userID=" + id; String sql =
	 * "delete from users where userID = '" + id + "'"; statement.execute(sql);
	 * try { System.out.println("删除成功！！"); conn.close(); } catch (SQLException
	 * e) { // TODO Auto-generated catch block e.printStackTrace(); } }
	 */

	// 生成下一个用户的ID。下一个用户的ID值=数据库中已有的最大ID值+1
	public int generateID(String flag) {
		int id = -1;
		String sql = null;
		Connection conn = connection.getConnection();
		if (flag.equals("userinfo")) {
			sql = "select max(userID) as userID from userinfo";
		} else if (flag.equals("orderlist")) {
			sql = "select max(orderID) as orderID from orderlist";
		} else if (flag.equals("tmporder")) {
			sql = "select max(orderID) as orderID from tmporder";
		}

		// System.out.println(sql);
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			// System.out.println(rs);
			if (rs.next()) {
				if (flag.equals("userinfo")) {
					id = rs.getInt("userID");
				} else if (flag.equals("orderlist")) {
					id = rs.getInt("orderID");
				} else if (flag.equals("tmporder")) {
					id = rs.getInt("orderID");
				}
				id++;
			}
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
				// System.out.println(encode);
				return s;
			}
		} catch (Exception exception) {
		}
		encode = "ISO-8859-1";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s1 = encode;
				// System.out.println(encode);
				return s1;
			}
		} catch (Exception exception1) {
		}
		encode = "UTF-8";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s2 = encode;
				// System.out.println(encode);
				return s2;
			}
		} catch (Exception exception2) {
		}
		encode = "GBK";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s3 = encode;
				// System.out.println(encode);
				return s3;
			}
		} catch (Exception exception3) {
		}
		return "";
	}

}

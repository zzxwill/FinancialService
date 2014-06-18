package test;

import java.sql.SQLException;
import java.util.*; 
import java.text.*;

import login.Validate;
import security.PasswordUtil;
import database.*;

public class test {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub

		//商店测试
		//ShopDao shopDao = new ShopDao();
		//shopDao.insertShop("云海肴(单)");
		//shopDao.modifyShop(4, "云海肴(西单)", "王五", "1520198888", 0);
		//shopDao.deleteShop(5);
		//System.out.println("shopName:" + shopDao.getShopName(2) + "\nshopNum:" + shopDao.getShopNum() + "\n");
		
		//用户测试
		//UserDao userDao = new UserDao();
		//userDao.insertUser("Bob", "Bob", "1111111", 0);
		//userDao.modifyUser(3,"", "222222222");
		//userDao.modifyUserByAdmin(4, "", "3333333", 1, 0);
		//userDao.deleteUser(4);
		//userDao.getUserInfo(4);
		//System.out.println("userName:" + userDao.UserName + "\nuserTel:" + userDao.UserTel + "\nuserGroup:" + userDao.UserGroup + "\nuserNum:" + userDao.getUserNum() + "\n");
		//System.out.println("isUserAdmin:" + userDao.IsUserAdmin("liming") + "\n");
		
		//财务测试
		//System.out.println("DateFormat.getDateInstance():" +  DateFormat.getDateInstance());
		//FinancialDao financialDao = new FinancialDao();
		//financialDao.insertFinancial(2, 2, "2014-03-26", 200, 50, 0, 1, 2, 90, 30, 20, 0, 2, 20, 30, 70, 30, 100, 90, 20, 15, 5);
		//financialDao.insertFinancial(userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks);
		//financialDao.modifyFinancial(2, 1, 2, "2014-03-26", 200, 50, 0, 1, 2, 90, 30, 20, 0, 2, 20, 30, 70, 30, 100, 120, 20, 15, 5);
		//financialDao.modifyFinancialByAdmin(2, 1, 2, "2014-03-26", 200, 50, 0, 1, 2, 90, 30, 20, 0, 2, 20, 30, 70, 30, 100, 120, 20, 15, 5, 1);
		//financialDao.modifyFinancialByAdmin(chartID, userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks, deleteChart)
		//financialDao.deleteFinancial(3);
		//financialDao.getFinancialInfo(3);
		//System.out.println("userName:" + userDao.UserName + "\nuserTel:" + userDao.UserTel + "\nuserGroup:" + userDao.UserGroup + "\nuserNum:" + userDao.getUserNum() + "\n");
		//System.out.println("isUserDel:" + userDao.IsUserDel(4));
		
		//密码验证
		Validate check = new Validate();
		//PasswordUtil GP = new PasswordUtil();
    	//String pw = "admin";
    	//pw = GP.generatePassword(pw);
		//UserDao userDao = new UserDao();
		//userDao.modifyUserByAdmin(3, pw, "3333333", 1, 0);
		//System.out.println("validate:" + check.validate("admin", "admin"));
	}

}

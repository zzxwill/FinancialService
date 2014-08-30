package sms;


import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import java.sql.*;

//import jsonProcess.*;
import database.*;
import tools.*;

public class SendMsg {

	private static String Uid = "律邦投资管理"; //
	private static String Key = "5ab5e279590d787c98e4";
	private static String CompanyName = "【浙江杭州律邦投资有限公司】";
//http://utf8.sms.webchinese.cn/?Uid=律邦投资管理&Key=5ab5e279590d787c98e4&smsMob=18611720947&smsText=abc
	public static void SendMsgProces(String message,String tel) throws Exception {
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://utf8.sms.webchinese.cn"); 
		//http://utf8.sms.webchinese.cn/?Uid=本站用户名&Key=接口安全密码&smsMob=手机号码&smsText=短信内容
		
		client.getHttpConnectionManager().getParams().setConnectionTimeout(30000);
		client.getHttpConnectionManager().getParams().setSoTimeout(30000);
		
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf8");//在头文件中设置转码
		NameValuePair[] data ={ new NameValuePair("Uid", Uid),
				new NameValuePair("Key", Key),
				new NameValuePair("smsMob",tel),
				new NameValuePair("smsText",message)};
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		//System.out.println("statusCode:"+statusCode + "\n");
		for(Header h : headers)
		{
			//System.out.println("h.toString()" + h.toString() + "\n");
		}
		String result = new String(post.getResponseBodyAsString().getBytes("utf-8")); 
		//System.out.println("result:" + result + "\n");

		post.releaseConnection();
	}
	
	//@Override
    public void run(String str_code, String tel) {
		String message = null;
		//String tel = null;		
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			//tel = "15210983731";
			//Tool tool = new Tool();
			//String str_code = tool.GenRandomNum(); 
			message = "您的验证码是：" + str_code + " " + ",三十分钟内有效！";
			SendMsgProces(message,tel);
			System.out.println("在" + ts + "时刻: 验证码【" + str_code + "】发送成功。\n");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    
    public static void main(String args[]) {
    	String msg = "ABC";
    	String tel = "13701280947";//"18611720947";
		String sms_content = null;
		//String tel = null;		
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			sms_content = "恭喜您，您已预约成功！" + msg + " ";
			SendMsgProces(sms_content,tel);
			System.out.println("在" + ts + "时刻: 预约信息【" + msg + "】发送成功。\n");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    
}

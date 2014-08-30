package sms;

import java.util.Timer;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyTimerTask implements ServletContextListener
{ 
	private Timer timer = null;  
	public void contextDestroyed(ServletContextEvent event) 
	{  
		timer.cancel(); 
		event.getServletContext().log("定时器销毁");  
	}   
	
	public void contextInitialized(ServletContextEvent event) 
	{ 
		timer = new Timer(true); 
		/*指定日期
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         Date date = sdf.parse("2010-11-22 15:07:30");
         task.schedule(new MySchedule(), date);
		 */
		event.getServletContext().log("定时器已启动");//添加日志
		
		//调用exportHistoryBean，0表示任务无延迟，5*1000表示每隔5秒执行任务，60*60*1000表示一个小时；
		//timer.schedule(new SendMsg(event.getServletContext()),0,1*60*1000);  
	} 
}
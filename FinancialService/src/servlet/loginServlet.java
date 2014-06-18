package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.UserDao;
import login.Validate;


public class loginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public loginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			login(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		try {
			login(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	 public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
	        UserDao userDao = new UserDao();
		 	String url = "/sys/";
		 	Validate check = new Validate();
	        if(check.validate(request.getParameter("loginUserName"), request.getParameter("loginUserPW"))){
	        	String loginedUserName = request.getParameter("loginUserName");
	        	//System.out.println("username:" + username + "\n");
	        	loginedUserName = java.net.URLEncoder.encode(loginedUserName, "UTF-8");
	        	
	        	//System.out.println("loginSuccess:" + loginedUserName + "\n");

	        	//session
	        	HttpSession session = request.getSession();
	        	session.setAttribute("loginedUserName", loginedUserName);
	        	
	        	if(userDao.IsUserAdmin(loginedUserName)==1){
	        		session.setAttribute("adminCheck", "true");
	        		//System.out.println("adminCheck:" + "admin" + "\n");
	        	}else{
	        		session.setAttribute("adminCheck", "false");
	        	}
	        	session.setMaxInactiveInterval(60*20);//
	    		
	        	request.getRequestDispatcher(url).forward(request, response);
	        }else {
	        	String message = check.message;
	        	request.setAttribute("message", message);
	        	response.setContentType("text/html; charset=utf-8");
	        	response.sendRedirect("../");
	            //request.getRequestDispatcher("/").forward(request, response);
	        }
	   }
}

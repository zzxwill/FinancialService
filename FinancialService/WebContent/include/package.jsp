<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%//@page import="com.nlsde.liming.database.*" %>
<%@page import="database.*" %>
<%@page import="dao.*" %>
<%@page import="login.Validate" %>
<%@page import="tools.*" %>
<%@page import="sms.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="security.*" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adminCheck = null;
String loginedUserName = null;

String sysColor = "#d8a14f";//#FF8C47
String sysFontColor = "#FF8C47";//#d8a14f
String LGName = null;
String LGRole = null;
String curPath = null;
String sysName = "律邦投资有限公司后台管理系统";
String hrSize  = "999 1px";
//D_IMAGES = ImageUrl_tmp;
String P_IMAGES = "/upload/";

%>
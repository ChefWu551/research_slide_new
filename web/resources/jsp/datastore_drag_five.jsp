<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.io.File" %>
<%@page import="main.com.research.util.MysqlUtil" %>
<%@page import="java.io.FileOutputStream" %>
<%@page import="java.io.FileInputStream" %>
//获取系统时间必须导入的
<%@ page import="java.text.*" %>
//获取系统时间必须导入的


<html>
<head><title>Research end! Thank you.</title></head>
<body>
<h2>submit sucess!</h2><br/>
<%
    System.out.println(response);
    String datetime = new SimpleDateFormat("yyyyMMddhhmmss").format(Calendar.getInstance().getTime());
    String type = request.getParameter("type");
    String sort_value_class = request.getParameter("sort_value_class");
    String sort_value_name = request.getParameter("sort_value_name");
    String sort_value_interval = request.getParameter("sort_value_interval");
    String prefer_result = request.getParameter("prefer_result");
    String one_interval_choice = request.getParameter("one_interval_choice");
    String two_interval_choice = request.getParameter("two_interval_choice");
    String three_interval_choice = request.getParameter("three_interval_choice");
    String four_interval_choice = request.getParameter("four_interval_choice");
    String product_feeling = request.getParameter("product_feeling");
    String now_status  = request.getParameter("now_status");
    String involvement_measure = request.getParameter("involvement_measure");
    String mood_measure = request.getParameter("mood_measure");
    String price_sensitivity = request.getParameter("price_sensitivity");
    String self_confidence = request.getParameter("self_confidence");
    String basic_info = request.getParameter("basic_info");

    /************************存文件  start ************************/
//    PrintStream ps = null;
//    ps = new PrintStream(new FileOutputStream(file));
//    ps.println(gradeLevel);
//    ps.close();
    Connection conn = MysqlUtil.getMysqlConnectiong();
    int rs = MysqlUtil.insertDragData2Mysql(conn, type,
            sort_value_class, sort_value_name, sort_value_interval,
            prefer_result, one_interval_choice, two_interval_choice, three_interval_choice, four_interval_choice,
            product_feeling, now_status, involvement_measure,
            mood_measure, price_sensitivity, self_confidence, basic_info);
    System.out.println(rs);
    conn.close();
    /************************存文件  end   ************************/


%>
</body>
</html>
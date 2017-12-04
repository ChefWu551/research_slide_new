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
    String sort_value_name = request.getParameter("sort_value_name");
    String prefer_result = request.getParameter("prefer_result");
    String involvement_measure = request.getParameter("involvement_measure");
    String mood_measure_value = request.getParameter("mood_measure_value");
    String price_sensitivity_value = request.getParameter("price_sensitivity_value");
    String self_confidence = request.getParameter("self_confidence");
    String basic_info = request.getParameter("basic_info");

    /************************存文件  start ************************/
//    PrintStream ps = null;
//    ps = new PrintStream(new FileOutputStream(file));
//    ps.println(gradeLevel);
//    ps.close();
    Connection conn = MysqlUtil.getMysqlConnectiong();
    int rs = MysqlUtil.insertDragData2Mysql(conn, sort_value_name, prefer_result, involvement_measure,
            mood_measure_value, price_sensitivity_value, self_confidence, basic_info);
    System.out.println(rs);
    conn.close();
    /************************存文件  end   ************************/


%>
</body>
</html>
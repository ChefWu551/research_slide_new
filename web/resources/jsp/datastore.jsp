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
    String direction = request.getParameter("direction");
    String id_value = request.getParameter("id_value");
    String page_break_string = request.getParameter("page_break_string");
    String read_time = request.getParameter("page_3_4_totle_time");


    String filename = this.getServletContext().getRealPath("/") + "file" + File.separator + datetime;
//    System.out.println(gradeLevel);
//    File file = new File(filename);
//    if (!file.getParentFile().exists()) {
//        file.getParentFile().mkdir();//如果父文件夹不存在则创建文件夹
//    }
    /************************存文件  start ************************/
//    PrintStream ps = null;
//    ps = new PrintStream(new FileOutputStream(file));
//    ps.println(gradeLevel);
//    ps.close();
    Connection conn = MysqlUtil.getMysqlConnectiong();
    int rs = MysqlUtil.insertData2Mysql(conn, direction, id_value, page_break_string, read_time);
    System.out.println(rs);
    conn.close();
    /************************存文件  end   ************************/


%>
</body>
</html>
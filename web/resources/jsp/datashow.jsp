<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GBK"%>
<%@ page contentType="application/msexcel" %>
<%
    //response.setHeader("Content-disposition","inline; filename=videos.xls");
    response.setHeader("Content-disposition","attachment; filename=test.xls");
    //以上这行设定传送到前端浏览器时的档名为test.xls
    //就是靠这一行，让前端浏览器以为接收到一个excel档
%>
<%@ page import="main.com.research.*"%>
<%@ page import="main.com.research.model.ResearchPage" %>
<%@ page import="main.com.research.util.MysqlUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>"/>
        <title>spring jdbc test</title>
        <meta http-equiv="pragma" content="no-cache"/>
        <meta http-equiv="cache-control" content="no-cache"/>
        <meta http-equiv="expires" content="0"/>
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
        <meta http-equiv="description" content="This is my page"/>
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    </head>
    <body>
        <br/>
        <table border="1" width="100%">
            <tr> <td>方向及振动</td> <td>编号</td> <td>2-3-4-5时间</td><td>2-3-4时间</td>
            </tr>
            <%
                Connection conn = MysqlUtil.getMysqlConnectiong();
                ResultSet rs = MysqlUtil.getDataFromMysql(conn);

                while (rs.next()){
                    String t1 = rs.getString(1);
                    int t2 = rs.getInt(2);
                    String t3 = rs.getString(3);
                    int t4 = rs.getInt(4);
            %>
            <tr>
                <td><%=t1 %></td> <td><%=t2 %></td><td><%=t3 %></td><td><%=t4 %></td>
            </tr>
            <%
                }
            %>


        </table>
    </body>
</html>
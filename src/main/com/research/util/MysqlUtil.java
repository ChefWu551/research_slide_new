package main.com.research.util;

import java.sql.*;

/**
 * Created by lzx on 2017/11/29.
 * 提供mysql数据库服务
 */
public class MysqlUtil {

    //加载驱动程序
    public final static String driverName="com.mysql.jdbc.Driver";
    //连接名
    private final static String hostUrl="rm-wz945xs96l46h8q83o.mysql.rds.aliyuncs.com";
    //用户
    private final static String userName="root";
    //密码
    private final static String password="Wyf23188551";
    //数据库名
    private final static String dbName="research_slide";
    //表名
    private final static String tableName="rs_questionnaire";

    public static Connection getMysqlConnectiong(){
        String url="jdbc:mysql://"+hostUrl+"/"+dbName+"?user="+userName+"&password="+password;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            return DriverManager.getConnection(url);
        } catch (Exception e) {
            return null;
        }
    }

    public static int insertData2Mysql(Connection conn, String direction, String id_value, String page_break_string, String read_time){
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
            String sql=String.format("insert into "+tableName+" (`direction`, `id_value`, `page_break_string`, `read_time`) values ('%s','%s', '%s', '%s')", direction, id_value, page_break_string, read_time);
            int rs;
            rs = stmt.executeUpdate(sql);
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public static ResultSet getDataFromMysql(Connection conn){
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
            String sql=String.format("select `direction`, `id_value`, `page_break_string`, `read_time` from %s", MysqlUtil.tableName);
            return stmt.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

}

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
    private final static String tableNameDrag="df_questionnaire";

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

    public static int insertDragData2Mysql(Connection conn, String type, String sort_value_class, String sort_value_name,String sort_value_interval,
                                           String prefer_result, String involvement_measure, String mood_measure_value,
                                       String price_sensitivity_value, String self_confidence, String basic_info){
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
            String sql=String.format("insert into "+tableNameDrag+" (`type`, `sort_value_class`,`sort_value_name`, `sort_value_interval`, `prefer_result`, `involvement_measure`, `mood_measure_value`, `price_sensitivity_value`, `self_confidence`, `basic_info`)" +
                    " values ('%s','%s','%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", type, sort_value_class, sort_value_name, sort_value_interval, prefer_result, involvement_measure, mood_measure_value, price_sensitivity_value, self_confidence, basic_info);
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

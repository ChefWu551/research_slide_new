package test;

import main.com.research.util.MysqlUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lzx on 2017/11/29.
 * test
 */
public class MysqlUtilTest {

    public static void main(String[] args) {
        Connection conn = MysqlUtil.getMysqlConnectiong();
        ResultSet rs = MysqlUtil.getDataFromMysql(conn);
        try {
            while (rs.next()){
                System.out.println(rs.getInt(1));
            }
        }catch (Exception e){
            System.out.println("e");
        }finally {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}

package org.sc.dao;

import net.sf.json.JSONObject;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoTest {
    public static void main(String[] args) {
        String result=null;
       /*  HospDao hospDao = new HospDao();
        // result = hospDao.hospcodeGenerator(null,"NK","3","2019-05-15");
        String sql = "select  ItemStock from tb_shop_items where ItemId = ? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,"35");
            CommonDao commonDao = new CommonDao();
            result = commonDao.SingleDataQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
*/
       // JSONObject jsonObject = new JSONObject();
      // NewsDao newsDao = new NewsDao();
        MessageDao messageDao =new MessageDao();
         result = messageDao.checkpeoplebyid("0","1");



         System.out.println(result);
    }
}

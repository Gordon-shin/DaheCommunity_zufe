package org.sc.dao;

import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NavDao {
    public String  NavQueryByText(String text)
    {
        String sql = "select * from tb_nav where text=?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,text);
            CommonDao commonDao = new CommonDao();
            result=commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

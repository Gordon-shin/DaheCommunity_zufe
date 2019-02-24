package org.sc.dao;

import org.sc.bean.User;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public User query(String LoginUserName) {
        Connection connection = DBUtil.getConnection();
        String sql = "SELECT * From tb_users WHERE LoginUserName=?";
        PreparedStatement pStatement = null;
        ResultSet rs = null;
        User user = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1, LoginUserName);
            rs = pStatement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserid(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setPersonname(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setGender(rs.getString(2));
                user.setPhone(rs.getString(2));
                user.setAddress(rs.getString(2));
                user.setAvatar(rs.getString(2));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pStatement, connection);
        }
        return user;
    }
}

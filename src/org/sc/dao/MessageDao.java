package org.sc.dao;

import net.sf.json.JSONObject;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MessageDao {
    public  Boolean queryMessageExist(String userId,String contactId){
        String sql = "select * from tb_dialog where diaguser =? and contactUserid =? or contactUserid =? and diaguser =? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        String result=null;
        ResultSet rs ;
        try {
            pStatement =  connection.prepareStatement(sql);
            pStatement.setString(1,userId);
            pStatement.setString(2,contactId);
            pStatement.setString(3,contactId);
            pStatement.setString(4,userId);
            rs = pStatement.executeQuery();
            if (rs.next()){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    public Boolean InsertDiag(JSONObject jsonObject){
        String sql = "insert into  tb_dialog (diaguser,contactUserid,beginTime) values(?,?,?)";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        String result=null;
        try {
            pStatement =  connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("userid"));
            pStatement.setString(2,jsonObject.getString("seller"));
            pStatement.setString(3,jsonObject.getString("time"));
            int i = pStatement.executeUpdate();
            if (i>0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public  String queryMessageById(String DiagId){
        String sql = "select * from tb_message where diaglogId = ?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,DiagId);
            CommonDao commonDao = new CommonDao();
            result = commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String queryDiagId(JSONObject jsonObject){
        String sql = "select * from tb_dialog where diaguser =? and contactUserid =? or contactUserid =? and diaguser =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("userid"));
            pStatement.setString(2,jsonObject.getString("seller"));
            pStatement.setString(3,jsonObject.getString("seller"));
            pStatement.setString(4,jsonObject.getString("userid"));
            CommonDao commonDao = new CommonDao();
            result = commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

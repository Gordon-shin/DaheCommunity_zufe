package org.sc.dao;

import net.sf.json.JSONArray;
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
        String sql = "select * from tb_dialog where diaguser =? and contactUserid =? or diaguser =? and contactUserid =?  ";
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
    public String addmessage(JSONObject jsonObject){
        String sql = "insert  into  tb_message (messagetext, messageuser, addtime,diaglogId) values (?,?,?,?)";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("text"));
            pStatement.setString(2,jsonObject.getString("user"));
            pStatement.setString(3,jsonObject.getString("time"));
            pStatement.setString(4,jsonObject.getString("dialogid"));
            int i =pStatement.executeUpdate();
            if (i>0){
                return "true";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "false";
    }
    public String queryliaotianshi(JSONObject jsonObject){
        String sql = "select * from messagemain where diaguser =? or contactuserid =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        String result = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("id"));
            pStatement.setString(2,jsonObject.getString("id"));
            CommonDao commonDao = new CommonDao();
            result = commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public  String checkpeoplebyid(String userid,String sessionid){
        String sql = "select * from tb_dialog where diaguser =?  and contactuserid =?" +
                " or contactuserid=? and diaguser= ? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        String result = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,userid);
            pStatement.setString(2,sessionid);
            pStatement.setString(3,userid);
            pStatement.setString(4,sessionid);
            CommonDao commonDao = new CommonDao();
            JSONArray jsonArray = JSONArray.fromObject(commonDao.JSONQuery(pStatement));
            if (jsonArray.size()<1){
                sql = "select UserPersonName from tb_users where UserId  =?";
                pStatement = connection.prepareStatement(sql);
                pStatement.setString(1,userid);
                result =commonDao.SingleDataQuery(pStatement);
            }
            else {
                result =  "2";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

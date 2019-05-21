package org.sc.dao;

import net.sf.json.JSONObject;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@SuppressWarnings("all")
public class NewsDao {
    public String getNews(){
        String sql = "select newsid, " +
                "deliveruser, newsclass, " +
                "text, createuser, " +
                "adddate from tb_news ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            CommonDao commonDao = new CommonDao();
            result = commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String reviewNews(){
        String sql = "select  *  from 新闻视图 ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            CommonDao commonDao = new CommonDao();
            result = commonDao.DataTableToJson(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public int addNews(JSONObject jsonObject){
        String sql = "insert into tb_news(deliveruser, newsclass," +
                " text, createuser, adddate,title) values " +
                "(?,?,?,?,?,?) ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        SimpleDateFormat  sdf=new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
        String dateString=sdf.format(new Date());
        int result = 0;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("adminid"));
            pStatement.setString(2,jsonObject.getString("newsclass"));
            pStatement.setString(3,jsonObject.getString("newscontent"));
            pStatement.setString(4,"admin");
            pStatement.setString(5, dateString);
            pStatement.setString(6,jsonObject.getString("newstitle"));
           int judge =  pStatement.executeUpdate();
           if (judge>0){
               result=judge;
           }
           else {
               result=judge;
           }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

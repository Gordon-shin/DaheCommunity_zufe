package org.sc.dao;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.sc.bean.ShopQuery;
import org.sc.util.DBUtil;

import javax.management.Query;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ShopDao {
    public String ShopQuery(String value){
        ShopQuery shopQuery = new ShopQuery();
        String sql = "select  itemid 物品ID,ItemName 物品名称, itemclass 物品分类, itemprice 物品单价,itemunit 单位,itemstock 库存,offeruserid 供货人ID,userPersonname 供货人姓名 from tb_shop_items,tb_users where itemname  like ? and offeruserid =userid";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,"%"+value+"%");
            CommonDao commonDao = new CommonDao();
            result= commonDao.DataTableToJson(pStatement);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String getDetail(String itemid){
        String sql = "select * from tb_shop_items where itemid = ?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,itemid);
            CommonDao commonDao = new CommonDao();
            result = commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public Boolean QueryExistGouwuche(String itemid,String userid){
        String sql = "select * from tb_shop_items_order where ItemId=? and UserId=? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,itemid);
            pStatement.setString(2,userid);
            CommonDao commonDao = new CommonDao();
            result=commonDao.JSONQuery(pStatement);
            System.out.println(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if ("[]".equals(result))
        {
            return true;
        }
        else {
            return false;
        }

    }
    public String addGouWuChe(JSONObject jsonObject){
        String sql = "Insert into tb_shop_items_order(itemid,userid,itemnumber,orderdate,paystatus) values(?,?,?,?,?)";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("itemid"));
            pStatement.setString(2,jsonObject.getString("userid"));
            pStatement.setString(3,jsonObject.getString("number"));
            pStatement.setString(4,jsonObject.getString("orderdate"));
            pStatement.setString(5,"购物车中");
            CommonDao commonDao = new CommonDao();
            result=commonDao.UpdateQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String QueryGWC(String userid){
        String sql = "select tb_shop_items.ItemId 物品编号,ItemName 物品名称,ItemPrice 物品单价,ItemNumber 物品数量,CONVERT(CONVERT((ItemNumber*ItemPrice),DECIMAL(10,2)),char) 总价,OrderDate 加入购物车日期 from tb_shop_items_order,tb_shop_items where tb_shop_items_order.ItemId=tb_shop_items.ItemId and UserId =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,userid);
            CommonDao commonDao = new CommonDao();
            result = commonDao.DataTableToJson(pStatement);
            System.out.println(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  result;
    }
    public String ItemInfoCreate(JSONObject jsonObject){
        String sql = "Insert into tb_shop_items(itemname, itemclass, itemprice, itemunit, itemserialno, itemstock, offeruserid, state, description, addtime,phone)  values(?,?,?,?,?,?,?,?,?,?,?)";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("itemtitle"));
            pStatement.setString(2,jsonObject.getString("itemclass"));
            pStatement.setString(3,jsonObject.getString("price"));
            pStatement.setString(4,jsonObject.getString("itemunit"));
            pStatement.setString(5,jsonObject.getString("barcode"));
            pStatement.setString(6,jsonObject.getString("stock"));
            pStatement.setString(7,jsonObject.getString("userid"));
            pStatement.setString(8,jsonObject.getString("state"));
            pStatement.setString(9,jsonObject.getString("itemdesc"));
            pStatement.setString(10,jsonObject.getString("addTime"));
            pStatement.setString(11,jsonObject.getString("phone"));
            CommonDao commonDao = new CommonDao();
            commonDao.UpdateQuery(pStatement);
            sql = "select last_insert_id()";
            pStatement=connection.prepareStatement(sql);
            result = commonDao.JSONQuery(pStatement);
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;

    }
}

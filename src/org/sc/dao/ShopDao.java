package org.sc.dao;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.sc.bean.ShopQuery;
import org.sc.util.DBUtil;

import javax.management.Query;
import javax.servlet.http.Part;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@SuppressWarnings("all")
public class ShopDao {
    public String ShopQuery(String value){
        ShopQuery shopQuery = new ShopQuery();
        String sql = "select  itemid 物品ID,ItemName 物品名称, " +
                "itemclass 物品分类, itemprice 物品单价,itemunit 单位,itemstock 库存," +
                "offeruserid 供货人ID,userPersonname 供货人姓名 from tb_shop_items," +
                "tb_users where itemname  like ? and offeruserid =userid";
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
        String sql = "Insert into tb_shop_items_order(itemid,userid," +
                "itemnumber,orderdate,paystatus) values(?,?,?,?,?)";
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
        String sql = "select tb_shop_items.ItemId 物品编号,ItemName 物品名称,ItemPrice 物品单价" +
                ",ItemNumber 物品数量,CONVERT(CONVERT((ItemNumber*ItemPrice),DECIMAL(10,2)),char) " +
                "总价,OrderDate 加入购物车日期 from tb_shop_items_order" +
                ",tb_shop_items where tb_shop_items_order.ItemId=tb_shop_items.ItemId " +
                "and UserId =? and payStatus ='购物车中'";
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
        String sql = "Insert into tb_shop_items(itemname, itemclass," +
                " itemprice, itemunit, itemserialno, itemstock, " +
                "offeruserid, state, description, addtime,phone)  values(?,?,?,?,?,?,?,?,?,?,?)";
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
            sql = "select last_insert_id() as lastid";
            pStatement=connection.prepareStatement(sql);
            result = commonDao.JSONQuery(pStatement);
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String deletegwc(JSONArray jsonArray,String userid){
        String result="false";
        for (int i = 0; i< jsonArray.size();i++){
            String sql = "delete from  tb_shop_items_order where ItemId=? and userid = ?";
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = null;
            System.out.println(jsonArray.toString());
            JSONObject jsonobj = JSONObject.fromObject(jsonArray.get(i).toString());
              result ="编号"+jsonobj.getString("id")+"的物品无法删除请联系管理员";
            try {
                pStatement=connection.prepareStatement(sql);
                pStatement.setString(1,jsonobj.getString("id"));
                pStatement.setString(2,userid);
                CommonDao commonDao = new CommonDao();
                result = commonDao.UpdateQuery(pStatement);
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    public String querenfukuan(JSONObject jsonObject){
        JSONArray jsonArray ;
        jsonArray = JSONArray.fromObject(jsonObject.get("itemdetail"));
        String zongjia =jsonObject.get("zongjia").toString();
        String goumairen = jsonObject.get("goumairen").toString();
        String invoicedate = jsonObject.get("invoicedate").toString();
        for (int j = 0; j<jsonArray.size();j++){
            String sql = "select  ItemStock from tb_shop_items where ItemId = ? ";
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = null;
            try {
                pStatement = connection.prepareStatement(sql);
                pStatement.setString(1, jsonArray.getJSONObject(j).getString("id"));
                CommonDao commonDao = new CommonDao();
                int number =Integer.parseInt(jsonArray.getJSONObject(j).getString("number")) ;
                int stocknumber= Integer.parseInt(commonDao.SingleDataQuery(pStatement));
                if (stocknumber-number<0){
                   return "2";//2表示库存不足
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        for (int i =0 ;i<jsonArray.size();i++){
            String sql = "insert into tb_shop_items_invoices(invoiceDate," +
                    " userId, itemId, itemNumber, total, state) values (?,?,?,?,?,?) ";
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = null;
            try {
               pStatement =  connection.prepareStatement(sql);
               pStatement.setString(1,invoicedate);
               pStatement.setString(2,goumairen);
               pStatement.setString(3,jsonArray.getJSONObject(i).getString("id"));
               pStatement.setString(4,jsonArray.getJSONObject(i).getString("number"));
               pStatement.setString(5,jsonArray.getJSONObject(i).getString("xiaoji"));
               pStatement.setString(6,"支付完毕");
               int j = pStatement.executeUpdate();
               if (j<=0){
                   return "false";
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            sql ="update tb_shop_items set ItemStock = ItemStock-? " +
                    "where  ItemId = ?";
            try {
                pStatement =  connection.prepareStatement(sql);
                pStatement.setString(1, jsonArray.getJSONObject(i).getString("number"));
                pStatement.setString(2,jsonArray.getJSONObject(i).getString("id"));
                int j = pStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            sql = "update tb_shop_items_order set payStatus = '已支付' where ItemId=? and userid = ?" ;//delete from  tb_shop_items_order where ItemId=? and userid = ?
            try {
                pStatement =  connection.prepareStatement(sql);
                pStatement.setString(2, goumairen);
                pStatement.setString(1,jsonArray.getJSONObject(i).getString("id"));
                int j = pStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return "0"; //0表示成功
    }
    public String queryalldingdan(JSONObject jsonObject){

        return "";
    }
    public String shopchaxundingdan(JSONObject jsonObject){
        String userid =  jsonObject.get("userid").toString();
        String sql = "select * from  view_shop_invoice where 用户编号 =? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,userid);
            CommonDao commonDao = new CommonDao();
            result =  commonDao.DataTableToJson(pStatement);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String gouwuchexiugaiBtn(String itemid, String number,String userid){
        String sql = "update tb_shop_items_order set" +
                " ItemNumber = ? where UserId=? and itemid =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        try {
            pStatement= connection.prepareStatement(sql);
            pStatement.setString(1,number);
            pStatement.setString(2,userid);
            pStatement.setString(3,itemid);
           if (pStatement.executeUpdate()<1){
               return "0";
           }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "1";
    }
    public String UploadItemqueryBysellerid(String userid){
        String sql = "select itemid, itemname, itemclass, imgurl, " +
                "itemprice, itemunit, itemserialno, itemstock," +
                " offeruserid, state, description, addtime, " +
                "address, phone from tb_shop_items where offerUserId = ?";
        Connection connection = DBUtil.getConnection();
        String result = null;
        PreparedStatement pStatement = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,userid);
            CommonDao commonDao = new CommonDao();
            result = commonDao.DataTableToJson(pStatement);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String modifyitemdata (JSONObject jsonObject,String imagePath){
        String sql = "update tb_shop_items set ItemName =? ,itemclass=?," +
                "ItemPrice=?,ItemUnit=?,ItemSerialNo=?," +
                "ItemStock=?,state='审核中',description=?,Phone=? where ItemId=?";
        Connection connection = DBUtil.getConnection();
        String result = null;
        PreparedStatement pStatement = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1 ,jsonObject.getString("itemtitle1"));
            pStatement.setString(2 ,jsonObject.getString("itemclass1"));
            pStatement.setString(3 ,jsonObject.getString("priceView1"));
            pStatement.setString(4 ,jsonObject.getString("barunit1"));
            pStatement.setString(5 ,jsonObject.getString("barcode1"));
            pStatement.setString(6 ,jsonObject.getString("num1"));
            pStatement.setString(7 ,jsonObject.getString("description"));
            pStatement.setString(8 ,jsonObject.getString("phone1"));
            pStatement.setString(9 ,jsonObject.getString("itemid"));
            int judge = pStatement.executeUpdate();
            if (judge>0){
                if (!"noImage".equals(imagePath)){
                    sql = "update tb_shop_items set imgurl = ? where ItemId =?";
                    pStatement = connection.prepareStatement(sql);
                    pStatement.setString(1,imagePath);
                    pStatement.setString(2,jsonObject.getString("itemid"));
                    judge= pStatement.executeUpdate();
                    if (judge<1){
                        result ="xiugaituxiangshibai";
                    }
                    else{
                        result ="success";
                    }
                }
                else {
                    result ="success";
                }
            }
            else {
                result="xiugaishibai";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String querenshouhuo(String userid, String itemid){
        String sql = "update tb_shop_items_invoices set" +
                " itemstate ='已确认收货',state='已完成' " +
                "where Id = ? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,itemid);
            int judge =  pStatement.executeUpdate();
            if (judge>0){
                result ="success";
            }
            else {
                result ="failed";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String sellerqueryfahuo(String sellerid){
        String sql = "SELECT * from view_shop_invoice WHERE 卖家编号= ?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,sellerid);
            CommonDao commonDao = new CommonDao();
            result = commonDao.DataTableToJson(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String sellerfahuo(String fahuobianhao){
        String sql = "update tb_shop_items_invoices set" +
                " itemstate ='已发货' " +
                "where Id = ? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,fahuobianhao);
            int judge =  pStatement.executeUpdate();
            if (judge>0){
                result ="success";
            }
            else {
                result ="failed";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

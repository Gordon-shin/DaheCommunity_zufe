package org.sc.dao;

import org.sc.bean.ShopQuery;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ShopDao {
    public String ShopQuery(String value){
        ShopQuery shopQuery = new ShopQuery();
        String sql = "select  itemid 物品ID,ItemName 物品名称, class 物品分类, itemprice 物品单价,itemunit 单位,itemstock 库存,offeruserid 供货人ID,userPersonname 供货人姓名 from tb_shop_items,tb_users where itemname  like ? and offeruserid =userid";
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

}

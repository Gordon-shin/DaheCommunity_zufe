package org.sc.dao;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.ZonedDateTime;

public class AdminDao {
    public String AdminRepairQuery(){
        String sql = "Select id as 维修人员编号, staffname as 维修人员姓名, loginname as 登录名, duties as 工种, sparetime as 上班时间, nosparetime as 下班时间, email as 电子邮箱, phone as 电话, company as 物业公司, state as 状态 ,userid as 统一编号 from tb_repair_staff_info order by Id";
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
    public String AdminRepairAdd(JSONObject jsonObject){
        String username = jsonObject.get("username").toString();
        String password = jsonObject.get("password").toString();
        String email = jsonObject.get("email").toString();
        String phone = jsonObject.get("phone").toString();
        String realname = jsonObject.get("realname").toString();
        String idcard = jsonObject.get("idcard").toString();
        String address = jsonObject.get("address").toString();
        String sex = jsonObject.get("sex").toString();




        String result = null;
        PreparedStatement pStatement = null;
        Connection connection = DBUtil.getConnection();
        String sql = "insert into tb_users " +
                "(LoginUserName, LoginPassword, UserPersonName, UserAuth, UserEmail, UserGender, UserPhoneNumber, UserAddress, UserAddTime, UserMoney) " +
                "values (?,?,?,?,?,?,?,?,?,?)";
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,username);
            pStatement.setString(2,password);
            pStatement.setString(3,realname);
            pStatement.setString(4,"维修");
            pStatement.setString(5,email);
            pStatement.setString(6,sex);
            pStatement.setString(7,phone);
            pStatement.setString(8,address);
            pStatement.setString(9,CommonDao.getNowdate());
            pStatement.setString(10,"0");
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
    public String AdminRepairInfoAdd(String id,JSONObject jsonObject){
        JSONArray   idarry;
        idarry = JSONArray.fromObject(id);
        JSONObject idobject = JSONObject.fromObject(idarry.get(0));
        id=  idobject.getString("lastid");
        String realname = jsonObject.get("realname").toString();
        String username = jsonObject.get("username").toString();
        String email = jsonObject.get("email").toString();
        String phone = jsonObject.get("phone").toString();
        String startime = jsonObject.get("startime").toString();
        String endtime = jsonObject.get("endtime").toString();
        String company = jsonObject.get("company").toString();
        String duties = jsonObject.get("duties").toString();
        String result = "false";
        PreparedStatement pStatement ;
        Connection connection = DBUtil.getConnection();
        String sql ="insert into tb_repair_staff_info " +
                "(staffname, loginname, duties, sparetime, nosparetime," +
                " email, phone, company, state,userid) values " +
                "(?,?,?,?,?,?,?,?,?,?)";
        try {
             pStatement = connection.prepareStatement(sql);
             pStatement.setString(1,realname);
             pStatement.setString(2,username);
             pStatement.setString(3,duties);
             pStatement.setString(4,startime);
             pStatement.setString(5,endtime);
             pStatement.setString(6,email);
             pStatement.setString(7,phone);
             pStatement.setString(8,company);
             pStatement.setString(9,"1");
             pStatement.setString(10,id);
            int i = pStatement.executeUpdate();
            if (i>0){
                result = "true";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String AdminDelRepairMan(JSONObject jsonObject){
        PreparedStatement pStatement ;
        Connection connection = DBUtil.getConnection();
        String sql ="delete from tb_repair_staff_info where UserId = ?";
        String result = "false";
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,jsonObject.getString("currentrowid"));
            int i = pStatement.executeUpdate();
            if (i>0){
                String sql2 ="delete from tb_users where UserId = ?";
                pStatement = connection.prepareStatement(sql2);
                pStatement.setString(1,jsonObject.getString("currentrowid"));
                int j = pStatement.executeUpdate();
                if (j>0){
                    result = "true";
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

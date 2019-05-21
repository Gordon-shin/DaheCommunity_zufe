package org.sc.dao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class HospDao {
    public String kscx(){
        String sql = "select * from tb_hosp_discate";
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
    public String QuerydiseaseInfo(String cateid){
        String sql = "select * from tb_hosp_disease where cateid =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,cateid);
            CommonDao commonDao = new CommonDao();
            JSONObject jsonObject =new JSONObject();
            jsonObject.put("id",0);
            jsonObject.put("disName","全部");
            JSONArray jsonArray =JSONArray.fromObject(commonDao.JSONQuery(pStatement));
            jsonArray.add(0,jsonObject);
            result = jsonArray.toString();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String  ksdocinfoQuery(String ks){
        String sql = "select * from 科室信息视图 where 科室编号 =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,ks);
            CommonDao commonDao = new CommonDao();
            result=commonDao.DataTableToJson(pStatement);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String diseasedocinfoQuery(String diseasenum){
        String sql = "select * from 疾病医师信息视图 where 疾病编号 = ?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement= connection.prepareStatement(sql);
            pStatement.setString(1,diseasenum);
            CommonDao commonDao = new CommonDao();
            result=commonDao.DataTableToJson(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public String hospcodeGenerator(String docid,String ksjc,String dicateid,String date){
        String result=null;//2019-05-15
        String sql = "select orderbianhao from tb_hosp_order" +
                " where bookdate = ? and dicateid = ?" +
                " ORDER BY id desc " +
                "LIMIT 1";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,date);
            pStatement.setString(2,dicateid);
            CommonDao commonDao = new CommonDao();
            result = commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        JSONArray jsonArray = JSONArray.fromObject(result);
        if (jsonArray.toString().equals("[]")){
            result = ksjc+CommonDao.getCodeDate(date)+"001";
        }
        else {
            JSONObject jsonObject = jsonArray.getJSONObject(0);
            String count = jsonObject.getString("orderbianhao");
            count = count.substring(count.length()-3);
            int i = Integer.parseInt(count);
            i = i+1;
            count = Integer.toString(i);
            for (int j =0;j<3-Integer.toString(i).length();j++){
                count = "0"+count;
            }
            result = ksjc + CommonDao.getCodeDate(date)+count;
        }
        return result;
    }
    public  int  yiyuanyuyueAdd(String docid,String
            ksjc,String dicateid,String date,String
            yuyuenumber,String cost,String userid){
        int result =0 ;//2019-05-15
        String sql = "insert into tb_hosp_order" +
                "(orderbianhao, docId, userId," +
                " bookdate, cost, paystatue, " +
                "dicateid) values (?,?,?,?,?,?,?) ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,yuyuenumber);
            pStatement.setString(2,docid);
            pStatement.setString(3,userid);
            pStatement.setString(4,date);
            pStatement.setString(5,cost);
            pStatement.setString(6,"已支付");
            pStatement.setString(7,dicateid);
            int i  = pStatement.executeUpdate();
            result  = i;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public String queryyuyuebyuserid (String userid){
        String sql = "select * from 医院挂号单信息 where 用户id =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,userid);
            CommonDao commonDao = new CommonDao();
            result=commonDao.DataTableToJson(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  result;
    }

}

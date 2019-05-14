package org.sc;

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
}

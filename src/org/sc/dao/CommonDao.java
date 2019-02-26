package org.sc.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.sc.util.DBUtil;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;

public class CommonDao {
    public String CommonQuery(String sql){
        Connection connection = DBUtil.getConnection();
        //新建JSON 数组
        JSONArray array =new JSONArray();
        PreparedStatement pStatement = null;
        ResultSet rs = null;
        ResultSetMetaData metaData= null;
        try{
            pStatement = connection.prepareStatement(sql);
            rs = pStatement.executeQuery();
            metaData=rs.getMetaData();
            int columnCount = metaData.getColumnCount();//获取列数
            while (rs.next()){
                JSONObject jsObj = new JSONObject();
                for (int i=1 ; i< columnCount; i++)
                {
                    System.out.println(metaData.getColumnTypeName(i));
                    String type = metaData.getColumnTypeName(i);//获取每一列的类型
                    String columnName = metaData.getColumnLabel(i);//获取每一列的标签
                    if (type=="INT"){
                        jsObj.put(columnName, rs.getInt(i));//若该列是INT类型
                    }
                    else if(type=="DECIMAL"){
                        jsObj.put(columnName,rs.getShort(i));//若该列是"DECIMAL"类型
                    }
                    else {
                        jsObj.put(columnName, rs.getString(i));//其他类型就直接转换
                    }
                }//一列遍历完成 向json数据添加记录
                array.add(jsObj);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
            finally {
            DBUtil.closeJDBC(rs, pStatement, connection);
        }
        return array.toString();
    }

    public String CommonExecute(String sql){


        return "";
    }

    public String CommonAdd(String sql){

        return "";
    }
    public String CommonChange(String sql){

        return "";
    }

}

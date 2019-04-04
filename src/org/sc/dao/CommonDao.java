package org.sc.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.dbutils.QueryRunner;
import org.sc.util.DBUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;
import java.util.Iterator;

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
                for (int i=1 ; i< (columnCount+1); i++)
                {
                    //System.out.println(metaData.getColumnTypeName(i));
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
                array.add(jsObj);//返回Json数组
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

    public JSONObject CommonAdd(String sql) {

        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        JSONObject json =new JSONObject();
        int result = 0;
        try {
            pStatement = connection.prepareStatement(sql);

            result = pStatement.executeUpdate();
            json.put("result",result);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            if (e.getMessage()!=null)
            json.put("error",e.getMessage());
        } finally {
            DBUtil.closeJDBC(null, pStatement, connection);
        }


            return json;

    }

    public String JSONQuery(PreparedStatement sql){
        JSONArray array =new JSONArray();
        ResultSet rs;
        ResultSetMetaData metaData= null;
        try {
            rs =sql.executeQuery();
            metaData=rs.getMetaData();
            int columnCount = metaData.getColumnCount();//获取列数
            while (rs.next()){
                JSONObject jsObj = new JSONObject();
                for (int i=1 ; i< (columnCount+1); i++)
                {   String columnName = metaData.getColumnLabel(i);//获取每一列的标签
                    String type = metaData.getColumnTypeName(i);//获取每一列的类型
                    if (type=="INT"){
                        jsObj.put(columnName, rs.getInt(i));//若该列是INT类型
                        System.out.println("!");
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



        return array.toString();
    }



    public String CommonChange(String sql){

        return "";
    }
    public String UpdateQuery(PreparedStatement sql)
    {
        int result =0;
        String error ="插入查询执行失败";
        try {
            result = sql.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            if (e.getMessage()!=null)
               error = (e.getMessage());
        }
        if (result>0)
        {
            return "true";
        }
        else{
            return error;
        }
    }
   public String  DataTableToJson(PreparedStatement sql)
   {   JSONArray jsonArray ;
       String jsonString =JSONQuery(sql);
       jsonArray = JSONArray.fromObject(jsonString);
       JSONObject jsonobj;
        if (jsonArray.size()<1)
        {
            return "[]";
        }
        else{

               int count = jsonArray.size();
               StringBuilder jsonBuilder = new StringBuilder();
               jsonBuilder.append("{\"total\"");
               jsonBuilder.append(":");
               jsonBuilder.append(count);
               jsonBuilder.append(",\"rows");
               jsonBuilder.append("\":");
               jsonBuilder.append(jsonString);
               jsonBuilder.append(",\"title");
               jsonBuilder.append("\":");
               JSONDao jsonDao =new JSONDao();
               int i =jsonDao.JudgeSize(jsonArray);
               System.out.println(i);
               jsonobj =jsonArray.getJSONObject(i);
               jsonobj.size();
               Iterator<String> jsonobj_Iterator = jsonobj.keys();
               JSONArray titlearray = new JSONArray();

               while(jsonobj_Iterator.hasNext()){
                    JSONObject jsObj = new JSONObject();// 获得key
                    String key = jsonobj_Iterator.next();
                    jsObj.put("field",key);
                    jsObj.put("title",key);
                    jsObj.put("width",100);
                    titlearray.add(jsObj);
               }
               jsonBuilder.append(titlearray.toString());
               jsonBuilder.append("}");
               return jsonBuilder.toString();
        }
   }


    public static void out(HttpServletResponse response, String result) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out =  response.getWriter();
        out.write(result);
    }
    public static void println(String result) {
        System.out.println(result);
    }
}



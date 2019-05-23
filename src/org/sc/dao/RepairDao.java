package org.sc.dao;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.sc.bean.RepairMan;
import org.sc.bean.RepairOrder;
import org.sc.bean.RepairOrderSheet;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static org.sc.util.FunctionUtil.compareTime;
@SuppressWarnings("all")
public class RepairDao {
    public static Boolean RepairTimeJudge (String repairmanid, String chooseTime, String chooseTimeAfter ){//判断时间块冲突函数
        //符合时间的id
        String sql = "Select RepairTime,FinishTime from tb_repair_order where state = '进行中' and Repairmanid = ?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        boolean judge = false;
        JSONArray array = new JSONArray();
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,repairmanid);
            CommonDao commonDao = new CommonDao();
            result= commonDao.JSONQuery(pStatement);
            array = JSONArray.fromObject(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (array.size()>0) {
            for (int i = 0; i < array.size(); i++) {
                JSONObject timeobj = JSONObject.fromObject(array.get(i));
                String repairtime = timeobj.getString("RepairTime");
                String finishTime = timeobj.getString("FinishTime");
                if (compareTime(chooseTime, finishTime) < 0 && compareTime(chooseTimeAfter, finishTime) > 0) {
                    judge = false;
                    break;
                } else if (compareTime(chooseTime, repairtime) < 0 && compareTime(chooseTimeAfter, finishTime) < 0) {
                    judge = false;
                    break;
                } else if (compareTime(chooseTime, repairtime) < 0 && compareTime(chooseTimeAfter, finishTime) > 0) {
                    judge = false;
                    break;
                } else if (compareTime(chooseTime, repairtime) > 0 && compareTime(chooseTimeAfter, finishTime) < 0) {
                    judge = false;
                    break;
                } else {
                    judge = true;
                }
            }
        }
        else {
            judge = true;
        }
        return judge;
    }
    public String repairInfoQuery(JSONObject jsonobj/*RepairOrder repairOrder*/){
        String duty = jsonobj.getString("duty");
        String sparetime = jsonobj.getString("datetime");
        String datetimeAfter = jsonobj.getString("datetimeAfter");
        String sql = "select Id  from tb_repair_staff_info where duties= ?  and  Sparetime<? and NOSParetime>? and state='1'";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        JSONDao jsonDao = new JSONDao();
        String result=null;
        String queryId = null;
        JSONArray allowid = new JSONArray();
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,duty);
            pStatement.setString(2,sparetime);
            pStatement.setString(3,datetimeAfter);
            CommonDao commonDao = new CommonDao();
            queryId =  commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
      JSONArray idArry =   JSONArray.fromObject(queryId);
        for (int i=0;i<idArry.size();i++)
        {
            JSONObject id = JSONObject.fromObject(idArry.get(i));
           String idNum = id.getString("Id");//获取符合职位的id

           if (RepairTimeJudge(idNum,sparetime,datetimeAfter).equals(true))
             {
                allowid.add(idNum);
           }
        }
        System.out.println(allowid);
        String sql2 = "select Id,StaffName,LoginName,Duties,Email,Phone,Company " +
                "from tb_repair_staff_info where duties= ? and " +
                " Sparetime<? and NOSParetime>? and state='1'";
        StringBuffer sBuffer = new StringBuffer(sql2);
        if (allowid.size()>0){
            for(int i = 0;i<allowid.size();i++)
            {
                String id = allowid.get(i).toString();
                if (i==0)
                {
                    sBuffer.append(" and id=");
                    sBuffer.append(id);
                }
                else {
                    sBuffer.append(" or id=");
                    sBuffer.append(id);
                }
            }
        }
        sql2 = sBuffer.toString();
        pStatement =null;
        result = null;
        try {
            CommonDao commonDao = new CommonDao();
            pStatement=connection.prepareStatement(sql2);
            pStatement.setString(1,duty);
            pStatement.setString(2,sparetime);
            pStatement.setString(3,datetimeAfter);
            result= jsonDao.JSONAndDataGrid(commonDao.JSONQuery(pStatement));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        /* Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        JSONDao jsonDao = new JSONDao();
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            CommonDao commonDao = new CommonDao();
            pStatement.setString(1,repairOrder.getDuty());
            pStatement.setString(2,repairOrder.getDatetime());
            pStatement.setString(3,repairOrder.getDatetime());
            result= jsonDao.JSONAndDataGrid(commonDao.JSONQuery(pStatement));
           // System.out.println(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;*/

       return result;
    }
    public  String repairOrder(RepairOrderSheet repairOrderSheet){
        String sql = "Insert into tb_repair_order(userid,repairmanid,repairtime,finishtime,state,starttime) values(?,?,?,?,?,?)";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,repairOrderSheet.getUserId());
            pStatement.setString(2,repairOrderSheet.getRepairId());
            pStatement.setString(3,repairOrderSheet.getRepairTime());
            pStatement.setString(4,repairOrderSheet.getFinishTime());
            pStatement.setString(5,repairOrderSheet.getState());
            pStatement.setString(6,repairOrderSheet.getStartTime());
            CommonDao commonDao = new CommonDao();
            result=commonDao.UpdateQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    public String repairInfoUpdate(RepairMan repairMan){
        String sql = "update tb_repair_staff_info set state='1' where id=? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,repairMan.getId());
            CommonDao commonDao = new CommonDao();
            result =commonDao.UpdateQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    public String OrderQuery(String userid){
        String sql = "select yyid 预约编号, tb_repair_order.userid 用户编号 ,(select userpersonname from tb_users where tb_users.userid =?) 用户姓名,repairmanid 维修人员编号 , Staffname 维修人员姓名,starttime 预约开始时间,repairtime 预约时间,finishtime 预计完成时间 , tb_repair_order.state 状态 from tb_repair_order,tb_repair_staff_info where tb_repair_order.userid=? and id=repairmanid and  tb_repair_order.state='进行中'";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result = null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,userid);
            pStatement.setString(2,userid);
            CommonDao commonDao = new CommonDao();
            result=commonDao.DataTableToJson(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public String CancelOrder(String orderid,String repairmanid)
    {
        String sql = "update tb_repair_order set " +
                "state ='用户取消' where yyid=? ";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result = null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,orderid);
            CommonDao commonDao = new CommonDao();
            result =commonDao.UpdateQuery(pStatement);
            if ("true".equals(result)){
                sql="update tb_repair_staff_info set " +
                        "state='1' where id=? ";
                pStatement=connection.prepareStatement(sql);
                pStatement.setString(1,repairmanid);
                result =commonDao.UpdateQuery(pStatement);
            }
            else {
                return result;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    public String Createweixiudan(JSONObject jsonObject){
        String sql = "Insert into tb_repair_sheet" +
                "(userid, repairmanid, orderid, zzsname," +
                " errordescription, sheetendtime, price) values" +
                "(?,?,?,?,?,?,?)";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        String lastid =null;
        String lastidQuery = "select last_insert_id() as lastid";
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(7,jsonObject.get("price").toString());
            pStatement.setString(1,jsonObject.get("yuyuerenyuanid").toString());
            pStatement.setString(2,jsonObject.get("weixiurenyuangonhao").toString());
            pStatement.setString(3,jsonObject.get("yuyuebianhao").toString());
            pStatement.setString(4,jsonObject.get("zzs").toString());
            pStatement.setString(5,jsonObject.get("desc").toString());
            pStatement.setString(6,jsonObject.get("addTime").toString());
            if (pStatement.executeUpdate()>0){
                pStatement = connection.prepareStatement(lastidQuery);
                CommonDao commonDao = new CommonDao();
                result = commonDao.SingleDataQuery(pStatement);
                String stateupdate = "update tb_repair_order set state ='完成' where yyId = ?";
                pStatement = connection.prepareStatement(stateupdate);
                pStatement.setString(1,jsonObject.get("yuyuebianhao").toString());
                pStatement.executeUpdate();
            }
            else {
                result="false";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public void Updateweixiudanimg(String lastid,String path){
        String sql = "update tb_repair_sheet set ErrorPictureUrl = ? where SheetsId = ?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,path);
            pStatement.setString(2,lastid);
            pStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public  String Queryweixiudan(String userid){
        String sql = "select  * from 维修单视图 where 用户编号 =?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
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
    public String UpdateReview(String repairid,String review){
        String sql = "update tb_repair_sheet set Review = ? where SheetsId = ?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,review);
            pStatement.setString(2,repairid);
            int judge = pStatement.executeUpdate();
            if (judge>0){
                result = "success";
            }
            else{
                result = "failed";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
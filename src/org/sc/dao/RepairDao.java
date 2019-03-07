package org.sc.dao;

import org.sc.bean.RepairMan;
import org.sc.bean.RepairOrder;
import org.sc.bean.RepairOrderSheet;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RepairDao {
    public String repairInfoQuery(RepairOrder repairOrder){
        String sql = "select Id,StaffName,LoginName,Duties,Email,Phone,Company from tb_repair_staff_info where duties= ? and  Sparetime<? and NOSParetime>? and state='1'";
        Connection connection = DBUtil.getConnection();
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
        String sql = "update tb_repair_staff_info set state='0' where id=? ";
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
        String sql = "select * from tb_repair_order where userid=?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result = null;
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1,userid);
            CommonDao commonDao = new CommonDao();
            result=commonDao.DataTableToJson(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
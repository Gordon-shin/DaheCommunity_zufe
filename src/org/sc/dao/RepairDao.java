package org.sc.dao;

import org.sc.bean.RepairOrder;
import org.sc.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RepairDao {
    public String repairInfoQuery(RepairOrder repairOrder){
        String sql = "select Id,StaffName,LoginName,Duties,Email,Phone,Company from tb_repair_staff_info where duties= ? and  Sparetime<? and NOSParetime>?";
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
            System.out.println(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

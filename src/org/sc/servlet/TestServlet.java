package org.sc.servlet;

import org.sc.dao.CommonDao;
import org.sc.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "TestServlet" , value="/TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = "select * from tb_users where loginusername = ?";
        String json = null;

        Connection connection = DBUtil.getConnection();
        try {
            PreparedStatement pStatement = connection.prepareStatement(sql);
             pStatement.setString(1,"zhangsan");
             CommonDao commonDao = new CommonDao();
              json = commonDao.JSONQuery(pStatement);
             System.out.println(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

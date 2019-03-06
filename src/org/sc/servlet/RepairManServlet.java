package org.sc.servlet;

import org.sc.dao.CommonDao;
import org.sc.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RepairManServlet", value="/RepairManServlet")
public class RepairManServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String result=null;
        String sql = "Select DISTINCT(duties) from tb_repair_staff_info";
        try {
            pStatement=connection.prepareStatement(sql);
            CommonDao commonDao = new CommonDao();
           result = commonDao.JSONQuery(pStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();
        out.write(result);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

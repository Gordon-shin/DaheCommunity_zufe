package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.dao.RepairDao;
import org.sc.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.Iterator;


@WebServlet(name = "OrderManagerServlet",value = "/OrderManagerServlet")
public class OrderManagerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String method =request.getParameter("method");
        if ("cancel".equals(method)) {
            JSONObject jsonObject =JSONObject.fromObject(request.getParameter("data"));
           String repairmanid = jsonObject.getString("repairmanid");
           String orderid = jsonObject.getString("orderid");
           RepairDao repairDao = new RepairDao();
          String result = repairDao.CancelOrder(orderid,repairmanid);
          CommonDao.out(response,result);
        } else if (method == "") {

        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

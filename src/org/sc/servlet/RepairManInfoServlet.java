package org.sc.servlet;

import org.sc.bean.RepairOrder;
import org.sc.dao.RepairDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "RepairManInfoServlet",value = "/RepairManInfoServlet")
public class RepairManInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String duty = request.getParameter("duty");
        String datetime = request.getParameter("datetime");
        RepairOrder  repairOrder= new RepairOrder();
        repairOrder.setDuty(duty);
        repairOrder.setDatetime(datetime);
        repairOrder.setDatetime(datetime);
        RepairDao repairDao = new RepairDao();
        String result =repairDao.repairInfoQuery(repairOrder);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(result);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

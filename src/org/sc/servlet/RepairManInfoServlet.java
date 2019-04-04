package org.sc.servlet;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.sc.bean.RepairOrder;
import org.sc.dao.RepairDao;
import org.sc.util.FunctionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "RepairManInfoServlet",value = "/RepairManInfoServlet")
public class RepairManInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String duty = request.getParameter("duty");
        String datetime = request.getParameter("datetime");
        FunctionUtil functionUtil = new FunctionUtil();
        String datetimeAfter = functionUtil.addTime(datetime,3);
        JSONObject jsonObject  = new JSONObject();
        jsonObject.put("duty",duty);
        jsonObject.put("datetime",datetime);
        jsonObject.put("datetimeAfter",datetimeAfter);
        RepairDao repairDao = new RepairDao();
        String result = repairDao.repairInfoQuery(jsonObject);
        /*RepairOrder  repairOrder= new RepairOrder();
        RepairDao repairDao = new RepairDao();
        String result =repairDao.repairInfoQuery(jsonObject);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(result);*/
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(result);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

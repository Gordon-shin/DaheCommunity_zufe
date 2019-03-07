package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.bean.RepairMan;
import org.sc.bean.RepairOrder;
import org.sc.bean.RepairOrderSheet;
import org.sc.dao.JSONDao;
import org.sc.dao.RepairDao;
import org.sc.util.FunctionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RepairOrderServlet",value = "/RepairOrderServlet")
public class RepairOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json =request.getParameter("data");
        System.out.println(json);
        JSONObject jsobj = JSONObject.fromObject(json);
        System.out.println(jsobj.getString("userid"));
        FunctionUtil functionUtil = new FunctionUtil();
        RepairMan repairMan = new RepairMan();
        repairMan.setId(jsobj.getString("repairmanid"));
        RepairOrderSheet repairOrderSheet = new RepairOrderSheet();

        repairOrderSheet.setUserId(jsobj.getString("userid"));
        repairOrderSheet.setRepairId(jsobj.getString("repairmanid"));
        repairOrderSheet.setRepairTime(jsobj.getString("chooseTime"));
        repairOrderSheet.setStartTime(functionUtil.getNow());
        repairOrderSheet.setState("进行中");
        repairOrderSheet.setFinishTime(functionUtil.addTime(jsobj.getString("chooseTime"),3));

        RepairDao repairDao=new RepairDao();
        repairDao.repairOrder(repairOrderSheet);
        repairDao.repairInfoUpdate(repairMan);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

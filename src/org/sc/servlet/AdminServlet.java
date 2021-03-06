package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.AdminDao;
import org.sc.dao.CommonDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("AdminRepairQuery".equals(method)){
            String result ;
            AdminDao adminDao = new AdminDao();
            result =   adminDao.AdminRepairQuery();
            CommonDao.out(response,result);
        }
        else if ("AdminAddRepairMan".equals(method)){
            JSONObject jsonObject = JSONObject.fromObject(request.getParameter("data"));
            AdminDao adminDao = new AdminDao();
            String id = adminDao.AdminRepairAdd(jsonObject);
            String result = adminDao.AdminRepairInfoAdd(id,jsonObject);
            CommonDao.out(response,result);
        }
        else if ("AdminDelRepairMan".equals(method)){
           JSONObject jsonObject = JSONObject.fromObject(request.getParameter("data"));
           AdminDao adminDao = new AdminDao();
           String result = adminDao.AdminDelRepairMan(jsonObject);
           CommonDao.out(response,result);
        }
        else if ("updateRepairManTime".equals(method)){
            JSONObject jsonObject = JSONObject.fromObject(request.getParameter("data"));
            AdminDao adminDao = new AdminDao();
            String result = adminDao.updateRepairManTime(jsonObject);
            CommonDao.out(response,result);
        }
        else if ("AdminShopshengheQuery".equals(method)){
            AdminDao adminDao = new AdminDao();
            String result = adminDao.AdminShopshengheQuery();
            CommonDao.out(response,result);
        }
        else if("AdminShopPass".equals(method)){

            String shopid = request.getParameter("data");
            AdminDao adminDao = new AdminDao();
            String result = adminDao.AdminShopPass(shopid);
            CommonDao.out(response,result);

        }
        else if ("querygerenyuebyid".equals(method)){
            String userid = request.getParameter("sessionid");
            String result;
            CommonDao commonDao = new CommonDao();
            result = commonDao.querygerenyuebyid(userid);
            CommonDao.out(response,result);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

package org.sc.servlet;

import org.sc.dao.CommonDao;
import org.sc.dao.RepairDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RepaiweixiudanServlet",value = "/RepaiweixiudanServlet")
public class RepaiweixiudanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
         if ("Queryweixiubiao".equals(method)){
            RepairDao repairDao = new RepairDao();
            String  result =  repairDao.Queryweixiudan(request.getParameter("userid"));
            CommonDao.out(response,result);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}

package org.sc.servlet;

import org.sc.HospDao;
import org.sc.dao.CommonDao;
import org.sc.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "HospitalServlet",value = "/HospitalServlet")
public class HospitalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("kscx".equals(method)){
            String result ;
            HospDao hospDao = new HospDao();
            result =  hospDao.kscx();
            CommonDao.out(response,result);
        }
        else if("querydiseaseinfo".equals(method)){
            String result ;
            String ksid = request.getParameter("ksid");
            HospDao hospDao = new HospDao();
            result =  hospDao.QuerydiseaseInfo(ksid);
            CommonDao.out(response,result);
        }
        else if("ksdocinfoQuery".equals(method)){
            String result ;
            String ksid = request.getParameter("ks");
            HospDao hospDao = new HospDao();
            result = hospDao.ksdocinfoQuery(ksid);
            CommonDao.out(response,result);
        }
        else if("diseasedocinfoQuery".equals(method)){
            String result ;
            String diseasenum = request.getParameter("diseasenum");
            HospDao hospDao = new HospDao();
            result = hospDao.diseasedocinfoQuery(diseasenum);
            CommonDao.out(response,result);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

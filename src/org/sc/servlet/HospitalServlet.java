package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.HospDao;
import org.sc.dao.CommonDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        else if ("yiyuanyuye".equals(method)){
            String result;
            JSONObject jsonObject = JSONObject.fromObject(request.getParameter("data"));
            HospDao hospDao = new HospDao();
            String docid = jsonObject.getString("docid");
            String ksjc = jsonObject.getString("ksjc");
            String dicateid = jsonObject.getString("dicateid");
            String date = jsonObject.getString("date");
            String userid = jsonObject.getString("userid");
            String cost =jsonObject.getString("cost");
            result = hospDao.hospcodeGenerator(docid,ksjc,dicateid,date);
            JSONObject object = new JSONObject();
            object.put("bianhao",result);
            int j = hospDao.yiyuanyuyueAdd(docid,ksjc,dicateid,date,result,cost,userid);
            object.put("result",Integer.toString(j));
            CommonDao.out(response,object.toString());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

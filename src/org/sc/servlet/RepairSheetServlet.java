package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.dao.ImageDao;
import org.sc.dao.RepairDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
@MultipartConfig
@WebServlet(name = "RepairSheetServlet",value = "/RepairSheetServlet")
public class RepairSheetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type","text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = JSONObject.fromObject(request.getParameter("JSON"));
        String method = request.getParameter("method");
        Part part = request.getPart("File");
        long size = part.getSize();
        if ("weixiudan".equals(method)){
            if (size<200){
                 RepairDao repairDao = new RepairDao();
                 String lastid =  repairDao.Createweixiudan(jsonObject);
                 if (!lastid.isEmpty()&&lastid!=null){
                     CommonDao.out(response,"true");
                 }
                 else {
                     CommonDao.out(response,"false");
                 }
            }
            else {
                RepairDao repairDao = new RepairDao();
                String lastid =  repairDao.Createweixiudan(jsonObject);
                ImageDao imageDao = new ImageDao();
                String newFileName =imageDao.WriteImage(part,part.getSubmittedFileName(),request,"repairsheet");
                String path = "img/upload/repairsheet/"+newFileName;
                repairDao.Updateweixiudanimg(lastid,path);
                if (!lastid.isEmpty()&&lastid!=null){
                    CommonDao.out(response,"true");
                }
                else {
                    CommonDao.out(response,"false");
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}

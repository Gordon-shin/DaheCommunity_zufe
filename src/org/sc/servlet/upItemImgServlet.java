package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.dao.ImageDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
@MultipartConfig
@WebServlet(name = "upItemImgServlet",value = "/upItemImgServlet")
public class upItemImgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part part = request.getPart("File");
        String fileName = part.getSubmittedFileName();
        JSONObject jsonObject =  JSONObject.fromObject(request.getParameter("JSON"));
       if (jsonObject.get("method").equals("itemPic")){
           ImageDao imageDao = new ImageDao();
           String name = imageDao.WriteImage(part,fileName,request,"item");
           String lastid = jsonObject.get("lastitemid").toString();
          // System.out.println(lastid);
           String result  = imageDao.updateItemImagePath("img/upload/item/"+name,lastid);
          CommonDao.out(response,result);
       }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

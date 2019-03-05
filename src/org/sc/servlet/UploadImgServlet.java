package org.sc.servlet;

import org.sc.dao.InsertImg;
import org.sc.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;
import org.sc.dao.CommonDao;

@MultipartConfig
@WebServlet(name = "UploadImgServlet" , value="/UploadImgServlet")
public class UploadImgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type","text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String uname =request.getParameter("username");
        System.out.println(request.getParameter("username"));
        /*Map<String, String[]> map = request.getParameterMap();
        for(String key: map.keySet())
        {
            System.out.println(key);
        }
        for(String[] value: map.values())
        {
            System.out.println(value);
        }*/
        Part part = request.getPart("File");
      //  System.out.println(part);
        String fileName = part.getSubmittedFileName();
      //  System.out.println(fileName);
        String avatar = "";
        Boolean b;
        if (fileName != null && !"".equals(fileName)) {
            String newFileName = UUID.randomUUID().toString() + "_" + fileName;
            String filePath = getServletContext().getRealPath("/img/upload/users");
            File f = new File(filePath);
            b=!(f.exists());
           // System.out.println(b);
            if (b) {
                f.mkdirs();
            }
           // System.out.println(filePath);
            part.write(filePath + "/" + newFileName);
           // System.out.println(newFileName);
            avatar = newFileName;
        }
        String result;
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement = null;
        String sql = " update tb_users set useravatar = ? where  LoginUserName= ?";
        try {
            pStatement=connection.prepareStatement(sql);
            pStatement.setString(1, avatar);
            pStatement.setString(2,uname);
            CommonDao commonDao = new CommonDao();
            result= commonDao.UpdateQuery(pStatement);

        } catch (SQLException e) {
            e.printStackTrace();
        }





    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}

package org.sc.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@MultipartConfig
@WebServlet(name = "UploadImgServlet" , value="/UploadImgServlet")
public class UploadImgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        for(String key: map.keySet())
        {
            System.out.println(key);
        }
        for(String[] value: map.values())
        {
            System.out.println(value);
        }
        Part part = request.getPart("File");
        System.out.println(part);
        String fileName = part.getSubmittedFileName();
        System.out.println(fileName);
        String avatar = "";
        Boolean b;
        if (fileName != null && !"".equals(fileName)) {
            String newFileName = UUID.randomUUID().toString() + "_" + fileName;
            String filePath = getServletContext().getRealPath("/img/upload/users");
            File f = new File(filePath);
            b=!(f.exists());
            System.out.println(b);
            if (b) {
                f.mkdirs();
            }
            System.out.println(filePath);
            part.write(filePath + "/" + newFileName);
            System.out.println(newFileName);
            avatar = newFileName;
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}

package org.sc.dao;

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
import java.util.UUID;

public class ImageDao {
    public String WriteImage(Part part, String fileName, HttpServletRequest request,String dir) throws IOException {   Boolean b;
        String filePath;
        String newFileName = null;
        if (fileName != null && !"".equals(fileName)) {
         newFileName = UUID.randomUUID().toString() + "_" + fileName;
         filePath = request.getServletContext().getRealPath("/img/upload/"+dir);
        File f = new File(filePath);
        b=!(f.exists());
        // System.out.println(b);
        if (b) {
            f.mkdirs();
        }
        // System.out.println(filePath);
        part.write(filePath + "/" + newFileName);
        // System.out.println(newFileName);

    }

        return newFileName;
    }
    public String updateItemImagePath(String url,String itemid  ){
        String sql = "update tb_shop_items set imgurl =? where ItemId=?";
        Connection connection = DBUtil.getConnection();
        PreparedStatement pStatement ;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1,url);
            pStatement.setString(2,itemid);
            int i =pStatement.executeUpdate();
            if (i>0){
                return "true";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "false";

    }
}

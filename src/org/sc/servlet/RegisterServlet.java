package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.dao.UserDao;
import org.sc.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value="/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String json = request.getParameter("data");
        System.out.println(json);
        JSONObject jsonObject = JSONObject.fromObject(json);
         String username = jsonObject.get("username").toString();
         String password = jsonObject.get("password").toString();
         String email = jsonObject.get("email").toString();
         String phone = jsonObject.get("phone").toString();
         String realname = jsonObject.get("realname").toString();
         String idcard = jsonObject.get("idcard").toString();
         String address = jsonObject.get("address").toString();
         String sex = jsonObject.get("sex").toString();
         String sql = new StringBuilder().append("INSERT INTO tb_users ").append("(LoginUserName, LoginPassword,UserPersonName,UserAuth,UserEmail,UserGender,UserPhoneNumber,UserAddress) ").append("VALUES ('").append(username).append("'").append(",'").append(password).append("','").append(realname).append("',").append("'用户','").append(email).append("','").append(sex).append("','").append(phone).append("','").append(address).append("')").toString();
         System.out.println(sql);

        CommonDao add =  new CommonDao();
        UserDao userDao = new UserDao();

        JSONObject result = add.CommonAdd(sql);

        userDao.addCookie(username,request,response);

        PrintWriter out = response.getWriter();
        if ( !result.has("error")){
            out.write("true");
        }
        else {
            out.write(result.get("error").toString());

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

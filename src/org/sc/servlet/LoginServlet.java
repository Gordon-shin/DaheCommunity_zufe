package org.sc.servlet;

import org.sc.bean.User;
import org.sc.dao.UserDao;
import org.sc.util.EncryptTool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean result = false;
        UserDao userDao = new UserDao();
        User user = userDao.query(username);
        if (user!=null && user.getPassword().equals(password)){

            result = true;
            response.setContentType("text/html;charset=utf-8");

            // 设置session
            HttpSession session = request.getSession(true);
            user.setPassword("");
            session.setAttribute("User", user);
            // 存取cookie
            Cookie cookieId = new Cookie("username", EncryptTool.encodeBase64(username));
            Cookie cookiePassword = new Cookie("password",EncryptTool.encodeBase64(password));
            Cookie cookieName = new Cookie("PersonName", EncryptTool.encodeBase64(user.getPersonname()));
            cookieId.setMaxAge(3600*24*365);
            cookiePassword.setMaxAge(3600*24*365);
            response.addCookie(cookieId);
            response.addCookie(cookiePassword);
            response.addCookie(cookieName);
            PrintWriter out = response.getWriter();
            out.write("true");
        }
        else{
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.write("false");
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request,response);

    }
}

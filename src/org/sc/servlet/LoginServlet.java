package org.sc.servlet;

import org.sc.bean.User;
import org.sc.dao.UserDao;
import org.sc.util.EncryptTool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value="/LoginServlet")

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
         String method = request.getParameter("method");
        if ("manager".equals(method)){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserDao userDao = new UserDao();
            User user = userDao.adminQuery(username);
            if (user != null && user.getPassword().equals(password)) {
                response.setContentType("text/html;charset=utf-8");
                userDao.addAdminCookie(username, request, response);
                PrintWriter out = response.getWriter();
                out.write("true");
            } else {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.write("false");
            }
        }
        else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserDao userDao = new UserDao();
            User user = userDao.query(username);
            if (user != null && user.getPassword().equals(password)) {
                response.setContentType("text/html;charset=utf-8");
                userDao.addCookie(username, request, response);
                PrintWriter out = response.getWriter();
                out.write("true");
            } else {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.write("false");
            }

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request,response);

    }
}

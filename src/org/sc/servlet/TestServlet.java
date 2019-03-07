package org.sc.servlet;

import org.sc.dao.CommonDao;
import org.sc.util.DBUtil;
import org.sc.util.FunctionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "TestServlet" , value="/TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FunctionUtil functionUtil =       new FunctionUtil();
        String a = functionUtil.addTime("2019-03-07 10:19:51",24);
        System.out.println(a);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

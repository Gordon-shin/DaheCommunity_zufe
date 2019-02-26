package org.sc.servlet;

import org.sc.dao.CommonDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet( "/NavServlet")
public class NavServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = "0" ;
        request.setAttribute("id",id);
        System.out.println(request.getParameter("id"));
        if (request.getParameter("id")!=null){
            id=request.getParameter("id");
        }
        request.setAttribute("wo","g");

        CommonDao commonDao = new CommonDao();
        String sql = "select id,text,state,iconCls from tb_nav where nodeid="+id;
        String jsonStr = commonDao.CommonQuery(sql);
        PrintWriter out = response.getWriter();
        out.print(jsonStr);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

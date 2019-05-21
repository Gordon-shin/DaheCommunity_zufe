package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.dao.NewsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "newsServlet",value = "/newsServlet")
public class newsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String method = request.getParameter("method");
       if ("getnews".equals(method)){
           String result = null;
           NewsDao newsDao  = new NewsDao();
           result =  newsDao.getNews();
           CommonDao.out(response,result);
       }
       else if ("reviewNews".equals(method)){
           String result = null;
           NewsDao newsDao  = new NewsDao();
           result =  newsDao.reviewNews();
           CommonDao.out(response,result);
       }
       else if ("addNews".equals(method)){
           String result;
           JSONObject jsonObject = JSONObject.fromObject(request.getParameter("data"));
           NewsDao newsDao  = new NewsDao();
           result =  Integer.toString(newsDao.addNews(jsonObject));
           CommonDao.out(response,result);
       }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

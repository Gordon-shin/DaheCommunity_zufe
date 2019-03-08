package org.sc.servlet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.dao.NavDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NavQueryByTextServlet",value = "/NavQueryByTextServlet")
public class NavQueryByTextServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NavDao navDao = new NavDao();
        String text = request.getParameter("text");
        String result = navDao.NavQueryByText(text);
        JSONArray  jsonarray = JSONArray.fromObject(result);
        JSONObject jsonObject = jsonarray.getJSONObject(0);
        result= jsonObject.toString();
        CommonDao.out(response,result);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

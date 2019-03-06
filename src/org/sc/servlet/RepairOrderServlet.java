package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.JSONDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RepairOrderServlet",value = "/RepairOrderServlet")
public class RepairOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json =request.getParameter("data");
        JSONObject jsonObject;
        System.out.println(json);
        jsonObject = JSONObject.fromObject(json);
        System.out.println(jsonObject);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

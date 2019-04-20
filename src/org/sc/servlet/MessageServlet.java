package org.sc.servlet;

import net.sf.json.JSONObject;
import org.sc.dao.CommonDao;
import org.sc.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MessageServlet" ,value = "/MessageServlet")
public class MessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String method =  request.getParameter("method");
       JSONObject jsonObject = JSONObject.fromObject(request.getParameter("data"));
       if ("queryMessageExist".equals(method)){
            String  itemSellerid = jsonObject.getString("seller");
            String  userid = jsonObject.getString("userid");
           MessageDao messageDao = new MessageDao();
           if (messageDao.queryMessageExist(userid,itemSellerid))
           {
               CommonDao.out(response,"true");
           }
           else{
               CommonDao.out(response,"false");
           }

       }
       else if("insertDiag".equals(method)){
            MessageDao messageDao = new MessageDao();
            if (messageDao.InsertDiag(jsonObject)){
                CommonDao.out(response,"会话建立成功");
            }
            else{
                CommonDao.out(response,"会话建立失败");
            }
       }
       else if ("queryDiagId".equals(method)){
           MessageDao messageDao = new MessageDao();
           String result;
           result = messageDao.queryDiagId(jsonObject);
           System.out.println(result);
           CommonDao.out(response,result);

       }
       else if ("queryMessageById".equals(method)){
           MessageDao messageDao = new MessageDao();
           String result;
           String DiagId = request.getParameter("digid");
           result = messageDao.queryMessageById(DiagId);
           System.out.println(result);
           CommonDao.out(response,result);

       }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

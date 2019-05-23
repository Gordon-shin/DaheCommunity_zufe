package org.sc.servlet;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.sc.dao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
@MultipartConfig
@WebServlet(name = "ShopServlet",value = "/ShopServlet")
public class ShopServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
        String method =request.getParameter("method");
        if ("query".equals(method)) {
            String result = null;
            String key = request.getParameter("data");
            ShopDao shopDao = new ShopDao();
            result =  shopDao.ShopQuery(key);
           // System.out.println(result);
            CommonDao.out(response,result);
        }
        else if ("queryiteminfo".equals(method)) {
            String result = null;
            String key = request.getParameter("itemid");
          //  System.out.println(key);
            ShopDao shopDao = new ShopDao();
            result =  shopDao.getDetail(key);
            result= JSONDao.JSONArrayToObject(result);
            //System.out.println(result);
            CommonDao.out(response,result);
        }
        else if ("addgouwuche".equals(method)){
            String data = request.getParameter("data");
           // System.out.println(request.getParameter("data"));
            JSONObject jsonObject =  JSONObject.fromObject(data);
            ShopDao shopDao = new ShopDao();
            String result = shopDao.addGouWuChe(jsonObject);
            CommonDao.out(response,result);
        }
        else if ("panduangouwuche".equals(method)){
            String itemid = request.getParameter("itemid");
            String userid = request.getParameter("userid");
            ShopDao shopDao = new ShopDao();
            boolean result = shopDao.QueryExistGouwuche(itemid,userid);
            if (result==true)
            {
                CommonDao.out(response,"yes");
            }
            else{
                CommonDao.out(response,"no");
            }
        }
        else if ("querygwc".equals(method)){
            String userid = request.getParameter("data");
            ShopDao shopDao = new ShopDao();
            String result = shopDao.QueryGWC(userid);
            CommonDao.out(response,result);
        }
        else if ("iteminfo".equals(method)){
            JSONObject jsonObject;
            jsonObject = JSONObject.fromObject(request.getParameter("data"));
            ShopDao shopDao = new ShopDao();
            String result = shopDao.ItemInfoCreate(jsonObject);
            CommonDao.out(response,result);

        }
        else if ("deletewgc".equals(method)){
            JSONArray jsonArray;
           // System.out.println(request.getParameter("data"));
            jsonArray = JSONArray.fromObject(request.getParameter("data"));
            //System.out.println(jsonArray);
            String userid = request.getParameter("userid");
            ShopDao shopDao = new ShopDao();
            String result = shopDao.deletegwc(jsonArray,userid);
            CommonDao.out(response,result);

        }
        else if("tijiaoComment".equals(method)){ }
        else if ("querenfukuan".equals(method)){
            ShopDao shopDao = new ShopDao();
            JSONObject jsonObject ;
            jsonObject = JSONObject.fromObject(request.getParameter("data"));
           CommonDao.out(response, shopDao.querenfukuan(jsonObject));

        }
        else if ("queryalldingdan".equals(method)){
           JSONObject jsonObject = JSONObject.fromObject(request.getParameter("data"));
           ShopDao shopDao = new ShopDao();
           shopDao.queryalldingdan(jsonObject);
        }
        else if ("shopchaxundingdan".equals(method)){
            String result = null;
            JSONObject jsonObject =JSONObject.fromObject(request.getParameter("data")) ;
            ShopDao shopDao =new ShopDao();
            result =  shopDao.shopchaxundingdan(jsonObject);
            CommonDao.out(response,result);
        }
        else if ("gouwuchexiugaiBtn".equals(method)){
            String result;
            String itemid = request.getParameter("itemid");
            String number = request.getParameter("number");
            String userid = request.getParameter("userid");
            ShopDao shopDao =new ShopDao();
            result =  shopDao.gouwuchexiugaiBtn(itemid,number,userid);
            CommonDao.out(response,result);
        }
        else if ("UploadItemqueryBysellerid".equals(method)){
            String userid = request.getParameter("userid");
            String result;
            ShopDao shopDao =new ShopDao();
            result =  shopDao.UploadItemqueryBysellerid(userid);
            CommonDao.out(response,result);
        }
        else if ("modifyitemdata".equals(method)){
            JSONObject jsonObject =JSONObject.fromObject(request.getParameter("JSON")) ;
            Part part = request.getPart("File");
            String fileName =null;
            if (part!=null){
                fileName = part.getSubmittedFileName();
            }
            String newName = null;
            String result = null;
            if (part==null){
                newName = "noImage";
                ShopDao shopDao = new ShopDao();
                result =  shopDao.modifyitemdata(jsonObject,newName);
            }
            else{
                ImageDao imageDao = new ImageDao();
                newName= imageDao.WriteImage(part,fileName,request,"item");
                newName = "img/upload/item/"+newName;
                ShopDao shopDao = new ShopDao();
                result =  shopDao.modifyitemdata(jsonObject,newName);
            }
            CommonDao.out(response,result);
        }
        else if ("querenshouhuo".equals(method)){
            String userid= request.getParameter("userid");
            String itemid= request.getParameter("itemid");
            String result = null;
            ShopDao shopDao = new ShopDao();
            result = shopDao.querenshouhuo(userid,itemid);
            CommonDao.out(response,result);
        }
        else if ("sellerqueryfahuo".equals(method)){
            String sellerid = request.getParameter("userid");
            String result = null;
            ShopDao shopDao = new ShopDao();
            result = shopDao.sellerqueryfahuo(sellerid);
            CommonDao.out(response,result);
        }
        else if ("sellerfahuo".equals(method)){
            String fahuobianhao = request.getParameter("fahuobianhao");
            String result = null;
            ShopDao shopDao = new ShopDao();
            result = shopDao.sellerfahuo(fahuobianhao);
            CommonDao.out(response,result);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

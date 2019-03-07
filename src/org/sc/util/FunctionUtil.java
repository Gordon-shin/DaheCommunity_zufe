package org.sc.util;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class FunctionUtil {
        public  String getNow(){
                Date date = new Date();
                SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                System.out.println(dateFormat.format(date));
                String time =dateFormat.format(date);
                return time;
        }
        public String addTime(String day, int hour){
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = null;
                try {
                        date = format.parse(day);
                } catch (Exception ex) {
                        ex.printStackTrace();
                }
                if (date == null)
                        return "";
                System.out.println("front:" + format.format(date)); //显示输入的日期
                Calendar cal = Calendar.getInstance();
                cal.setTime(date);
                cal.add(Calendar.HOUR, hour);// 24小时制
                date = cal.getTime();
                System.out.println("after:" + format.format(date));  //显示更新后的日期
                cal = null;
                return format.format(date);

        }

}

package org.sc.dao;

public class DaoTest {
    public static void main(String[] args) {
        String result=null;
         HospDao hospDao = new HospDao();
         result = hospDao.hospcodeGenerator(null,"NK","3","2019-05-15");
         System.out.println(result);
    }
}

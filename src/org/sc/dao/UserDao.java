package org.sc.dao;

import org.sc.bean.User;
import org.sc.util.DBUtil;
import org.sc.util.EncryptTool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@SuppressWarnings("all")
public class UserDao {
    public User query(String LoginUserName) {
        Connection connection = DBUtil.getConnection();
        String sql = "SELECT * From tb_users WHERE LoginUserName=? and UserAuth='用户'";
        PreparedStatement pStatement = null;
        ResultSet rs ;
        User user = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1, LoginUserName);
            rs = pStatement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserid(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setPersonname(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setGender(rs.getString(2));
                user.setPhone(rs.getString(2));
                user.setAddress(rs.getString(2));
                user.setAvatar(rs.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pStatement, connection);
        }
        return user;
    }
    public User adminQuery(String LoginUserName) {
        Connection connection = DBUtil.getConnection();
        String sql = "SELECT * From tb_users WHERE LoginUserName=? and UserAuth='管理员'";
        PreparedStatement pStatement = null;
        ResultSet rs ;
        User user = null;
        try {
            pStatement = connection.prepareStatement(sql);
            pStatement.setString(1, LoginUserName);
            rs = pStatement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserid(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setPersonname(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setGender(rs.getString(2));
                user.setPhone(rs.getString(2));
                user.setAddress(rs.getString(2));
                user.setAvatar(rs.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pStatement, connection);
        }
        return user;
    }
    public void addCookie(String username, HttpServletRequest request, HttpServletResponse response){
        User user ;
        user = query(username);
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession(true);
        user.setPassword("");
        session.setAttribute("User", user);
        session.setAttribute("username", user.getUsername());
        session.setAttribute("userid", user.getUserid());
        Cookie cookieId = new Cookie("username", EncryptTool.encodeBase64(user.getUsername()));
        Cookie cookiePassword = new Cookie("password",EncryptTool.encodeBase64(user.getPassword()));
        Cookie cookieName = new Cookie("PersonName", EncryptTool.encodeBase64(user.getPersonname()));
        cookieId.setMaxAge(3600*24*365);
        cookiePassword.setMaxAge(3600*24*365);
        response.addCookie(cookieId);
        response.addCookie(cookieName);
        response.addCookie(cookiePassword);
    }
    public void addAdminCookie(String username, HttpServletRequest request, HttpServletResponse response){
        User user ;
        user = adminQuery(username);
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession(true);
        user.setPassword("");
        session.setAttribute("User", user);
        session.setAttribute("username", user.getUsername());
        session.setAttribute("userid", user.getUserid());
        Cookie cookieId = new Cookie("username", EncryptTool.encodeBase64(user.getUsername()));
        Cookie cookiePassword = new Cookie("password",EncryptTool.encodeBase64(user.getPassword()));
        Cookie cookieName = new Cookie("PersonName", EncryptTool.encodeBase64(user.getPersonname()));
        cookieId.setMaxAge(3600*24*365);
        cookiePassword.setMaxAge(3600*24*365);
        response.addCookie(cookieId);
        response.addCookie(cookieName);
        response.addCookie(cookiePassword);
    }
}

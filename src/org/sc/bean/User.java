package org.sc.bean;

public class User {
    private int userid;
    private String username;
    private String password;
    private String personname;
    private String email;
    private String gender;
    private String phone;
    private String address;
    private String avatar;
    public User(int userid, String username, String password, String personname, String email, String gender, String phone, String address, String avatar) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.personname = personname;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.avatar = avatar;
    }

    public User() {
        super();
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }



    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPersonname() {
        return personname;
    }

    public void setPersonname(String personname) {
        this.personname = personname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}

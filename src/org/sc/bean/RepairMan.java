package org.sc.bean;

public class RepairMan {
    private String id;
    private String staffname;
    private String loginname;
    private String duties;
    private String sparetime;
    private String nosparetime;
    private String email;
    private String phone;

    public RepairMan(String id, String staffname, String loginname, String duties, String sparetime, String nosparetime, String email, String phone, String company, String state) {
        this.id = id;
        this.staffname = staffname;
        this.loginname = loginname;
        this.duties = duties;
        this.sparetime = sparetime;
        this.nosparetime = nosparetime;
        this.email = email;
        this.phone = phone;
        this.company = company;
        this.state = state;
    }

    public RepairMan() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getDuties() {
        return duties;
    }

    public void setDuties(String duties) {
        this.duties = duties;
    }

    public String getSparetime() {
        return sparetime;
    }

    public void setSparetime(String sparetime) {
        this.sparetime = sparetime;
    }

    public String getNosparetime() {
        return nosparetime;
    }

    public void setNosparetime(String nosparetime) {
        this.nosparetime = nosparetime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    private String company;
    private String state;

}

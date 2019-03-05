package org.sc.bean;

public class RepairOrder {
     private  String duty;
     private  String datetime;

    public RepairOrder(String duty, String datetime) {
        this.duty = duty;
        this.datetime = datetime;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public RepairOrder() {
        super();
    }
}

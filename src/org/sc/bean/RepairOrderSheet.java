package org.sc.bean;

import java.sql.Timestamp;

public class RepairOrderSheet {
    private String userId;
    private String repairId;
    private String startTime;
    private String repairTime;
    private String finishTime;
    private String state;

    public RepairOrderSheet(String userId, String repairId, String startTime, String repairTime, String finishTime, String state) {
        this.userId = userId;
        this.repairId = repairId;
        this.startTime = startTime;
        this.repairTime = repairTime;
        this.finishTime = finishTime;
        this.state = state;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public RepairOrderSheet() {
        super();
    }

    public RepairOrderSheet(String userId, String repairId, String repairTime, String finishTime) {
        this.userId = userId;
        this.repairId = repairId;
        this.repairTime = repairTime;
        this.finishTime = finishTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRepairId() {
        return repairId;
    }

    public void setRepairId(String repairId) {
        this.repairId = repairId;
    }

    public String getRepairTime() {
        return repairTime;
    }

    public void setRepairTime(String repairTime) {
        this.repairTime = repairTime;
    }

    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }
}

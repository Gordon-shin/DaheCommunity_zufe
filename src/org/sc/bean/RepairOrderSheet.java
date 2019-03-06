package org.sc.bean;

import java.sql.Timestamp;

public class RepairOrderSheet {
    private String userId;
    private String repairId;
    private String repairTime;
    private String finishTime;

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

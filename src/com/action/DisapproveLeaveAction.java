package com.action;

import com.database.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionSupport;

public class DisapproveLeaveAction extends ActionSupport implements LoginRequired {
    private String leaveId;
    private String status;
    
    public String execute() {
        try {
            Leave leave = EmployeeManager.getLeave(leaveId);
            EmployeeManager.disapproveLeave(leave);
            status = "{\"status\": \"OK\"}";
        } catch (Exception ex) {
            status = "{\"status\": \"ERROR\"}";
            ex.printStackTrace();
        }
        
        return SUCCESS;
    }
    
    public String getLeaveId() {
        return leaveId;
    }
    public void setLeaveId(String leaveId) {
        this.leaveId = leaveId;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}

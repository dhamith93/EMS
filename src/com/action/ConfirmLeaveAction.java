package com.action;

import com.database.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionSupport;

public class ConfirmLeaveAction extends ActionSupport {
    private String leaveId;
    private String status;
    
    public String execute() {
        System.out.println(leaveId);
        try {
            Leave leave = EmployeeManager.getLeave(leaveId);
            if (leave.getIsApproved() == 1) {
                EmployeeManager.confirmLeave(leave);
                status = "{\"status\": \"OK\"}";
            } else {
                status = "{\"status\": \"NOT_APPROVED\"}";
            }            
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            status = "{\"status\": \"ERROR\"}";
        }
        
        return SUCCESS;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLeaveId() {
        return leaveId;
    }

    public void setLeaveId(String leaveId) {
        this.leaveId = leaveId;
    }
}

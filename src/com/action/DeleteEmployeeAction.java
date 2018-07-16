package com.action;

import com.database.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployeeAction extends ActionSupport implements LoginRequired {
    private String empId;
    private String status;
    
    public String execute() {
        try {
            Employee e = EmployeeManager.get(empId);
            EmployeeManager.delete(e);
            status = "{\"status\": \"OK\"}";
        } catch (Exception ex) {
            status = "{\"status\": \"ERROR\"}";
        }
        return SUCCESS;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

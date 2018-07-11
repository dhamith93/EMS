package com.action;

import com.database.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionSupport;

public class AddDepartmentAction extends ActionSupport implements LoginRequired {
    private String name;
    private String manager;
    private String status;
    
    public String execute() {
        try {
            Department d = new Department();
            d.setName(name);
            d.setManagerId(manager);
            DepartmentManager.save(d);
            status = "{\"status\": \"OK\"}";
        } catch(Exception ex) {
            ex.printStackTrace();
            status = "{\"status\": \"ERROR\"}";
        }
        
        return SUCCESS;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}

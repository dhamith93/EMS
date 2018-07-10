package com.action;

import java.util.List;
import com.database.*;
import com.entity.*;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class GetLeavesAction extends ActionSupport implements LoginRequired {
    private String empId;
    private List<Leave> leaves;
    private String jsonString;
    
    public String execute() {
        Employee emp = EmployeeManager.get(empId);
        leaves = EmployeeManager.getLeaves(emp);      
        Gson gson = new Gson();
        jsonString = gson.toJson(leaves);
        
        return SUCCESS;
    }
    
    public String getEmpId() {
        return empId;
    }
    
    public void setEmpId(String empId) {
        this.empId = empId;
    }
    
    
    public List<Leave> getLeaves() {
        return leaves;
    }
    
    public void setLeaves(List<Leave> leaves) {
        this.leaves = leaves;
    }

    
    public String getJsonString() {
        return jsonString;
    }

    public void setJsonString(String jsonString) {
        this.jsonString = jsonString;
    }
    
}

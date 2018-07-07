package com.action;

import java.util.List;
import com.database.*;
import com.entity.*;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class GetEmployeeTasksAction extends ActionSupport {
    private String empId;
    private String jsonString;
    
    public String execute() {
        Employee emp = EmployeeManager.get(empId);
        List<Task> tasks = TaskManager.getTasksForHR(emp);
        Gson gson = new Gson();
        jsonString = gson.toJson(tasks);
        
        return SUCCESS;
    }
    
    public String getEmpId() {
        return empId;
    }
    public void setEmpId(String empId) {
        this.empId = empId;
    }
   

    public String getJsonString() {
        return jsonString;
    }
    public void setJsonString(String jsonString) {
        this.jsonString = jsonString;
    }

}

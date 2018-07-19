package com.action;

import java.util.*;
import org.apache.struts2.interceptor.SessionAware;
import com.database.*;
import com.entity.*;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class GetDepartmentPerformanceAction extends ActionSupport implements SessionAware {
    private String deptId;
    private String json;
    
    public String execute() {
        
        try {
            List<Employee> employeeDept = EmployeeManager.getEmployeeDept(Long.parseLong(deptId));
            Map<String, Double> employeePerformance = new HashMap<String, Double>();
            for (Employee e : employeeDept) {
                employeePerformance.put(e.getEmpId(), TaskManager.getEmployeeAvgPerformance(e));
            }
            Gson gson = new Gson();
            json = gson.toJson(employeePerformance);
        } catch(Exception ex) {
            ex.printStackTrace();
            json = "{\"status\": \"ERROR\"}";
        }
        
        return SUCCESS;
    }
    
    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    @Override
    public void setSession(Map<String, Object> arg0) {
        // TODO Auto-generated method stub
        
    }

}

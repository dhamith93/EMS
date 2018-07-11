package com.action;

import java.util.List;
import com.database.*;
import com.entity.*;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class GetAttendanceAction extends ActionSupport implements LoginRequired {
    private String empId;
    private String from;
    private String to;
    private String jsonString;
    
    public String execute() {
        Employee employee = EmployeeManager.get(empId);
        List<Attendance> attendanceList = EmployeeManager.getAttendanceOf(employee, from, to);
        Gson gson = new Gson();
        jsonString = gson.toJson(attendanceList);
        return SUCCESS;
    }
    
    public String getEmpId() {
        return empId;
    }
    public void setEmpId(String empId) {
        this.empId = empId;
    }
    public String getFrom() {
        return from;
    }
    public void setFrom(String from) {
        this.from = from;
    }
    public String getTo() {
        return to;
    }
    public void setTo(String to) {
        this.to = to;
    }
    public String getJsonString() {
        return jsonString;
    }
    public void setJsonString(String jsonString) {
        this.jsonString = jsonString;
    }
}

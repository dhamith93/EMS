package com.action;

import com.database.*;
import com.entity.*;
import java.util.*;
import java.time.*;
import java.time.format.*;
import java.text.SimpleDateFormat;  
import com.opensymphony.xwork2.ActionSupport;

public class ClockInAction extends ActionSupport implements LoginRequired {
    private String empId;
    private String status;
    
    public String execute() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm");
        Calendar calendar = Calendar.getInstance();
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        String time = dateFormat.format(calendar.getTime());
        String date = today.format(formatter);
                
        Attendance attendance = new Attendance();
        attendance.setEmpId(empId);
        attendance.setClockIn(time);
        attendance.setDateIn(date);
        
        try {
            EmployeeManager.clockIn(attendance);
            status = "{\"status\": \"OK\"}";
        } catch (Exception ex) {
            status = "{\"status\": \"ERROR\"}";
            ex.printStackTrace();
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

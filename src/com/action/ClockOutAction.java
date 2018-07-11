package com.action;

import com.database.*;
import com.entity.*;
import java.util.*;
import java.time.*;
import java.time.format.*;
import java.text.SimpleDateFormat;  
import com.opensymphony.xwork2.ActionSupport;

public class ClockOutAction  extends ActionSupport implements LoginRequired {
    private String empId;
    private String status;
    
    public String execute() {        
        SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm");
        Calendar calendar = Calendar.getInstance();
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        
        String date = dateFormat.format(calendar.getTime());
        String time = today.format(formatter);
        
        try {
            String dateOutArr[] = date.split("/");
            String timeOut = time.replace(':', '.');
            
            Attendance attendance = EmployeeManager.getLastAttendance(empId);        
            
            String dateInArr[] = attendance.getDateIn().split("/");
            String timeIn = attendance.getClockIn().replace(':', '.');

            int dOut = Integer.parseInt(dateOutArr[1]);
            double hOut = Double.parseDouble(timeOut);        
            
            int dIn = Integer.parseInt(dateInArr[1]);
            double hIn = Double.parseDouble(timeIn);
            
            int days = (dOut - dIn);
            
            double hours;
           
            if (hIn > hOut && days == 1) {
                hours = hIn - hOut;
            } else if (hIn > hOut && days > 1) {
                hours = (hIn - hOut) + ((days - 1) * 24 );
            } else {
                hours = hOut - hIn;
            }
            
            double ot = (hours > 8) ? hours - 8 : 0;
            
            attendance.setClockOut(time);
            attendance.setDateOut(date);
            attendance.setHours(hours);
            attendance.setOt(ot);
            attendance.setIsClockedOut(1);
            
            try {
                EmployeeManager.clockOut(attendance);
                status = "{\"status\": \"OK\"}";
            } catch (Exception ex) {
                status = "{\"status\": \"ERROR\"}";
                ex.printStackTrace();
            }
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

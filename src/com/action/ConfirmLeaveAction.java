package com.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.database.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionSupport;

public class ConfirmLeaveAction extends ActionSupport implements LoginRequired {
    private String leaveId;
    private String status;
    
    public String execute() {
        try {
            Leave leave = EmployeeManager.getLeave(leaveId);
            if (leave.getIsApproved() == 1) {
                EmployeeManager.confirmLeave(leave);
                Employee emp = EmployeeManager.get(leave.getEmpId());
                LeavesLeft leavesLeft = EmployeeManager.getLeavesLeft(emp);
                
                double daysReq = 1.00;
                Date from;
                Date to;
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Calendar startCal;
                Calendar endCal;

                try {
                    if (!leave.getType().equals("short")) {
                        from = format.parse(leave.getDateFrom());
                        to = format.parse(leave.getDateTo());
                        startCal = Calendar.getInstance();
                        startCal.setTime(from);
                        endCal = Calendar.getInstance();
                        endCal.setTime(to);

                        do {
                            startCal.add(Calendar.DAY_OF_MONTH, 1);
                            if (startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY
                                    && startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                                ++daysReq;
                            }
                        } while (startCal.getTimeInMillis() < endCal.getTimeInMillis());
                    }

                } catch (ParseException e) {
                    System.out.println("parsing error...");
                    System.out.println(e.getMessage());
                    status = "{\"status\": \"CANT_PARSE_DATE\"}";
                    return SUCCESS;
                }
                
                EmployeeManager.reduceLeaves(emp, leave, leavesLeft, daysReq);
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

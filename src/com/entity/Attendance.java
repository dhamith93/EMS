package com.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "ATTENDANCE")
public class Attendance implements Serializable {
    private Long id;
    private String empId;
    private String dateIn;
    private String clockIn;
    private String dateOut;
    private String clockOut;
    private double hours;
    private double ot;
    private int isClockedOut;    

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "EMP_ID", nullable = true, length = 10)
    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    @Basic
    @Column(name = "DATE_IN", nullable = true)
    public String getDateIn() {
        return dateIn;
    }

    public void setDateIn(String dateIn) {
        this.dateIn = dateIn;
    }

    @Basic
    @Column(name = "CLOCK_IN", nullable = true)
    public String getClockIn() {
        return clockIn;
    }

    public void setClockIn(String clockIn) {
        this.clockIn = clockIn;
    }

    @Basic
    @Column(name = "DATE_OUT", nullable = true)
    public String getDateOut() {
        return dateOut;
    }

    public void setDateOut(String dateOut) {
        this.dateOut = dateOut;
    }

    @Basic
    @Column(name = "CLOCK_OUT", nullable = true)
    public String getClockOut() {
        return clockOut;
    }

    public void setClockOut(String clockOut) {
        this.clockOut = clockOut;
    }

    @Basic
    @Column(name = "HOURS", nullable = true)
    public double getHours() {
        return hours;
    }

    public void setHours(double hours) {
        this.hours = hours;
    }

    @Basic
    @Column(name = "OT", nullable = true)
    public double getOt() {
        return ot;
    }

    public void setOt(double ot) {
        this.ot = ot;
    }

    @Basic
    @Column(name = "IS_CLOCKED_OUT", nullable = true)
    public int getIsClockedOut() {
        return isClockedOut;
    }

    public void setIsClockedOut(int isClockedOut) {
        this.isClockedOut = isClockedOut;
    }
    
    
}

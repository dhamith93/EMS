package com.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "LEAVES")
public class Leave implements Serializable {
    private Long id;
    private String empId;
    private String reason;
    private String type;
    private String dateFrom;
    private String dateTo;
    private String timeFrom;
    private String timeTo;
    private Long managedBy;
    private int isApproved;
    private int isConfirmed;

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
    @Column(name = "REASON", nullable = true, length = 100)
    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Basic
    @Column(name = "TYPE", nullable = true, length = 25)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "START_ON_DATE", nullable = true)
    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    @Basic
    @Column(name = "END_ON_DATE", nullable = true)
    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }

    @Basic
    @Column(name = "START_ON_TIME", nullable = true, length = 8)
    public String getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(String timeFrom) {
        this.timeFrom = timeFrom;
    }

    @Basic
    @Column(name = "END_ON_TIME", nullable = true, length = 8)
    public String getTimeTo() {
        return timeTo;
    }

    public void setTimeTo(String timeTo) {
        this.timeTo = timeTo;
    }

    @Basic
    @Column(name = "IS_APPROVED", nullable = true)
    public int getIsApproved() {
        return isApproved;
    }

    public void setIsApproved(int isApproved) {
        this.isApproved = isApproved;
    }

    @Basic
    @Column(name = "IS_CONFIRMED", nullable = true)
    public int getIsConfirmed() {
        return isConfirmed;
    }

    public void setIsConfirmed(int isConfirmed) {
        this.isConfirmed = isConfirmed;
    }

    @Basic
    @Column(name = "MANAGER", nullable = true)
    public Long getManagedBy() {
        return managedBy;
    }

    public void setManagedBy(Long managedBy) {
        this.managedBy = managedBy;
    }

}

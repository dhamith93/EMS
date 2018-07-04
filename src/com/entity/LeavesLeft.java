package com.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "LEAVES_LEFT")
public class LeavesLeft implements Serializable {
    private Long id;
    private String empId;
    private double annual;
    private double casual;
    private double shortL;

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
    @Column(name = "ANNUAL", nullable = true)
    public double getAnnual() {
        return annual;
    }

    public void setAnnual(double annual) {
        this.annual = annual;
    }

    @Basic
    @Column(name = "CASUAL", nullable = true)
    public double getCasual() {
        return casual;
    }

    public void setCasual(double casual) {
        this.casual = casual;
    }

    @Basic
    @Column(name = "SHORT", nullable = true)
    public double getShortL() {
        return shortL;
    }

    public void setShortL(double shortL) {
        this.shortL = shortL;
    }

}

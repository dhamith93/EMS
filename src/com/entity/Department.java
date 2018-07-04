package com.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "DEPARTMENT")
public class Department implements Serializable {
    private Long id;
    private String name;
    private String managerId;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME", nullable = true, length = 15)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "MANAGER_ID", nullable = true, length = 10)
    public String getManagerId() {
        return managerId;
    }

    public void setManagerId(String managerId) {
        this.managerId = managerId;
    }

}

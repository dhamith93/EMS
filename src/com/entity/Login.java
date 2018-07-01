package com.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="LOGIN")
public class Login implements Serializable {
	private Long id;
	private String empId;
	private String password;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() { return id; }
	
	public void setId(Long id) { this.id = id; }
	
	@Basic
    @Column(name = "EMP_ID", nullable = true, length = 10)
	public String getEmpId() { return empId; }
	
	public void setEmpId(String empId) { this.empId = empId; }
	
	@Basic
    @Column(name = "PASSWORD", nullable = true)
	public String getPassword() { return password; }
	
	public void setPassword(String password) { this.password = password; }
	
	
}

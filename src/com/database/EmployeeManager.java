package com.database;

import java.util.List;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import com.entity.*;

public class EmployeeManager extends Manager {
    public static void save(Employee e) {
        init();
        session.save(e);

        LeavesLeft l = new LeavesLeft();
        l.setEmpId(e.getEmpId());
        l.setAnnual(10.00);
        l.setCasual(7.00);
        l.setShortL(2);

        session.save(l);
        transaction.commit();
        session.close();
    }
    
    public static void update(Employee e) {
        init();
        Employee employee = (Employee) session.merge(e);
        session.saveOrUpdate(employee);
        transaction.commit();
        session.close();
    }
    
    public static void delete(Employee e) {
        init();
        String hql = "DELETE FROM Leave l WHERE l.empId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", e.getEmpId());
        query.executeUpdate();
        hql = "DELETE FROM LeavesLeft l WHERE l.empId = :id";
        query = session.createQuery(hql);
        query.setParameter("id", e.getEmpId());
        query.executeUpdate();
        hql = "DELETE FROM TaskAssessment l WHERE l.empId = :id";
        query = session.createQuery(hql);
        query.setParameter("id", e.getEmpId());
        query.executeUpdate();
        hql = "DELETE FROM TaskAssignment l WHERE l.empId = :id";
        query = session.createQuery(hql);
        query.setParameter("id", e.getEmpId());
        query.executeUpdate();
        hql = "DELETE FROM Login l WHERE l.empId = :id";
        query = session.createQuery(hql);
        query.setParameter("id", e.getEmpId());
        query.executeUpdate();
        session.delete(e);
        transaction.commit();
        session.close();
    }

    public static void addLoginInfo(Employee e, String password) {
        end();
        init();
        Login login = new Login();
        login.setEmpId(e.getEmpId());
        login.setPassword(password);
        session.save(login);
        transaction.commit();
        session.close();
    }
    
    public static void updateLoginInfo(Login login) {
        init();
        Login merged = (Login) session.merge(login);
        session.saveOrUpdate(merged);
        transaction.commit();
        session.close();
    }

    public static Login getLoginInfo(Employee e) {
        init();
        String hql = "FROM Login l WHERE l.empId LIKE :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", e.getEmpId());
        Login login = (Login) query.getResultList().get(0);
        session.close();
        return login;
    }

    public static Employee get(String empId) {
        init();
        String hql = "FROM Employee e WHERE e.empId = :val";
        Query query = session.createQuery(hql);
        query.setParameter("val", empId);

        Employee employee = (Employee) query.getSingleResult();

        hql = "FROM Department d WHERE d.id = :id";
        query = session.createQuery(hql);
        query.setParameter("id", employee.getDept());
        Department department = (Department) query.getResultList().get(0);
        employee.setDeptName(department.getName());
        
        session.close();
        return employee;
    }

    public static List<Employee> search(String value, String option) {
        init();
        String hql = "";

        switch (option) {
        case "id":
            hql = "FROM Employee e WHERE e.empId LIKE :val";
            break;
        case "name":
            hql = "FROM Employee e WHERE e.firstName LIKE concat(:val,'%') OR e.lastName LIKE concat(:val,'%') OR concat(e.firstName, ' ', e.lastName) LIKE concat(:val,'%')";
            break;
        case "dept":
            hql = "FROM Employee e WHERE e.dept = (SELECT id FROM Department WHERE name = :val)";
            break;
        default:
            hql = "FROM Employee e WHERE e.firstName LIKE :val OR e.lastName LIKE :val";
            break;
        }

        Query query = session.createQuery(hql);
        query.setParameter("val", value);

        List<Employee> results = query.getResultList();

        for (Employee e : results) {
            hql = "FROM Department d WHERE d.id = :id";
            query = session.createQuery(hql);
            query.setParameter("id", e.getDept());
            Department department = (Department) query.getResultList().get(0);
            e.setDeptName(department.getName());
        }
        
        session.close();
        return results;
    }

    public static void requestLeave(Leave leave) {
        init();
        session.save(leave);
        transaction.commit();
        session.close();
    }
    
    public static List<Leave> getLeaves(Employee emp) {
        init();
        String hql = "FROM Leave l WHERE l.empId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", emp.getEmpId());

        List<Leave> leaves = query.getResultList();
        
        session.close();
        return leaves;
    }

    public static Leave getLeave(String leaveId) {
        init();
        String hql = "FROM Leave l WHERE l.id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", Long.parseLong(leaveId));
        Leave leave = (Leave) query.getSingleResult();
        
        session.close();
        return leave;
    }

    public static LeavesLeft getLeavesLeft(Employee emp) {
        init();
        String hql = "FROM LeavesLeft l WHERE l.empId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", emp.getEmpId());
        try {
            LeavesLeft leavesLeft = (LeavesLeft) query.getSingleResult();
            session.close();
            return leavesLeft;
        } catch (Exception ex) {
            // empty result
        }
        
        session.close();
        return null;
    }
    
    public static Long getApprovedLeaveCount(Employee emp) {
        init();
        String hql = "SELECT COUNT(*) FROM Leave l WHERE l.empId = :id AND l.isApproved = 1 AND l.isConfirmed = 0";
        Query query = session.createQuery(hql);
        query.setParameter("id", emp.getEmpId());
        Long count = (Long) query.uniqueResult();      
        
        session.close();
        return count;
    }

    public static void reduceLeaves(Employee emp, Leave leave, LeavesLeft leavesLeft, double daysReq) {
        init();
        String hql = "";
        double days = 0.00;
        switch (leave.getType()) {
        case "annual":
            days = leavesLeft.getAnnual() - daysReq;
            hql = "UPDATE LeavesLeft l SET l.annual = :days WHERE l.empId = :id";
            break;
        case "casual":
            days = leavesLeft.getCasual() - daysReq;
            hql = "UPDATE LeavesLeft l SET l.casual = :days WHERE l.empId = :id";
            break;
        case "short":
            days = leavesLeft.getShortL() - daysReq;
            hql = "UPDATE LeavesLeft l SET l.shortL = :days WHERE l.empId = :id";
            break;
        }
        Query query = session.createQuery(hql);
        query.setParameter("id", emp.getEmpId());
        query.setParameter("days", days);
        query.executeUpdate();
        transaction.commit();
        session.close();
    }

    public static void confirmLeave(Leave leave) {
        init();
        String hql = "UPDATE Leave l SET l.isConfirmed = 1 WHERE l.id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", leave.getId());
        query.executeUpdate();
        transaction.commit();
        session.close();
    }

    public static void clockIn(Attendance attendance) {
        init();
        session.save(attendance);
        transaction.commit();
        session.close();
        
    }
    
    public static void clockOut(Attendance attendance) {
        init();
        attendance = (Attendance) session.merge(attendance);
        session.saveOrUpdate(attendance);
        transaction.commit();
        session.close();        
    }

    public static Attendance getLastClockedInAttendance(String empId) {
        init();
        String hql = "FROM Attendance a WHERE a.empId = :id AND a.isClockedOut = 0";
        Query query = session.createQuery(hql);
        query.setParameter("id", empId);
        Attendance a = (Attendance) query.getSingleResult();
        session.close();
        return a;
    }
    
    public static Attendance getLastAttendance(String empId) {
        init();
        String hql = "FROM Attendance a WHERE a.empId = :id ORDER BY isClockedOut ASC";
        Query query = session.createQuery(hql);
        query.setParameter("id", empId);        
        List<Attendance> attendanceList = query.getResultList();
        if (attendanceList.size() == 0) {
            return null;
        }        
        session.close();
        return attendanceList.get(0);
    }
    
    public static List<Attendance> getAttendanceOf(Employee employee, String from, String to) {
        init();
        String hql = "FROM Attendance a WHERE a.empId = :id And (a.dateIn BETWEEN :from AND :to)";
        Query query = session.createQuery(hql);
        query.setParameter("id", employee.getEmpId());
        query.setParameter("from", from);
        query.setParameter("to", to);
        List<Attendance> attendanceList = query.getResultList();
        session.close();
        return attendanceList;
    }

	public static List<Employee> getEmployeeDept(Long deptID) {
		init();
		String hql = "FROM Employee e WHERE e.dept = :deptId";
		Query query = session.createQuery(hql);
		query.setParameter("deptId", deptID);
		List<Employee> employeeDept = query.getResultList();
		session.close();
		return employeeDept;
	}

}

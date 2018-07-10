package com.database;

import java.util.List;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import com.entity.*;

public class DepartmentManager extends Manager {
    
    public static void save(Department d) {
        init();
        session.save(d);
        transaction.commit();
    }
    
    public static void update(Department d, String manager) {
        init();
        d = get(d.getName());
        Department department = (Department) session.merge(d);
        department.setManagerId(manager);
        session.saveOrUpdate(department);
        transaction.commit();
    }
    
    public static List<Department> getAll() {
        init();
        String hql = "FROM Department";
        Query query = session.createQuery(hql);
        List<Department> departments = query.getResultList();
        return departments;
    }
    
    public static Department get(String name) {
        init();
        String hql = "FROM Department d WHERE d.name = :val";
        Query query = session.createQuery(hql); 
        query.setParameter("val", name);
        return (Department) query.getSingleResult();
    }

    public static Long getManager(Long deptId) {
        init();
        String hql = "FROM Department d WHERE d.id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", deptId);
        Department d = (Department) query.getResultList().get(0);
        hql = "FROM Employee e WHERE e.empId = :id";
        query = session.createQuery(hql);
        query.setParameter("id", d.getManagerId());
        Employee e = (Employee) query.getResultList().get(0);
        return e.getId();
    }

}

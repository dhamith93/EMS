package com.database;

import java.util.List;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import com.entity.*;

public class DepartmentManager {
    private static Configuration config;
    private static SessionFactory sessionFactroy;
    private static Session session;
    private static Transaction transaction;

    private static void init() {
        config = new Configuration().configure();
        sessionFactroy = config.buildSessionFactory();
        session = sessionFactroy.getCurrentSession();
        transaction = session.beginTransaction();
    }

    private static void end() {
        session.close();
        sessionFactroy.close();
    }

    public static List<Department> getAll() {
        init();
        String hql = "FROM Department";
        Query query = session.createQuery(hql);
        List<Department> departments = query.getResultList();
        return departments;
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

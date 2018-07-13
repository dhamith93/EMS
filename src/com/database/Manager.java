package com.database;

import org.hibernate.*;

public class Manager {
    protected static SessionFactory sessionFactory;
    protected static Session session;
    protected static Transaction transaction;
    
    protected static void init() {
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.getCurrentSession();
        transaction = session.beginTransaction();
    }

    protected static void end() {
        if (session != null) {
            session.close();            
        }
    }
    
    public static void stop() { end(); }
}

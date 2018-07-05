package com.database;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class Manager {
    protected static Configuration config;
    protected static SessionFactory sessionFactroy;
    protected static Session session;
    protected static Transaction transaction;
    
    protected static void init() {
        config = new Configuration().configure();
        sessionFactroy = config.buildSessionFactory();
        session = sessionFactroy.getCurrentSession();
        transaction = session.beginTransaction();
    }

    protected static void end() {
        session.close();
        sessionFactroy.close();
    }
}

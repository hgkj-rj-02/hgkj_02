package com.hgkj.model.dao.impl;

import com.hgkj.model.dao.LinetypeDao;
import com.hgkj.model.entity.Linetype;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class LinetypeDaoImpl implements LinetypeDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Linetype> allLinetypeDao() {
        Query query=getSession().createQuery("from Linetype ");
        return query.list();
    }

    @Override
    public boolean insertLinetypeDao(Linetype linetype) {
        getSession().save(linetype);
        return true;
    }

    @Override
    public boolean deleteLinetypeDao(String lineTypeId) {
        Linetype linetype=getSession().get(Linetype.class,lineTypeId);
        getSession().delete(linetype);
        return true;
    }

    @Override
    public boolean updateLinetypeDao(Linetype linetype) {
        getSession().update(linetype);
        return true;
    }

    @Override
    public Linetype getByIdLinetypeDao(String lineTypeId) {
        Linetype linetype=getSession().get(Linetype.class,lineTypeId);
        return linetype;
    }
}

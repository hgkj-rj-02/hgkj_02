package com.fsw.model.dao.imp;

import com.fsw.model.dao.LineTypeDao;
import com.fsw.model.entity.Customer;
import com.fsw.model.entity.Linetype;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Repository
@Transactional
public class LineTypeDaoImpl implements LineTypeDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){

        return sessionFactory.getCurrentSession();
    }

    @Override
    public boolean insertLinetypeDao(Linetype linetype) {

        getSession().save(linetype);
        return true;
    }

    @Override
    public List<Linetype> allLinetypeDao() {
        List<Linetype> linetypeList=getSession().createQuery("from Linetype").list();
        return linetypeList;
    }

    @Override
    public boolean deleteLinetypeDao(String lineTypeID) {
        Linetype linetype=getSession().get(Linetype.class,lineTypeID);
        getSession().delete(linetype);
        return true;
    }

    @Override
    public Linetype getLinetypeByIdDao(String lineTypeID) {
        Linetype linetype=getSession().get(Linetype.class,lineTypeID);
        return linetype;
    }

    @Override
    public boolean updateLinetypeDao(Linetype linetype) {
        getSession().update(linetype);
        return true;
    }
}

package com.hgkj.model.dao.impl;

import com.hgkj.model.dao.LineDao;
import com.hgkj.model.entity.Line;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class LineDaoImpl implements LineDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Line> allLineDao() {
        Query query=getSession().createQuery("from Line ");
        return query.list();
    }

    @Override
    public boolean insertLineDao(Line line) {
        getSession().save(line);
        return true;
    }

    @Override
    public boolean deleteLineDao(String lineId) {
        Line line=getSession().get(Line.class,lineId);
        getSession().delete(line);
        return true;
    }

    @Override
    public boolean updateLineDao(Line line) {
        getSession().update(line);
        return true;
    }

    @Override
    public Line getByIdLineDao(String lineId) {
        Line line=getSession().get(Line.class,lineId);
        return line;
    }
}

package com.fsw.model.dao.imp;

import com.fsw.model.dao.LineDao;
import com.fsw.model.entity.Line;
import com.fsw.model.entity.Linetype;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
    public boolean insertLineDao(Line line) {
        getSession().save(line);
        return true;
    }

    @Override
    public List<Line> allLineDao() {
        List<Line> lineList=getSession().createQuery("from Line").list();
        return lineList;
    }

    @Override
    public boolean deleteLineDao(String lineId) {

        Line line=getSession().get(Line.class,lineId);
        getSession().delete(line);
        return true;
    }

    @Override
    public Line getLineByIdDao(String lineId) {
        Line line=getSession().get(Line.class,lineId);
        return line;
}

    @Override
    public boolean updateLineDao(Line line) {
        getSession().update(line);
        return true;
    }
}

package com.hgkj.model.dao.impl;

import com.hgkj.model.dao.LinetypeDao;
import com.hgkj.model.entity.LineType;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:11
 **/
@Repository
@Transactional
public class LineTypeDaoImpl implements LinetypeDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 查询所有路线类别
     *
     * @return
     */
    @Override
    public List<LineType> allLineTypeDao() {
        Query query = getSession().createQuery("from LineType");
        return query.list();
    }

    /**
     * 添加路线类别
     *
     * @param lineType
     */
    @Override
    public void insertLineTypeDao(LineType lineType) {
        getSession().save(lineType);
    }

    /**
     * 删除路线类别
     *
     * @param lineTypeId
     */
    @Override
    public void deleteLineTypeDao(String lineTypeId) {
        LineType lineType = getSession().get(LineType.class, lineTypeId);
        getSession().delete(lineType);
    }

    /**
     * 查询一条路线类别
     *
     * @param lineTypeId
     * @return
     */
    @Override
    public LineType findLineTypeDao(String lineTypeId) {
        LineType lineType = getSession().get(LineType.class, lineTypeId);
        return lineType;
    }

    /**
     * 修改路线类别
     *
     * @param lineType
     */
    @Override
    public void updateLINETypeDao(LineType lineType) {
        getSession().update(lineType);
    }
}

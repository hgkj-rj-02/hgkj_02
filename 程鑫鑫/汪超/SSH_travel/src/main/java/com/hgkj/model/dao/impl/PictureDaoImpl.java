package com.hgkj.model.dao.impl;

import com.hgkj.model.dao.PictureDao;
import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Picture;
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
public class PictureDaoImpl implements PictureDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 通过路线编号查找图片
     *
     * @param LineId
     * @return
     */

    @Override
    public List<Picture> pictureByLineIdDao(int LineId) {
        String hql = "from Picture where Picture.line.LineId =:id";
        Query query = getSession().createQuery(hql).setParameter("id",LineId);
        List<Picture> pictureList = query.list();
        return pictureList;
    }

    /**
     * 通过图片编号查找路线
     *
     * @param pictureId
     * @return
     */

    @Override
    public Line lineByPicetureDao(int pictureId) {
        Line line = getSession().get(Line.class, pictureId);
        return line;
    }
}

package com.hgkj.model.dao.impl;

import com.hgkj.model.dao.LineDao;
import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.LineType;
import com.hgkj.model.entity.Picture;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:11
 **/
@Repository("lineDao")
@Transactional
public class LineDaoImpl implements LineDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 分页查询所有路线
     *
     * @return
     */
    @Override
    public List<Line> allLineDao(int pageSize, int pageIndex) {
        String hql = "from Line";
        Query query = getSession().createQuery(hql);
        query.setFirstResult((pageIndex - 1) * pageSize);
        query.setMaxResults(pageSize);
        List<Line> lineList = query.list();
        return lineList;
    }

    /**
     * 路线总页数
     *
     * @return
     */
    @Override
    public int lineTotalPageDao(int pageSize) {
        Query query = getSession().createQuery("from Line");
        ScrollableResults scrollableResults = query.scroll();
        scrollableResults.last();
        int totalPage = ((scrollableResults.getRowNumber() + 1) - 1) / pageSize + 1;
        return totalPage;
    }

    /**
     * 添加路线
     *
     * @param line
     */
    @Override
    public void insertLineDao(Line line) {
//        try {
        line.setLineType(getSession().get(LineType.class, line.getLineType().getLineTypeId()));
//        getSession().merge(line);
        getSession().save(line);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

    /**
     * 查询指定路线
     *
     * @param lineId
     * @return
     */
    @Override
    public Line findLineDao(String lineId) {
        Line line = getSession().get(Line.class, lineId);
        return line;
    }

    /**
     * 修改路线
     *
     * @param line
     */
    @Override
    public void updateLineDao(Line line) {
        try {
            line.setLineType(getSession().get(LineType.class, line.getLineType().getLineTypeId()));
//            在hibernate中同一个session里面有了两个相同标识但是是不同实体
            getSession().merge(line);
            getSession().update(line);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改团购
     *
     * @param line
     */
    @Override
    public void updateTeamDao(Line line) {
        try {
            line.setLineType(getSession().get(LineType.class, line.getLineType().getLineTypeId()));
            getSession().update(line);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 团购分页查询
     *
     * @param pageSize
     * @param pageIndex
     * @return
     */
    @Override
    public List<Line> allTeamLineDao(int pageSize, int pageIndex) {
        String hql = "from Line where lineTeamBuy = 0";
        Query query = getSession().createQuery(hql);
        query.setFirstResult((pageIndex - 1) * pageSize);
        query.setMaxResults(pageSize);
        List<Line> lineList = query.list();
        return lineList;
    }

    /**
     * 查询团购总页数
     *
     * @param pageSize
     * @return
     */
    @Override
    public int teamLineTotalPageDao(int pageSize) {
        Query query = getSession().createQuery("from Line where lineTeamBuy = 0");
        ScrollableResults scrollableResults = query.scroll();
        scrollableResults.last();
        int teamTotalPage = ((scrollableResults.getRowNumber() + 1) - 1) / pageSize + 1;
        return teamTotalPage;
    }

    /**
     * 通过路线类别查询路线
     *
     * @param lineTypeId
     * @return
     */
    @Override
    public List<Line> getLineByLineTypeDao(String lineTypeId) {
        String hql = "from Line as l where l.lineType.lineTypeId =:lt";
        Query query = getSession().createQuery(hql).setParameter("lt",lineTypeId);
        List<Line> lineList = query.list();
        return lineList;
    }

    /**
     * 删除路线
     *
     * @param lineId
     */
    @Override
    public void deleteLineDao(String lineId) {
        Line line = getSession().get(Line.class, lineId);

        getSession().delete(line);
    }

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        LineDao lineDao = (LineDao) context.getBean("lineDao");
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        Timestamp time = Timestamp.valueOf(dateFormat.format(new Date()));
        Line line = new Line("110", "jiri", "1tian", "1tian", "1tian", "1tian", "1tian", "100", time);
        LineType lineType = new LineType();
        lineType.setLineTypeId("F1");
        line.setLineType(lineType);
        lineDao.insertLineDao(line);
    }
}

package com.hgkj.model.dao;

import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Picture;

import java.util.List;

public interface LineDao {

    /**
     * 查询所有线路
     *
     * @return
     */
    List<Line> allLineDao(int pageSize, int pageIndex);

    /**
     * 查询总页数
     *
     * @param pageSize
     * @return
     */
    int lineTotalPageDao(int pageSize);

    /**
     * 添加线路
     *
     * @param line
     */
    void insertLineDao(Line line);

    /**
     * 删除路线
     *
     * @param lineId
     */
    void deleteLineDao(String lineId);

    /**
     * 查找指定的路线
     *
     * @param lineId
     * @return
     */
    Line findLineDao(String lineId);

    /**
     * 修改路线
     *
     * @param line
     */
    void updateLineDao(Line line);

    /**
     * 修改团购
     *
     * @param line
     */
    void updateTeamDao(Line line);

    /**
     * 团购分页查询
     *
     * @param pageSize
     * @param pageIndex
     * @return
     */
    List<Line> allTeamLineDao(int pageSize, int pageIndex);

    /**
     * 查询团购总页数
     *
     * @param pageSize
     * @return
     */
    int teamLineTotalPageDao(int pageSize);

    /**
     * 通过路线类别查询路线
     *
     * @param lineTypeId
     * @return
     */
    List<Line> getLineByLineTypeDao(String lineTypeId);
}

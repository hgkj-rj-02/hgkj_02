package com.hgkj.model.service;

import com.hgkj.model.entity.Line;

import java.util.List;

public interface LineService {
    /**
     * 查询所有线路
     *
     * @return
     */
    List<Line> allLineService(int pageSize, int pageIndex);

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
    void insertLineService(Line line);

    /**
     * 删除路线
     *
     * @param lineId
     */
    void deleteLineService(String lineId);

    /**
     * 查找指定的路线
     *
     * @param lineId
     * @return
     */
    Line findLineService(String lineId);

    /**
     * 修改路线
     *
     * @param line
     */
    void updateLineService(Line line);

    /**
     * 修改团购
     *
     * @param line
     */
    void updateTeamService(Line line);

    /**
     * 团购查询
     *
     * @param pageSize
     * @param pageIndex
     * @return
     */
    List<Line> allTeamLineService(int pageSize, int pageIndex);

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

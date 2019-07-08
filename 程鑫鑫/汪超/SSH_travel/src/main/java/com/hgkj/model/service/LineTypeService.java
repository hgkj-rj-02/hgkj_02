package com.hgkj.model.service;

import com.hgkj.model.entity.LineType;

import java.util.List;

public interface LineTypeService {
    /**
     * 查询所有的路线类别
     *
     * @return
     */
    List<LineType> allLineTypeService();

    /**
     * 添加路线类别
     *
     * @param lineType
     */
    void insertLineTypeService(LineType lineType);

    /**
     * 删除路线类别
     *
     * @param lineTypeId
     */
    void deleteLineTypeService(String lineTypeId);

    /**
     * 查询一条路线类别
     *
     * @param lineTypeId
     * @return
     */
    LineType findLineTypeService(String lineTypeId);

    /**
     * 修改路线类别
     *
     * @param lineType
     */
    void updateLINETypeService(LineType lineType);

}

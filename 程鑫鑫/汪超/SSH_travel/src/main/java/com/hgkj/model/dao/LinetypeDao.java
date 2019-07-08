package com.hgkj.model.dao;

import com.hgkj.model.entity.LineType;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface LinetypeDao {

    /**
     * 查询所有的路线类别
     *
     * @return
     */
    List<LineType> allLineTypeDao();

    /**
     * 添加路线类别
     *
     * @param lineType
     */
    void insertLineTypeDao(LineType lineType);

    /**
     * 删除路线类别
     *
     * @param lineTypeId
     */
    void deleteLineTypeDao(String lineTypeId);

    /**
     * 查询一条路线类别
     *
     * @param lineTypeId
     * @return
     */
    LineType findLineTypeDao(String lineTypeId);

    /**
     * 修改路线类别
     *
     * @param lineType
     */
    void updateLINETypeDao(LineType lineType);

}

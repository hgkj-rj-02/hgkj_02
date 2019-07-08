package com.hgkj.model.dao;

import com.hgkj.model.entity.Linetype;

import java.util.List;

public interface LinetypeDao {
    /**
     * 线路类型的集合
     * @return
     */
    public List<Linetype> allLinetypeDao();

    /**
     * 添加线路类型
     * @param linetype
     * @return
     */
    public boolean insertLinetypeDao(Linetype linetype);

    /**
     * 删除线路类型
     * @param lineTypeId
     * @return
     */
    public boolean deleteLinetypeDao(String lineTypeId);

    /**
     * 更新线路类型
     * @param linetype
     * @return
     */
    public boolean updateLinetypeDao(Linetype linetype);

    /**
     * 获取线路类型的Id
     * @param lineTypeId
     * @return;
     */
    public Linetype getByIdLinetypeDao(String lineTypeId);
}

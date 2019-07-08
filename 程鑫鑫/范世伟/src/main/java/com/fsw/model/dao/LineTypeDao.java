package com.fsw.model.dao;

import com.fsw.model.entity.Linetype;

import java.util.List;

public interface LineTypeDao {
    public boolean insertLinetypeDao(Linetype linetype);
    public List<Linetype> allLinetypeDao();
    public boolean deleteLinetypeDao(String lineTypeID);
    public Linetype getLinetypeByIdDao(String lineTypeID);
    public boolean updateLinetypeDao(Linetype linetype);
}

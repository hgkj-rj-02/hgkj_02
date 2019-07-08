package com.fsw.model.service;

import com.fsw.model.entity.Linetype;

import java.util.List;

public interface LineTypeService {
    public boolean insertLinetypeService(Linetype linetype);
    public List<Linetype> allLinetypeService();
    public boolean deleteLinetypeService(String lineTypeID);
    public Linetype getLinetypeByIdService(String lineTypeID);
    public boolean updateLinetypeService(Linetype linetype);
}

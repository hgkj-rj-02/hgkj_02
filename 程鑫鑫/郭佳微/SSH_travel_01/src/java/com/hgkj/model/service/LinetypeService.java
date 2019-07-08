package com.hgkj.model.service;

import com.hgkj.model.entity.Linetype;

import java.util.List;

public interface LinetypeService {
    public List<Linetype> allLinetypeService();
    public boolean insertLinetypeService(Linetype linetype);
    public boolean deleteLinetypeService(String lineTypeId);
    public boolean updateLinetypeService(Linetype linetype);
    public Linetype getByIdLinetypeService(String lineTypeId);
}

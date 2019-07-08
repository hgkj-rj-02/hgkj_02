package com.hgkj.model.service.impl;

import com.hgkj.model.dao.LinetypeDao;
import com.hgkj.model.entity.Linetype;
import com.hgkj.model.service.LinetypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LinetypeServiceImpl implements LinetypeService {
    @Autowired
    private LinetypeDao linetypeDao;

    public void setLinetypeDao(LinetypeDao linetypeDao) {
        this.linetypeDao = linetypeDao;
    }

    @Override
    public List<Linetype> allLinetypeService() {
        return linetypeDao.allLinetypeDao();
    }

    @Override
    public boolean insertLinetypeService(Linetype linetype) {
        return linetypeDao.insertLinetypeDao(linetype);
    }

    @Override
    public boolean deleteLinetypeService(String lineTypeId) {
        return linetypeDao.deleteLinetypeDao(lineTypeId);
    }

    @Override
    public boolean updateLinetypeService(Linetype linetype) {
        return linetypeDao.updateLinetypeDao(linetype);
    }

    @Override
    public Linetype getByIdLinetypeService(String lineTypeId) {
        return linetypeDao.getByIdLinetypeDao(lineTypeId);
    }
}

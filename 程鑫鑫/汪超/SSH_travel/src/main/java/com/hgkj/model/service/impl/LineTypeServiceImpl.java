package com.hgkj.model.service.impl;

import com.hgkj.model.dao.LineDao;
import com.hgkj.model.dao.LinetypeDao;
import com.hgkj.model.entity.LineType;
import com.hgkj.model.service.LineTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:14
 **/
@Service
public class LineTypeServiceImpl implements LineTypeService {
    @Autowired
    private LinetypeDao linetypeDao;

    public void setLinetypeDao(LinetypeDao linetypeDao) {
        this.linetypeDao = linetypeDao;
    }

    @Override
    public List<LineType> allLineTypeService() {
        return linetypeDao.allLineTypeDao();
    }

    @Override
    public void insertLineTypeService(LineType lineType) {
        linetypeDao.insertLineTypeDao(lineType);
    }

    @Override
    public void deleteLineTypeService(String lineTypeId) {
        linetypeDao.deleteLineTypeDao(lineTypeId);
    }

    @Override
    public LineType findLineTypeService(String lineTypeId) {
        return linetypeDao.findLineTypeDao(lineTypeId);
    }

    @Override
    public void updateLINETypeService(LineType lineType) {
        linetypeDao.updateLINETypeDao(lineType);
    }
}

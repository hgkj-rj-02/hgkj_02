package com.fsw.model.service.imp;

import com.fsw.model.dao.LineTypeDao;
import com.fsw.model.entity.Linetype;
import com.fsw.model.service.LineTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LineTypeServicceImpl implements LineTypeService {
    @Autowired
    private LineTypeDao lineTypeDao;

    public void setLineTypeDao(LineTypeDao lineTypeDao) {
        this.lineTypeDao = lineTypeDao;
    }

    @Override
    public boolean insertLinetypeService(Linetype linetype) {
        return lineTypeDao.insertLinetypeDao(linetype);
    }

    @Override
    public List<Linetype> allLinetypeService() {
        return lineTypeDao.allLinetypeDao();
    }

    @Override
    public boolean deleteLinetypeService(String lineTypeID) {
        return lineTypeDao.deleteLinetypeDao(lineTypeID);
    }

    @Override
    public Linetype getLinetypeByIdService(String lineTypeID) {
        return lineTypeDao.getLinetypeByIdDao(lineTypeID);
    }

    @Override
    public boolean updateLinetypeService(Linetype linetype) {
        return lineTypeDao.updateLinetypeDao(linetype);
    }
}

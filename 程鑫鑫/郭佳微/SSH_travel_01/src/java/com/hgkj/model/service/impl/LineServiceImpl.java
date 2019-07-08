package com.hgkj.model.service.impl;

import com.hgkj.model.dao.LineDao;
import com.hgkj.model.entity.Line;
import com.hgkj.model.service.LineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LineServiceImpl  implements LineService {
    @Autowired
    private LineDao lineDao;

    public void setLineDao(LineDao lineDao) {
        this.lineDao = lineDao;
    }

    @Override
    public List<Line> allLineService() {
        return lineDao.allLineDao();
    }

    @Override
    public boolean insertLineService(Line line) {
        return lineDao.insertLineDao(line);
    }

    @Override
    public boolean deleteLineService(String lineId) {
        return lineDao.deleteLineDao(lineId);
    }

    @Override
    public boolean updateLineService(Line line) {
        return lineDao.updateLineDao(line);
    }

    @Override
    public Line getByIdLineService(String lineId) {
        return lineDao.getByIdLineDao(lineId);
    }
}

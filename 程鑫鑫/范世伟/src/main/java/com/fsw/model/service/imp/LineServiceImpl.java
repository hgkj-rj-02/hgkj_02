package com.fsw.model.service.imp;

import com.fsw.model.dao.LineDao;
import com.fsw.model.entity.Line;
import com.fsw.model.service.LineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LineServiceImpl implements LineService {

    @Autowired
    private LineDao lineDao;

    public LineDao getLineDao() {
        return lineDao;
    }

    public void setLineDao(LineDao lineDao) {
        this.lineDao = lineDao;
    }

    @Override
    public boolean insertLineService(Line line) {
        return lineDao.insertLineDao(line);
    }

    @Override
    public List<Line> allLineService() {
        return lineDao.allLineDao();
    }

    @Override
    public boolean deleteLineService(String lineId) {
        return lineDao.deleteLineDao(lineId);
    }

    @Override
    public Line getLineByIdService(String lineId) {
        return lineDao.getLineByIdDao(lineId);
    }

    @Override
    public boolean updateLineService(Line line) {
        return lineDao.updateLineDao(line);
    }
}

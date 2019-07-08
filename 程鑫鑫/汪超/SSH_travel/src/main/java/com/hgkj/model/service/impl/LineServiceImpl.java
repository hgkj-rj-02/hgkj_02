package com.hgkj.model.service.impl;

import com.hgkj.model.dao.LineDao;
import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Picture;
import com.hgkj.model.service.LineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:14
 **/
@Service
public class LineServiceImpl implements LineService {
    @Autowired
    private LineDao lineDao;

    public void setLineDao(LineDao lineDao) {
        this.lineDao = lineDao;
    }

    @Override
    public List<Line> allLineService(int pageSize, int pageIndex) {
        return lineDao.allLineDao(pageSize,pageIndex);
    }

    @Override
    public int lineTotalPageDao(int pageSize) {
        return lineDao.lineTotalPageDao(pageSize);
    }

    @Override
    public void insertLineService(Line line) {
        lineDao.insertLineDao(line);
    }

    @Override
    public void deleteLineService(String lineId) {
        lineDao.deleteLineDao(lineId);
    }

    @Override
    public Line findLineService(String lineId) {
        return lineDao.findLineDao(lineId);
    }

    @Override
    public void updateLineService(Line line) {
        lineDao.updateLineDao(line);
    }

    @Override
    public void updateTeamService(Line line) {
        lineDao.updateTeamDao(line);
    }

    @Override
    public List<Line> allTeamLineService(int pageSize, int pageIndex) {
        return lineDao.allTeamLineDao(pageSize, pageIndex);
    }

    @Override
    public int teamLineTotalPageDao(int pageSize) {
        return lineDao.teamLineTotalPageDao(pageSize);
    }

    @Override
    public List<Line> getLineByLineTypeDao(String lineTypeId) {
        return lineDao.getLineByLineTypeDao(lineTypeId);
    }
}

package com.fsw.model.dao;

import com.fsw.model.entity.Line;

import java.util.List;

public interface LineDao {
    public boolean insertLineDao(Line line);
    public List<Line> allLineDao();
    public boolean deleteLineDao(String lineId);
    public Line getLineByIdDao(String lineId);
    public boolean updateLineDao(Line line);
}

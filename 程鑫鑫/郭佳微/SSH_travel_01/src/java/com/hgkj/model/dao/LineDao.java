package com.hgkj.model.dao;

import com.hgkj.model.entity.Line;

import java.util.List;

public interface LineDao {
    public List<Line> allLineDao();
    public boolean insertLineDao(Line line);
    public boolean deleteLineDao(String lineId);
    public boolean updateLineDao(Line line);
    public Line getByIdLineDao(String lineId);
}

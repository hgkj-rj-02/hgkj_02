package com.hgkj.model.service;

import com.hgkj.model.entity.Line;

import java.util.List;

public interface LineService {
    public List<Line> allLineService();
    public boolean insertLineService(Line line);
    public boolean deleteLineService(String lineId);
    public boolean updateLineService(Line line);
    public Line getByIdLineService(String lineId);
}

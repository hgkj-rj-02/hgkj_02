package com.fsw.model.service;

import com.fsw.model.entity.Line;

import java.util.List;

public interface LineService {
    public boolean insertLineService(Line line);
    public List<Line> allLineService();
    public boolean deleteLineService(String lineId);
    public Line getLineByIdService(String lineId);
    public boolean updateLineService(Line line);
}

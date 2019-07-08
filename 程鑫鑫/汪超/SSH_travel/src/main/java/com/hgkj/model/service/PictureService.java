package com.hgkj.model.service;

import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Picture;

import java.util.List;

public interface PictureService {
    /**
     * 通过路线编号查找图片
     *
     * @param LineId
     * @return
     */
    List<Picture> pictureByLineIdService(int LineId);

    /**
     * 通过图片编号查找路线
     *
     * @param pictureId
     * @return
     */
    Line lineByPicetureService(int pictureId);
}

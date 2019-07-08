package com.hgkj.model.dao;

import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Picture;

import java.util.List;

public interface PictureDao {
    /**
     * 通过路线编号查找图片
     *
     * @param LineId
     * @return
     */
    List<Picture> pictureByLineIdDao(int LineId);

    /**
     * 通过图片编号查找路线
     *
     * @param pictureId
     * @return
     */
    Line lineByPicetureDao(int pictureId);
}

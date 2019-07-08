package com.hgkj.model.service.impl;

import com.hgkj.model.dao.OrderdetailDao;
import com.hgkj.model.entity.Orderdetail;
import com.hgkj.model.service.OrderdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderdetailServiceImpl implements OrderdetailService {
    @Autowired
    private OrderdetailDao orderdetailDao;

    public void setOrderdetailDao(OrderdetailDao orderdetailDao) {
        this.orderdetailDao = orderdetailDao;
    }

    @Override
    public List<Orderdetail> allOrderdetailService() {
        return orderdetailDao.allOrderdetailDao();
    }
}

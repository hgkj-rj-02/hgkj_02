package com.fsw.controler.action;

import com.fsw.model.entity.Car;
import com.fsw.model.entity.Customer;
import com.fsw.model.entity.Line;
import com.fsw.model.service.CarService;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@Namespace("/")
@ParentPackage("struts-default")
public class CarAction {
    @Autowired
    private CarService carService;

    public void setCarService(CarService carService) {
        this.carService = carService;
    }
    private Car car;
    private Customer customer;
    private Line line;


    @Action(value = "insertCar", results = {@Result(name = "insert", type = "redirect",location = "/qt_cart.jsp")})
    public String insertCar(){
        carService.insertCarService(car);
        return "insert";
    }


    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }
}

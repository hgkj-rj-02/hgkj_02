package com.hgkj.controler.action;

import com.hgkj.model.entity.Car;
import com.hgkj.model.entity.Line;
import com.hgkj.model.service.CarService;
import com.hgkj.model.service.LineService;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("struts-default")
public class CarAction {
    @Autowired
    private CarService carService;
    @Autowired
    private LineService lineService;

    public void setLineService(LineService lineService) {
        this.lineService = lineService;
    }

    public void setCarService(CarService carService) {
        this.carService = carService;
    }
    private Car car;
    private List<Car> carList;
    private Line line;
    private List<Line> lineList;

    @Action(value = "allCar",results = @Result(name = "all",type = "redirect",location = "/qt_cart.jsp"))
    public String allCar(){
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        carList=carService.allCarService();
        ActionContext.getContext().getSession().put("carList",carList);
        return "all";
    }
    @Action(value = "insertCar",results = @Result(name = "insert",type = "redirectAction",params = {"actionName","allCar"}))
    public String insertCar(){
        carService.insertCarService(car);
        return "insert";
    }
    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public List<Car> getCarList() {
        return carList;
    }
    public void setCarList(List<Car> carList) {
        this.carList = carList;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public List<Line> getLineList() {
        return lineList;
    }

    public void setLineList(List<Line> lineList) {
        this.lineList = lineList;
    }
}

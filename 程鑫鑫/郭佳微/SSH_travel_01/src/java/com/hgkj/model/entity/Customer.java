package com.hgkj.model.entity;

import java.util.Set;

public class Customer {
    private int customerId;
    private String custAccount;
    private String custName;
    private String custPassWord;
    private String custSex;
    private String custIdentityId;
    private String custTel;
    private Integer custType;
    private Set<Car> carSet;

    public Set<Car> getCarSet() {
        return carSet;
    }

    public void setCarSet(Set<Car> carSet) {
        this.carSet = carSet;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustAccount() {
        return custAccount;
    }

    public void setCustAccount(String custAccount) {
        this.custAccount = custAccount;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustPassWord() {
        return custPassWord;
    }

    public void setCustPassWord(String custPassWord) {
        this.custPassWord = custPassWord;
    }

    public String getCustSex() {
        return custSex;
    }

    public void setCustSex(String custSex) {
        this.custSex = custSex;
    }

    public String getCustIdentityId() {
        return custIdentityId;
    }

    public void setCustIdentityId(String custIdentityId) {
        this.custIdentityId = custIdentityId;
    }

    public String getCustTel() {
        return custTel;
    }

    public void setCustTel(String custTel) {
        this.custTel = custTel;
    }

    public Integer getCustType() {
        return custType;
    }

    public void setCustType(Integer custType) {
        this.custType = custType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customer customer = (Customer) o;

        if (customerId != customer.customerId) return false;
        if (custAccount != null ? !custAccount.equals(customer.custAccount) : customer.custAccount != null)
            return false;
        if (custName != null ? !custName.equals(customer.custName) : customer.custName != null) return false;
        if (custPassWord != null ? !custPassWord.equals(customer.custPassWord) : customer.custPassWord != null)
            return false;
        if (custSex != null ? !custSex.equals(customer.custSex) : customer.custSex != null) return false;
        if (custIdentityId != null ? !custIdentityId.equals(customer.custIdentityId) : customer.custIdentityId != null)
            return false;
        if (custTel != null ? !custTel.equals(customer.custTel) : customer.custTel != null) return false;
        if (custType != null ? !custType.equals(customer.custType) : customer.custType != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = customerId;
        result = 31 * result + (custAccount != null ? custAccount.hashCode() : 0);
        result = 31 * result + (custName != null ? custName.hashCode() : 0);
        result = 31 * result + (custPassWord != null ? custPassWord.hashCode() : 0);
        result = 31 * result + (custSex != null ? custSex.hashCode() : 0);
        result = 31 * result + (custIdentityId != null ? custIdentityId.hashCode() : 0);
        result = 31 * result + (custTel != null ? custTel.hashCode() : 0);
        result = 31 * result + (custType != null ? custType.hashCode() : 0);
        return result;
    }
}

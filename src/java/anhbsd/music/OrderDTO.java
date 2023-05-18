/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.music;

/**
 *
 * @author anhbs
 */
public class OrderDTO {
    private String orderid;
    private String date;
    private double total;
    private String name;
    private String payment;

    public OrderDTO() {
    }

    public OrderDTO(String orderid, String date, double total, String name, String payment) {
        this.orderid = orderid;
        this.date = date;
        this.total = total;
        this.name = name;
        this.payment=payment;
    }

    public String getOrderid() {
        return orderid;
    }

    public String getDate() {
        return date;
    }

    public double getTotal() {
        return total;
    }

    public String getName() {
        return name;
    }
    public String getPayment() {
        return payment;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void setPayment(String payment) {
        this.payment = payment;
    }
    
}

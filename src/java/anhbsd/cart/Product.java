/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.cart;

/**
 *
 * @author anhbs
 */
public class Product {
    private String name;
    private double price;
    private String img;
    private int quantity;
    private String categoryID;

    public Product() {
        this.name="";
        this.price=0;
        this.img="";
        this.quantity=0;
        this.categoryID="";
    }

    public Product(String name, double price, String img, int quantity, String categoryID) {
        this.name = name;
        this.price = price;
        this.img = img;
        this.quantity = quantity;
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getImg() {
        return img;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }
    
}

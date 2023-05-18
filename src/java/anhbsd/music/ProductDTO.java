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
public class ProductDTO {
    private String productID;
    private String name;
    private double price;
    private String img;
    private int quantity;
    private String categoryID;
    public ProductDTO() {
    }

    public ProductDTO(String productID, String name, double price, String img, int quantity, String categoryID) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.img = img;
        this.quantity = quantity;
        this.categoryID = categoryID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return productID + "-" + name + "-" + price + "-" + img + "-" + quantity + "-" + categoryID ;
    }
}

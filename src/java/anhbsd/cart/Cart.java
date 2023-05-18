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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String,Product> cart;

    public Cart() {
    }

    public Cart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }
    public boolean add(Product pd){
        boolean check=false;
        if(this.cart== null){
            this.cart= new HashMap<>();           
        }
        if(this.cart.containsKey(pd.getName())){
            int currentQuantity= this.cart.get(pd.getName()).getQuantity();
            pd.setQuantity(currentQuantity+ pd.getQuantity());
        }
        this.cart.put(pd.getName(), pd);
        check= true;
        return check;
    }
    public boolean remove(String name){
        boolean check= false;
        if(this.cart!= null){
            if(this.cart.containsKey(name)){
                this.cart.remove(name);
                check= true;
            }
        }
        return check;
    }
    public boolean update(String name, Product pd){
        boolean check= false;
        if(this.cart!= null){
            if(this.cart.containsKey(name)){
                this.cart.replace(name, pd);
                check= true;
            }
        }
        return check;
    }
}

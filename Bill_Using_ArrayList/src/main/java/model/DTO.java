package model;

import java.io.Serializable;

public class DTO implements Serializable {
   
    private String dishName;
    private double dishPrice;
    private int dishQuantity;

    public DTO(String dishName, double dishPrice, int dishQuantity) {
        this.dishName = dishName;
        this.dishPrice = dishPrice;
        this.dishQuantity = dishQuantity;
    }

    public String getDishName() {
        return dishName;
    }

    public double getDishPrice() {
        return dishPrice;
    }

    public int getDishQuantity() {
        return dishQuantity;
    }
}

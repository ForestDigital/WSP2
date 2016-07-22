/*
 * Using standard GNU License Version 3
 */
package com.google.josiahparrish9844;

/**
 * For Web Server Programming P2
 * @authored with <3 jay-t
 */
public class Item {

    private String name;
    private int count;
    private double price;

    public double getPrice() {
        return price;
    }   

    public void setPrice(double price) {
        this.price = price;
    }
    
    public Item(String name) {
        this.name = name;
        this.count = 1;
    }
    
    public Item(Item item) {
        this.name = item.getName();
        this.count = item.getCount();
        this.price = item.getPrice();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
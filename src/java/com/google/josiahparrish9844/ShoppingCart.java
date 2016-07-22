/*
 * Using standard GNU License version 3
 */
package com.google.josiahparrish9844;

import java.util.ArrayList;

/**
 * For Web Server Programming P2
 * @authored with <3 jay-t
 */
public class ShoppingCart {

    private ArrayList<Item> cart;
    private double subtotal;

    public double getSubtotal() {
        return subtotal;
    }

    public ShoppingCart() {
        this.cart = new ArrayList<>();
    }

    public void addItem(Item newItem) {
        boolean found = false;
        for (Item item : cart) {
            if (item.getName().equals(newItem.getName())) {
                found = true;
                item.setCount(item.getCount() + newItem.getCount());
            }
        }
        if (!found) {
            cart.add(new Item(newItem));
        }
        subtotal = subtotal + ( newItem.getPrice() * newItem.getCount() );
    }

    public void removeItem(String theItem) {
        for (Item item : cart) {
            if (item.getName().equals(theItem)) {
                cart.remove(item);
                subtotal = subtotal- (item.getPrice() * item.getCount());
                break;
            }
        }
    }

    public ArrayList<Item> getCart() {
        return cart;
    }
}


package it.unisa;

import java.util.*;

public class Cart {
    private Map<Integer, CartItem> items = new HashMap<>();

    public void addProduct(ProductBean product) {
        int id = product.getId();
        if (items.containsKey(id)) {
            items.get(id).incrementQuantity();
        } else {
            items.put(id, new CartItem(product));
        }
    }
    public void increaseQuantity(int productId) {
        if (items.containsKey(productId)) {
            items.get(productId).incrementQuantity();
        }
    }

    public void decreaseQuantity(int productId) {
        if (items.containsKey(productId)) {
            CartItem item = items.get(productId);
            item.decrementQuantity();
            if (item.getQuantity() <= 0) {
                items.remove(productId);
            }
        }
    }
    public void removeProduct(int productId) {
        items.remove(productId);
    }
    public Collection<CartItem> getItems() {
        return items.values();
    }

    public void clear() {
        items.clear();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }
}
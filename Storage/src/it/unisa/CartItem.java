package it.unisa;

public class CartItem {
    private ProductBean product;
    private int quantity;

    public CartItem(ProductBean product) {
        this.product = product;
        this.quantity = 1;
    }
    public void decrementQuantity() {
        this.quantity--;
    }
    public ProductBean getProduct() { return product; }
    public int getQuantity() { return quantity; }
    public void incrementQuantity() { this.quantity++; }
}
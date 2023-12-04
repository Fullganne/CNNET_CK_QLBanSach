// cart.service.ts
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class CartService {
  private cartItems: any[] = [];

  getCartItems(): any[] {
    return this.cartItems;
  }

  addToCart(product: any): void {
    // Check if the product is already in the cart
    const existingItem = this.cartItems.find((item) => item.id === product.id);

    if (existingItem) {
      // If it's already in the cart, increase the quantity
      existingItem.quantity += 1;
    } else {
      // If it's not in the cart, add it with quantity 1
      this.cartItems.push({ ...product, quantity: 1 });
    }
  }

  updateQuantity(productId: number, newQuantity: number): void {
    const item = this.cartItems.find((product) => product.id === productId);

    if (item) {
      item.quantity = newQuantity;
    }
  }

  removeFromCart(productId: number): void {
    this.cartItems = this.cartItems.filter((product) => product.id !== productId);
  }

  clearCart(): void {
    this.cartItems = [];
  }
}
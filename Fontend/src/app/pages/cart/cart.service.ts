// cart.service.ts
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class CartService {
  private cartItems: any[] = [];
  private temporaryCart: any[] = [];
  getCartItems(): any[] {
    return this.cartItems;
  }

  getCartItemstemp(): any[] {
    return this.temporaryCart;
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
  updateQuantitytemp(productId: number, newQuantity: number): void {
    const item = this.temporaryCart.find((product) => product.id === productId);

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
  getTotalPrice(): number {
    return this.cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  }
  getTotalPricetemp(): number {
    return this.temporaryCart.reduce((total, item) => total + item.price * item.quantity, 0);
  }
  getSubtotal(): number {
    return this.cartItems.reduce((total, item) => total + item.unitPrice * item.quantity, 0);
  }
  getSubtotaltemp(): number {
    return this.temporaryCart.reduce((total, item) => total + item.unitPrice * item.quantity, 0);
  }
  getTotalAmount(): number {
    // You may need to implement discount logic here if applicable
    return this.getTotalPrice(); // For now, assuming total amount is the same as total price
  }
  getTotalAmounttemp(): number {
    // You may need to implement discount logic here if applicable
    return this.getTotalPricetemp(); // For now, assuming total amount is the same as total price
  }
  addToTemporaryCart(product: any): void {
    this.temporaryCart = [];
    const existingItem = this.temporaryCart.find((item) => item.id === product.id);

    if (existingItem) {
      existingItem.quantity += 1;
    } else {
      this.temporaryCart.push({ ...product, quantity: 1 });
    }
    
  }

  // Phương thức để lấy giỏ hàng tạm thời
  getTemporaryCartItems(): any[] {
    return this.temporaryCart;
  }

  // Phương thức để xóa giỏ hàng tạm thời
  clearTemporaryCart(): void {
    this.temporaryCart = [];
  }
}

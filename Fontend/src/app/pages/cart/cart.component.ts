// cart.component.ts
import { Component } from '@angular/core';
import { CartService } from './cart.service';

import { bookimg } from '../../../interfaces/bookimg';
@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent {
  cartItems: any[] = [];
  quantity: number = 1;
  img: bookimg | null = null;
  constructor(private cartService: CartService) {}

  ngOnInit(): void {
    this.loadCartItems();
    
  }
  getTotalQuantity(): number {
    return this.cartItems.reduce((total, item) => total + item.quantity, 0);
  }
  
  loadCartItems(): void {
    this.cartItems = this.cartService.getCartItems();
  }

  addToCart(product: any): void {
    this.cartService.addToCart(product);
    this.loadCartItems();
  }

  updateQuantity(productId: number, newQuantity: number): void {
    this.cartService.updateQuantity(productId, newQuantity);
    this.loadCartItems();
  }

  removeFromCart(productId: number): void {
    this.cartService.removeFromCart(productId);
    this.loadCartItems();
  }

  decrement(): void {
    if (this.quantity > 1) {
      this.quantity--;
    }
  }

  increment(): void {
    this.quantity++;
  }
  getTotalPrice(): number {
    return this.cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  }
  getSubtotal(): number {
    return this.cartItems.reduce((total, item) => total + item.unitPrice * item.quantity, 0);
  }
  getTotalAmount(): number {
    // You may need to implement discount logic here if applicable
    return this.getTotalPrice(); // For now, assuming total amount is the same as total price
  }
 
  
}

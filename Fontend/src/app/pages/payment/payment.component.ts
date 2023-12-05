
import { Component, OnInit } from '@angular/core';
import { CartService } from '../cart/cart.service';
@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})

export class PaymentComponent implements OnInit {
  isModalVisible = false;
  constructor(private cartService: CartService) { }

  ngOnInit(): void {
  }

  getCartItems() {
    return this.cartService.getCartItems();
  }

  getTotalAmount() {

    return this.cartService.getTotalAmount();
  }
  
  getSubtotal() {

    return this.cartService.getSubtotal();
  }
 
  
}
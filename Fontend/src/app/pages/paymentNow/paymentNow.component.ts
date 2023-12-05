
import { Component, OnInit } from '@angular/core';
import { CartService } from '../cart/cart.service';
import { MatCardModule } from '@angular/material/card';
import { MatInputModule } from '@angular/material/input';
import { MatRadioModule } from '@angular/material/radio';

@Component({
  selector: 'app-payment',
  templateUrl: './paymentNow.component.html',
  styleUrls: ['./paymentNow.component.css']
})

export class PaymentComponentNow implements OnInit {
  isModalVisible = false;
  constructor(private cartService: CartService) { }

  ngOnInit(): void {
  }

  getCartItems() {
    return this.cartService.getCartItemstemp();
  }

  getTotalAmount() {

    return this.cartService.getTotalAmounttemp();
  }
  
  getSubtotal() {

    return this.cartService.getSubtotaltemp();
  }
 
  
}
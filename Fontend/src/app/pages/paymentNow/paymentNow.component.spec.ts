import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PaymentComponentNow } from './paymentNow.component';

describe('PaymentComponentNow', () => {
  let component: PaymentComponentNow;
  let fixture: ComponentFixture<PaymentComponentNow>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PaymentComponentNow]
    });
    fixture = TestBed.createComponent(PaymentComponentNow);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { TableBookComponent } from './Table-Book.component';

describe('TableBookComponent', () => {
  let component: TableBookComponent;
  let fixture: ComponentFixture<TableBookComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TableBookComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TableBookComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

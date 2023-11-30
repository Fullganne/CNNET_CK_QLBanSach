/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { QuanLyBanSachService } from './QuanLyBanSach.service';

describe('Service: QuanLyBanSach', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [QuanLyBanSachService]
    });
  });

  it('should ...', inject([QuanLyBanSachService], (service: QuanLyBanSachService) => {
    expect(service).toBeTruthy();
  }));
});

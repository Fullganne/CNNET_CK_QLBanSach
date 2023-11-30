import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class QuanLyBanSachService {
  constructor(private HttpClient: HttpClient) { }
  // Tạo biến và hàm đóng mở Sidebar
  isSidebarOpen: boolean = false;
  toggleSidebar() {
    this.isSidebarOpen = !this.isSidebarOpen;
  }

}

import { Component, OnInit } from '@angular/core';
import { sidebarData } from './Sidebar-data';
import { QuanLyBanSachService } from 'src/app/Services/QuanLyBanSach.service';

@Component({
  selector: 'app-Sidebar',
  templateUrl: './Sidebar.component.html',
  styleUrls: ['./Sidebar.component.css']
})
export class SidebarComponent implements OnInit {
  constructor(public QuanLyBanSachService: QuanLyBanSachService) {}
  // Hàm đóng mở Sidebar
  get isSidebarOpen() {
    return this.QuanLyBanSachService.isSidebarOpen;
  }
  toggle() {
    this.QuanLyBanSachService.toggleSidebar();
  }
  sideData = sidebarData;

  ngOnInit() {
  }

}

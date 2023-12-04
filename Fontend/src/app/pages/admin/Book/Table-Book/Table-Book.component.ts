import { Component, OnInit } from '@angular/core';
import { QuanLyBanSachService } from 'src/app/Services/QuanLyBanSach.service';
import { bookhome } from 'src/interfaces/bookhome';

@Component({
  selector: 'app-Table-Book',
  templateUrl: './Table-Book.component.html',
  styleUrls: ['./Table-Book.component.css']
})
export class TableBookComponent implements OnInit {
  constructor(public QuanLyBanSachService: QuanLyBanSachService) { }
  BookList: bookhome[] = [];
  loadBookList() {
    this.QuanLyBanSachService.getBooks().subscribe({
      next: (list) => {
        this.BookList = list;
      },
      error: (error) => {
        console.error('Lỗi khi tải danh sách Sách', error);
      }
    });
  }
  ngOnInit(): void {
    this.loadBookList();
  }

}

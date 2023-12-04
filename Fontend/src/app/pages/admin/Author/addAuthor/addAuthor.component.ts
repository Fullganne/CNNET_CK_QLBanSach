import { Component, OnInit } from '@angular/core';
import { QuanLyBanSachService } from 'src/app/Services/QuanLyBanSach.service';

@Component({
  selector: 'app-addAuthor',
  templateUrl: './addAuthor.component.html',
  styleUrls: ['./addAuthor.component.css']
})
export class AddAuthorComponent implements OnInit {
  newAuthor: any = {}
  constructor(public QuanLyBanSachService: QuanLyBanSachService) { }
  addAuthors() {
    this.QuanLyBanSachService.postAuthors(this.newAuthor).subscribe({
      next: (response) => {
        console.log('Author added:', response);
        // Xử lý sau khi thêm sách thành công
      },
      error: (error) => {
        console.error('Error adding Author:', error);
        // Xử lý khi có lỗi xảy ra
      }
    });
  }
  ngOnInit() {
  }

}

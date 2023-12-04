import { Component, OnInit } from '@angular/core';
import { QuanLyBanSachService } from 'src/app/Services/QuanLyBanSach.service';
import { Router } from '@angular/router';
import { Author } from 'src/interfaces/Author';

@Component({
  selector: 'app-tableAuthor',
  templateUrl: './tableAuthor.component.html',
  styleUrls: ['./tableAuthor.component.css']
})
export class TableAuthorComponent implements OnInit {

  constructor(public QuanLyBanSachService: QuanLyBanSachService, private router: Router) { }

  AuthorList: Author[] = [];
  loadAuthorList() {
    this.QuanLyBanSachService.getAuthors().subscribe({
      next: (list) => {
        this.AuthorList = list;
      },
      error: (error) => {
        console.error('Lỗi khi tải danh sách Tác giả', error);
      }
    });
  }
  deleteAuthor(id: any) {
    this.QuanLyBanSachService.deleteAuthors(id).subscribe({
      next: (response) => {
        alert('Xoá thành công');
        this.loadAuthorList();
      },
      error: (error) => {
        console.error('Lỗi khi xóa', error);
      }
    });
  }
  editAuthor(id: any) {
    this.router.navigate(['/editAuthorAdmin', id]);
  }
  ngOnInit(): void {
    this.loadAuthorList();
  }

}

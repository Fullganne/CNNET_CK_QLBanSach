import { Component, OnInit } from '@angular/core';
import { QuanLyBanSachService } from 'src/app/Services/QuanLyBanSach.service';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-editAuthor',
  templateUrl: './editAuthor.component.html',
  styleUrls: ['./editAuthor.component.css']
})
export class EditAuthorComponent implements OnInit {
  newAuthor: any = {}
  constructor(public QuanLyBanSachService: QuanLyBanSachService, private router: Router, private route: ActivatedRoute) { }
  loadEditAuthor() {
    this.route.params.subscribe((params) => {
      const authorId = params['id'];
      if (authorId) {
        this.QuanLyBanSachService.getAuthorsId(authorId).subscribe({
          next: (data) => {
            console.log(data);
            this.newAuthor = data;
            console.log(this.newAuthor);
          },
          error: (error) => {
            console.error('Lỗi khi lấy dữ liệu', error);
          }
        });
      }
    });
  }
  updateAuthor() {
    this.QuanLyBanSachService.editAuthors(this.newAuthor.id, this.newAuthor).subscribe({
      next: (response) => {
        alert('Cập nhật thành công');
        this.router.navigate(['/authorAdmin']); // Redirect back to the student list page after the update
      },
      error: (error) => {
        console.error('Lỗi khi cập nhật', error);
      }
    });
  }
  ngOnInit() {
    this.loadEditAuthor();
  }
}

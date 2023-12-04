import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

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
  // Author
  getAuthors(): Observable<any> {
    const apiUrl = `https://localhost:7009/api/Authors`;
    return this.HttpClient.get(apiUrl);
  }
  postAuthors(data: any): Observable<any> {
    const apiUrl = `https://localhost:7009/api/Authors`;
    return this.HttpClient.post(apiUrl, data);
  }
  deleteAuthors(id: number): Observable<any> {
    const apiUrl = `https://localhost:7009/api/Authors/${id}`;
    return this.HttpClient.delete(apiUrl);
  }
  getAuthorsId(id: string): Observable<any> {
    const apiUrl = `https://localhost:7009/api/Authors/${id}`;
    return this.HttpClient.get(apiUrl);
  }
  editAuthors(id: number, data: any): Observable<any> {
    const apiUrl = `https://localhost:7009/api/Authors/${id}`;
    return this.HttpClient.put(apiUrl, data);
  }
  // Book
  getBooks(): Observable<any> {
    const apiUrl = `https://localhost:7009/api/Books`;
    return this.HttpClient.get(apiUrl);
  }
}

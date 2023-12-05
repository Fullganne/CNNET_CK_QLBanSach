import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { bookhome } from '../../../interfaces/bookhome';
import { Router } from '@angular/router';
import { bookimg } from '../../../interfaces/bookimg';
import { Author } from '../../../interfaces/Author';
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent{
  banners =
  [
  'assets/banner/vuidentruong.jpg',
  'assets/banner/childrenbook.jpg',
  'assets/banner/manga.jpg',
  ]
  constructor(private http: HttpClient,private router: Router) {}
  data: bookhome[] = [];
  bookImage: bookimg[]=[];
  author:Author |null=null;
  displayedProducts: bookhome[] = []; // Array to hold currently displayed products
  productsToShow = 5; // Number of products to show initially
  productsIncrement = 5;
  ngOnInit() {
    // Make a GET request to fetch book data
    this.http.get<bookhome[]>('https://localhost:7009/api/Books').subscribe(
      {
        // Store the image in the bookImage object with the book ID as the key
        next:response=>{
          if(response) {
            this.data = response;
            this.displayedProducts = this.data.slice(0,5);
          }
        },
        error:error=>console.log('Lỗi khi lấy dữ liệu', error)
      }
    );
    this.http.get<bookimg[]>(`https://localhost:7009/api/Bookimgs?bookId`).subscribe(
      {
        // Store the image in the bookImage object with the book ID as the key
        next:response=>{
          if(response) {
            this.bookImage = response;
          }
        },
        error:error=>console.log('Lỗi khi lấy dữ liệu ', error)
      }
      // (response) => {
      //   // Store the image in the bookImage object with the book ID as the key
      //   if (response) {
      //     this.bookImage = response;
      //   }
      // },
      // (error) => {
      //   console.error('Lỗi khi lấy dữ liệu', error);
      // }
    );
}
loadMore() {
  // Calculate how many more products to display
  this.displayedProducts =this.data.slice(0,this.productsToShow)
  const remainingProducts = this.data.length - this.displayedProducts.length;
  const productsToLoad = Math.min(this.productsIncrement, remainingProducts);

  // Append more products to the displayedProducts array
  if (productsToLoad > 0) {
    const nextProducts = this.data.slice(this.displayedProducts.length, this.displayedProducts.length + productsToLoad);
    this.displayedProducts = this.displayedProducts.concat(nextProducts);
  }
}
  getBookImage(bookId: string): string {
    const matchingImage = this.bookImage.find((bookImage) => bookImage.bookId === bookId);
    return matchingImage ? matchingImage.image0 : ''; // Return the image URL if found, otherwise an empty string
  }
  navigateToProduct(productId: string) {
    // Loại bỏ dấu cách và khoảng trắng khỏi productId
    const sanitizedProductId = productId.replace(/\s+/g, ''); // Loại bỏ dấu cách và khoảng trắng
    // Truyền productId đã được loại bỏ dấu cách vào route "product"
    this.router.navigate(['product', sanitizedProductId]);
  }
  percent1(price: number, per: number): number {
    return price *(1- per) ;}
}

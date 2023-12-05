import { Component, Output, EventEmitter, Renderer2, ElementRef, HostListener } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import {Customer} from './Customer';
import { LocalStorageService } from 'src/app/Services/local-storage.service';

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.css'],
})

export class ModalComponent {
    @Output() closeModalEvent = new EventEmitter<void>();

    errorMessageMK: string | null = null;

    errorMessageEM: string | null = null;

    user: any = {}; // Đối tượng để lưu trữ dữ liệu nhập từ form
    cus:any={};
    r:any={};
    constructor(private http: HttpClient, private router: Router, private localStorageService: LocalStorageService) {}

    closeModal(): void {
      this.closeModalEvent.emit();
    }
    dt: Customer[] = [];
    ngOnInit() {
      // Tạo yêu cầu GET đến URL của máy chủ để lấy dữ liệu
      this.http.get<any[]>('https://localhost:7009/api/Customers').subscribe(
        (response) => {
          this.dt = response;

        },
        (error) => {
          console.error('Lỗi khi lấy dữ liệu', error);
        }
      );
    }
    // checkdn(sdt: string, pas: string): boolean {

    //   return this.dt.some((dt) => {
    //     const cleanPhone = dt.phone.trim();
    //     const cleanPassword = dt.password.trim();
    //     console.log( cleanPhone === sdt)
    //     console.log(cleanPassword === pas)
    //     return cleanPhone === sdt && cleanPassword === pas;
    //   });
    // }

    //check email có tồn tại chưa
    checkDuplicateEmail(email: string): boolean {
      const filteredCustomers = this.dt.filter((dt) => dt.email !== 'abc@gmail.com');
      return filteredCustomers.some((dt) => dt.email === email);
    }
    checkDuplicate(phone: string): boolean {
      return this.dt.some((dt) => {
        return dt.phone === phone;
      });
    }
    loggedIn: boolean = true;
    isChecking: boolean = false;
    check() {
      const inputLogin = {
        id: '',
        fullName: '',
        photo: '',
        activated: true,
        password: this.cus.pass,
        email: '',
        phone: this.cus.sdt,
        carts: [],
        orders: []
      };
    
      this.http.post('https://localhost:7009/api/Login/signin', inputLogin).subscribe({
        next: res => {
          this.r = res;
        },
        error: error => {
          alert('Đăng nhập không thành công 2');
        }
      });
      if (this.r && this.r.StatusCode === 200) {
        const loggedInUser = {
          id: this.r.id,
          fullName: this.r.fullName
        };
        this.localStorageService.setLoggedInUser(loggedInUser);
        console.log(loggedInUser);
        alert('Đăng nhập thành công');
      } else {
        alert('Đăng nhập không thành công 1');
      }
    }
    

    register() {
      // Kiểm tra xác nhận mật khẩu
      //!isEmail(this.user.email)&&
      if(!isPhoneNumber(this.user.phone))
      {
        this.errorMessageEM='Số điện thoại không đúng.'
      }
      if (this.user.password !== this.user.confirmPassword) {
        console.log('Mật khẩu không khớp.');
        this.errorMessageMK = 'Mật khẩu không khớp.'
        return;
      }
      let p = '';
      let m = '';
      // const checkm = this.checkDuplicateEmail(this.user.email);
      const checkp=this.checkDuplicate(this.user.email);
      if (checkp) {
        console.log('Số điện đã tồn tại.');
      } else {
        console.log('Email hợp lệ.');
         if (isPhoneNumber(this.user.email)) {
          p = this.user.email;
          m='abc123@gmail.com'
        }
      }

      // Tạo đối tượng dữ liệu cần gửi
      const data = {
        id: p, // Sử dụng local part của địa chỉ email hoặc số điện thoại
        fullName: this.user.username,
        photo: '',
        activated: false,
        password: this.user.password,
        email: m,
        phone: p,
        carts: [],
        orders: []
      };

      // Gửi dữ liệu đăng ký lên API
      this.http.post('https://localhost:7009/api/Login/signup', data).subscribe(
        (response) => {
          console.log('Đăng ký thành công', response);
          // Xóa dữ liệu sau khi đăng ký
          this.user = {};
          // this.router.navigate(['modal']);
          this.loggedIn = false;
        },
        (error) => {
          alert('Đăng ký không thành công vui lòng kiễm tra lại thông tin đăng nhập');
        }
      );
    }

}

function isPhoneNumber(phone: string): boolean {
  const regex = /^(0|\+84)[1-9]\d{8}$/;
  return regex.test(phone);
}

// function isEmail(input: string): boolean {
//   const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
//   return emailRegex.test(input);
// }
     // if (isEmail(this.user.email)) {
      //   const parts = this.user.email.split('@'); // Tách địa chỉ email thành phần local part và domain
      //   if (parts.length === 2) {
      //     p = parts[0]; // Lấy phần local part
      //     m = this.user.email;
      //   }
      // } else



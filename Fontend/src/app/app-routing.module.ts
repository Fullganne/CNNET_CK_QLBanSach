import {Component, NgModule} from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { UserComponent } from './pages/user/user.component';
import { CategoryComponent } from './pages/category/category.component';
import { ProductComponent } from './pages/product/product.component';
import { PaymentComponent } from './pages/payment/payment.component';
import { PaymentComponentNow } from './pages/paymentNow/paymentNow.component';
import { CartComponent } from './pages/cart/cart.component';
import { ModalComponent } from './component/modal/modal.component';
import { LoginComponent } from './component/login/login.component';
import { AdminComponent } from './pages/admin/admin.component';
import { TableAuthorComponent } from './pages/admin/Author/tableAuthor/tableAuthor.component';
import { AddAuthorComponent } from './pages/admin/Author/addAuthor/addAuthor.component';
import { EditAuthorComponent } from './pages/admin/Author/editAuthor/editAuthor.component';
import { TableBookComponent } from './pages/admin/Book/Table-Book/Table-Book.component';

const routes: Routes=[
    {
    path:'cart',
    component: CartComponent
    },

    {
    path:'',
    component: HomeComponent,
    pathMatch: 'full',
    },
    {
    path:'user',
    component: UserComponent,
    },
    {
    path:'category',
    component: CategoryComponent,
    },
    {
    path:'product/:id',
    component: ProductComponent,
    },
    {
    path:'category-product',
    component: ProductComponent,
    },
    {
    path:'payment',
    component: PaymentComponent,
    },
    {
    path:'paymentNow',
    component: PaymentComponentNow,
    },
{
    path:'produc/:id',
    component: ProductComponent,
    },
    { path: 'modal', component: ModalComponent},
    { path: 'login', component: LoginComponent},
    { path:'admin', component: AdminComponent},
    { path: 'category/:id', component: CategoryComponent},
    { path: 'authorAdmin', component: TableAuthorComponent},
    { path: 'addAuthorAdmin', component: AddAuthorComponent},
    { path: 'editAuthorAdmin/:id', component: EditAuthorComponent},
    { path: 'bookAdmin', component: TableBookComponent},
    
]

@NgModule({
    imports:[RouterModule.forRoot(routes)],
    exports:[RouterModule]
})

export class AppRoutingModule{

}

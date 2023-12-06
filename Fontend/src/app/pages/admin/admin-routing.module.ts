import { TableAuthorComponent } from './Author/tableAuthor/tableAuthor.component';
import { AddAuthorComponent } from './Author/addAuthor/addAuthor.component';
import { EditAuthorComponent } from './Author/editAuthor/editAuthor.component';
import { TableBookComponent } from './Book/Table-Book/Table-Book.component';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './admin.component';
import { NgModule } from '@angular/core';

const routes: Routes = [
    {
        path:'',
        component: AdminComponent,
        pathMatch: 'full',
    },
    { path: 'authorAdmin', component: TableAuthorComponent},
    { path: 'addAuthorAdmin', component: AddAuthorComponent},
    { path: 'editAuthorAdmin/:id', component: EditAuthorComponent},
    { path: 'bookAdmin', component: TableBookComponent},
]

@NgModule({
    imports:[RouterModule.forRoot(routes)],
    exports:[RouterModule]
})

export class AdminRoutingModule{

}
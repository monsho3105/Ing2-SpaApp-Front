import { Routes } from '@angular/router';
import { Login } from './pages/Auth/login/login';

import { RegisterComponent } from './pages/Auth/register/register';
import { InicioAdmi } from './pages/Admin/inicio/inicioadmin';
import { InicioclienteComponent } from './pages/Cliente/iniciocliente/iniciocliente';

export const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: Login },
  { path: 'registro', component: RegisterComponent },
  { path: 'dashboard/admin', component: InicioAdmi },
  { path: 'dashboard/cliente', component: InicioclienteComponent },
  { path: '**', redirectTo: '/login' }
];
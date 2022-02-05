<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


// Rota da pagina home
Route::redirect('/', 'home');
Route::get('home', 'HomeController@index')->name('home');

// Rota da pagina perfil
Route::get('perfil', 'PerfilController@index')->name('perfil');

// Rota da pagina faq
Route::get('faq', 'FAQController@index')->name('faq');

// Rota da pagina Pesquisa
Route::get('pesquisa', 'PesquisaController@index')->name('pesquisa');


// Autenticação

// Login
Route::get('login', 'Auth\LoginController@index')->name('login');
// Cadastro
Route::get('cadastro', 'Auth\CadastroController@index')->name('cadastro');

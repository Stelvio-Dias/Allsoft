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
Route::get('perfil/{id}', 'PerfilController@index')->name('perfil');
Route::post('perfil/visualizar', 'PerfilController@visualizar')->name('perfil.visualizar');
Route::post('perfil/comentar', 'PerfilController@comentar')->name('perfil.comentar');
Route::post('perfil/comentario/deletar', 'PerfilController@deletarComentario')->name('perfil.comentario.deletar');


// Rota da pagina faq
Route::get('faq', 'FAQController@index')->name('faq');

// Rota da pagina Pesquisa
Route::get('pesquisa', 'PesquisaController@index')->name('pesquisa');


// Footer action
Route::post('newsletter', 'FooterController@newsletter')->name('newsletter');
Route::get('mensagem', 'FooterController@mensagem')->name('mensagem');


// Autenticação
// Login
Route::get('login', 'Auth\LoginController@index')->name('login');
Route::post('login-action', 'Auth\LoginController@loginAction')->name('login-action');
// Terminar sessão
Route::get('logout', 'Auth\LoginController@logout')->name('logout');


// Cadastro
Route::get('cadastro', 'Auth\CadastroController@index')->name('cadastro');
Route::post('cadastrar-action', 'Auth\CadastroController@cadastrarAction')->name('cadastrar-action');

// Dashboard
Route::prefix('dashboard')->group(function() {
    // Rota home
    Route::redirect('/', 'home');
    Route::get('home', 'Dashboard\HomeController@index')->name('dashboard.home');

    
    // Comunas
    //cadastrar comuna
    Route::post('comuna/cadastrar', 'Dashboard\ComunaController@cadastrar')->name('dashboard.comuna.cadastrar');

    // deletar comuna
    Route::post('comuna/deletar', 'Dashboard\ComunaController@deletar')->name('dashboard.comuna.deletar');

    //editar comuna
    Route::post('comuna/editar', 'Dashboard\ComunaController@editar')->name('dashboard.comuna.editar');


    // Usuarios
    // editar permissão
    Route::post('user/editar-permissao', 'Dashboard\UserController@editarPermissao')->name('dashboard.user.editar-permissao');
    // configuração
    Route::post('user/configuracao', 'Dashboard\UserController@configuracao')->name('dashboard.user.configuracao');
    // Deletar conta
    Route::post('user/deletar-conta', 'Dashboard\UserController@deletarConta')->name('dashboard.user.deletar-conta');


    // Desaparecidods
    Route::post('desaparecido/cadastrar', 'Dashboard\DesaparecidoController@cadastrar')->name('dashboard.desaparecido.cadastrar');
    // deletar desaparecido
    Route::post('desaparecido/deletar', 'Dashboard\DesaparecidoController@deletar')->name('dashboard.desaparecido.deletar');
    // Editar desaparecido
    Route::post('desaparecido/editar', 'Dashboard\DesaparecidoController@editar')->name('dashboard.desaparecido.editar');
    // aceitar pedido
    Route::post('desaparecido/aceitar-pedido', 'Dashboard\DesaparecidoController@aceitarPedido')->name('dashboard.desaparecido.aceitar-pedido');


    // Check Mate
    Route::get('check-mate', 'Dashboard\CheckMateController@index')->name('dashboard.check-mate');
});
<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\User;
use App\Models\Comuna;
use App\Models\Desaparecido;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        $comunas = Comuna::all();
        $users = User::all();
        $desaparecidos = Desaparecido::all();

        return view('dashboard.home', [
            "comunas" => $comunas ?? [],
            "users" => $users ?? [],
            "desaparecidos" => $desaparecidos ?? []
        ]);
    }
}

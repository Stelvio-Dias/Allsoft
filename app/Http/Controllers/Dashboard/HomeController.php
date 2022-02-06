<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Comuna;
use App\Models\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        $comunas = Comuna::all();
        $users = User::all();

        return view('dashboard.home', [
            "comunas" => $comunas ?? [],
            "users" => $users ?? []
        ]);
    }
}

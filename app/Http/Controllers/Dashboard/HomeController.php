<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Comuna;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        $comunas = Comuna::all();

        return view('dashboard.home', [
            "comunas" => $comunas ?? []
        ]);
    }
}

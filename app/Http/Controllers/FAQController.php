<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FAQController extends Controller
{
    // FAQ view
    public function index() {
        return view('faq');
    }
}

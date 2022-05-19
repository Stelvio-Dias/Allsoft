<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    public function index() {
        return view('auth.login');
    }

    public function loginAction(Request $request) {
        $data = $request->only([
            "email", "password"
        ]);

        $validator = $this->validator($data);

        if($validator->fails()) {
            // Errou na validação
            return redirect()->back()
                ->withInput()
                ->withErrors($validator);
        }

        // Verificar se a conta se encontra ativa
        $user = User::where('email', $data['email'])->first();
        if(is_null($user) == false AND $user->active == false) {
            return redirect()->back()
                ->withInput()
                ->withErrors('Conta inativa');
        }

        if(Auth::attempt($data)) {
            // Ele logou
            return redirect()->route('dashboard.home');
        } 

        return redirect()->back()
            ->withInput()
            ->withErrors('Email e/ou password errada.');

    }

    public function validator(Array $data) {
        return Validator::make($data, [
            "email" => ["required", "email", "min:5", "max:100"],
            "password" => ["required", "string", "min:3"]
        ]);
    }

    // Terminar sessão
    public function logout() {
        Auth::logout();

        return redirect()->route('home');
    }
}

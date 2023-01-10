<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class CadastroController extends Controller
{
    // Cadastrar view
    public function index() {
        return view('auth.cadastro');
    }

    // Cadastrar action
    public function cadastrarAction(Request $request) {
        $data = $request->only([
            "nome", "email", "telemovel", "data_nascimento", "password", "password_confirmation"
        ]);

        // Fazer a validação
        $validator = $this->validator($data);

        if($validator->fails()) {
            // Errou na validação
            return redirect()->back()
                ->withInput()
                ->withErrors($validator);
        }

        // Verifico se há algum usuário logado
        $user = User::all();

        if(count($user) == 0) {
            $data['admin'] = true;
        } else {
            $data['admin'] = false;
        }

        // Cadastro o usuário
        User::create([
            "nome" => $data["nome"],
            "email" => $data["email"],
            "telemovel" => $data["telemovel"],
            "data_nascimento" => $data["data_nascimento"],
            "password" => Hash::make($data["password"]),
            "admin" => $data['admin'],
            "active" => true
        ]);

        // Login
        Auth::attempt($data);

        return redirect()->route('dashboard.home');
    }

    // Validação
    public function validator(Array $data) {
        return Validator::make($data, [
            "nome" => ["required", "string", "min:4", "max:50"],
            "email" => ["required", "email", "min:5", "max:100", "unique:users,email"],
            "telemovel" => ["required", "numeric", "between:900000000,999999999", "unique:users,telemovel"],
            "data_nascimento" => ["required", "date", "before:tomorrow"],
            "password" => ["required", "string", "min:3", "confirmed"],
            "password_confirmation" => ["required", "string", "min:3"]
        ]);
    }
}

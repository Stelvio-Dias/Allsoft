<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    // Editar permissão
    public function editarPermissao(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:users,id"],
            "admin" => ["required", "boolean"]
        ]);

        $user = User::find($data['id']);
        $user->admin = $data['admin'];
        $user->save();

        return redirect()->back()
            ->with('sucesso', 'Permissão alterada com sucesso');
    }

    // Configuração
    public function configuracao(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:users,id"],
            "nome" => ["required", "string", "min:3", "max:50"],
            "data_nascimento" => ["required", "date", "before:tomorrow"],
            "email" => ["required", "email", "min:4", "max:100"],
            "telemovel" => ["required", "numeric", "between:900000000,999999999"]
        ]);

        $user = User::find($data['id']);
        $user->nome = $data['nome'];
        $user->data_nascimento = $data['data_nascimento'];

        // Email
        if($data['email'] != $user->email) {
            $email = $request->validate(["email" => ["unique:users,email"]]);

            $user->email = $email['email'];
        }

        // Telemovel
        if($data['telemovel'] != $user->telemovel) {
            $telemovel = $request->validate(["telemovel" => ["unique:users,telemovel"]]);

            $user->telemovel = $telemovel['telemovel'];
        }

        // Palavra passe
        if($request->filled('old_password')) {
            // Verificar se a palavra passe antiga é diferente a que esta no banco de dados
            if(Hash::check($request->input('old_password'), $user->password) == false) {
                return redirect()->back()
                    ->withErrors('A palavra passe antiga não corresponde');
            }

            $password = $request->validate([
                "password" => ["required", "min:2"]
            ]);

            $user->password = Hash::make($password['password']);
        }

        $user->save();
        return redirect()->back()
            ->with('sucesso', 'Usuario editado com sucesso');
    }
}

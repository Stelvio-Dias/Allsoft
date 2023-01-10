<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    // Login view
    public function index() {
        return view('auth.login');
    }

    // Login action
    public function loginAction(Request $request) {
        $data = $request->only([
            "email", "password"
        ]);

        // Fazer a validação
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

    // Validação
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

    // esqueceu senha view
    public function esqueceuPassword() {
        return view('auth.password');
    }

    // Esqueceu senha action
    public function esqueceuPasswordAction(Request $request) {
        $data = $request->validate([
            "email" => ["required", "email", "exists:users,email"]
        ]);

        // Envia o link de recuperação para o parametro (email) passado
        $status = Password::sendResetLink($request->only('email'));

        return $status === Password::RESET_LINK_SENT 
            ? back()->with('sucesso', 'Email de recuperação enviado com sucesso')
            : back()->withErrors('Erro ao enviar email de recuperação');
    }

    // Alterar senha view
    public function alterarSenha($token) {
        return view('auth.alterarSenha', [
            "token" => $token
        ]);
    }

    // Alterar senha action
    public function alterarSenhaAction(Request $request) {
        $request->validate([
            "token" => ["required"],
            "email" => ["required", "email", "exists:users,email"],
            "password" => ["required", "min:4", "confirmed"]
        ]);

        // Trocar a password
        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'), 
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ]);

                $user->save();

                event(new PasswordReset($user));
            }
        );

        return $status === Password::PASSWORD_RESET
        ? redirect()->route('login')->with('sucesso', 'Senha recuperada com sucesso')
        : back()->withErrors(__($status));
    }

}

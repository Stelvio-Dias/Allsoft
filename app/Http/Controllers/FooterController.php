<?php

namespace App\Http\Controllers;

use App\Models\Newsletter;
use Illuminate\Http\Request;
use App\Mail\Mensagem;
use Illuminate\Support\Facades\Mail;


class FooterController extends Controller
{
    public function newsletter(Request $request) {
        $data = $request->validate([
            "email" => ["required", "email", "min:3", "max:100"]
        ]);

        $newsletter = new Newsletter();
        $newsletter->email = $data['email'];
        $newsletter->save();

        return redirect()->back()
            ->with('sucesso', 'Newsletter assinada com sucesso');
    }

    public function mensagem(Request $request) {
        $data = $request->validate([
            "nome" => ["required", "string", "min:2", "max:50"],
            "email" => ["required", "email", "min:3", "max:100"],
            "assunto" => ["required", "string", "min:5", "max:200"],
            "mensagem" => ["required", "string", "min:2"]
        ]);

        Mail::to(env('MAIL_USERNAME'))->send(new Mensagem($data));

        return redirect()->back()
            ->with('sucesso', 'Email enviado com sucesso');
    } 
}

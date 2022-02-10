<?php

namespace App\Http\Controllers;

use App\Models\Mensagem;
use App\Models\Newsletter;
use Illuminate\Http\Request;
use App\Models\AssuntoMensagem;

class FooterController extends Controller
{
    public function newsletter(Request $request) {
        $data = $request->validate([
            "email" => ["required", "email", "min:3", "max:100", "unique:newsletter,email"]
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
            "email" => ["required", "email", "min:3", "max:100", "unique:mensagem,email"],
            "assunto" => ["required", "string", "min:5", "max:200"],
            "mensagem" => ["required", "string", "min:2"]
        ]);

        $assunto_mensagem = AssuntoMensagem::create([
            "assunto" => $data['assunto'],
            "mensagem" => $data['mensagem']
        ]);

        $mensagem = new Mensagem();
        $mensagem->nome = $data['nome'];
        $mensagem->email = $data['email'];
        $mensagem->usuario_mensagem_id = $assunto_mensagem->id;
        $mensagem->save();

        return redirect()->back()
            ->with('sucesso', 'Mensagem enviada com sucesso');
    } 
}

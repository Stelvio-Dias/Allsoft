<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Descricao;
use App\Models\Desaparecido;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ResponsavelTelemovel;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;

class DesaparecidoController extends Controller
{
    public function cadastrar(Request $request) {
        $data = $request->validate([
            "nome" => ["required", "string", "min:3", "max:50"],
            "data_nascimento" => ["required", "date", "before:tomorrow"],
            "imagem" => ["required", "file", "image"],
            "comuna_id" => ["required", "integer", "min:1", "exists:comuna,id"],
            "aprovado" => ["required", "boolean"],
            "user_id" => ["required", "integer", "min:1", "exists:users,id"]
        ]);

        if(file_exists("desaparecidos") == false) {
            mkdir("desaparecidos");
        }

        $img = $data['imagem'];

        // Gerar nome
        $nome_imagem = $img->getClientOriginalName();
        $extencao_imagem = $img->getClientoriginalExtension();

        $nome_imagem = md5(Hash::make($nome_imagem));
        $nome_final = $nome_imagem . "." . $extencao_imagem;

        // Processamento da imagem
        $imagem = Image::make($img);
        $imagem->resize(700, 474);
        $imagem->save("desaparecidos/{$nome_final}");

        // Cadastrar os dados obrigarorios
        $desaparecido = Desaparecido::create([
            "nome" => $data['nome'],
            "data_nascimento" => $data['data_nascimento'],
            "imagem" => $nome_final,
            "comuna_id" => $data['comuna_id'],
            "aprovado" => $data['aprovado'],
            "user_id" => $data['user_id']
        ]);

        // Campos não obrigatorios

        // Email
        if($request->filled('email')) {
            $email = $request->validate([
                "email" => ["required", "email", "min:4", "unique:desaparecido,email"]
            ]);

            $desaparecido->email = $email['email']; 
        }

        // Altura
        if($request->filled('altura')) {
            $altura = $request->validate([
                "altura" => ["required", "numeric", "min:10"]
            ]);

            $desaparecido->altura = $altura['altura'];
        }

        // Peso
        if($request->filled('peso')) {
            $peso = $request->validate([
                "peso" => ["required", "numeric", "min:2"]
            ]);

            $desaparecido->peso = $peso['peso'];
        }

        // Telemovel1
        if($request->filled('telemovel1')) {
            $telemovel1 = $request->validate([
                "telemovel1" => ["required", "numeric", "between:900000000,999999999", "unique:responsavel_telemovel,telemovel"]
            ]);

            $responsavel_telemovel1 = ResponsavelTelemovel::create([
                "telemovel" => $telemovel1['telemovel1']
            ]);

            $desaparecido->responsavel_telemovel1_id = $responsavel_telemovel1->id;
        }
        
        // Telemovel2
        if($request->filled('telemovel2')) {
            $telemovel2 = $request->validate([
                "telemovel2" => ["required", "numeric", "between:900000000,999999999", "unique:responsavel_telemovel,telemovel"]
            ]);

            $responsavel_telemovel2 = ResponsavelTelemovel::create([
                "telemovel" => $telemovel2['telemovel2']
            ]);

            $desaparecido->responsavel_telemovel2_id = $responsavel_telemovel2->id;
        }

        // Descrição
        if($request->filled('descricao')) {
            $descricao = $request->validate([
                "descricao" => ["required", "string", "min:2"]
            ]);

            Descricao::create([
                "desaparecido_id" => $desaparecido->id,
                "descricao" => $descricao['descricao']
            ]);
        }
        
        $desaparecido->save();

        return redirect()->back()
            ->with('sucesso', 'Desaparecido cadastrado com sucesso');
        
    }

    public function deletar(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:desaparecido,id"]
        ]);

        $desaparecido = Desaparecido::find($data['id']);
        $desaparecido->delete();

        return redirect()->back()
            ->with('sucesso', 'Desaparecido deletado com sucesso');
    }
}

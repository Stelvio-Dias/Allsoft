<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Descricao;
use App\Models\Comentario;
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
        $imagem->resize(700, 474, function($img) {
            $img->aspectRatio();
        });
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
                "descricao" => ["required", "string", "min:230"]
            ]);

            Descricao::create([
                "desaparecido_id" => $desaparecido->id,
                "descricao" => $descricao['descricao']
            ]);
        }
        
        $desaparecido->save();

        if($data['aprovado'] == false) {
            return redirect()->back()
            ->with('sucesso', 'Desaparecido cadastrado com sucesso')
            ->with('info', 'Aguardando uma aprovação de um admnistrador');
        }

        return redirect()->back()
            ->with('sucesso', 'Desaparecido cadastrado com sucesso');
        
    }

    public function deletar(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:desaparecido,id"]
        ]);

        $desaparecido = Desaparecido::find($data['id']);

        // Responsavel telemovel 1
        if(is_null($desaparecido->responsavel_telemovel1_id) == false) {
            ResponsavelTelemovel::find($desaparecido->responsavel_telemovel1_id)
            ->delete();
        }


        // Responsavel telemovel 2
        if(is_null($desaparecido->responsavel_telemovel2_id) == false) {
            ResponsavelTelemovel::find($desaparecido->responsavel_telemovel2_id)
            ->delete();
        }

        // Descrição
        $descricao = Descricao::where('desaparecido_id', $desaparecido->id)->get();

        if(count($descricao) > 0) {
            $descricao->delete();
        }

        // Comentarios
        $comentarios = Comentario::where('desaparecido_id', $desaparecido->id)->get();

        if(count($comentarios) > 0) {
            $comentarios->delete();
        }

        // Apagar a imagem
        unlink("desaparecidos/{$desaparecido->imagem}");

        $desaparecido->delete();

        return redirect()->back()
            ->with('sucesso', 'Desaparecido deletado com sucesso');
    }

    public function editar(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:desaparecido,id"],
            "nome" => ["required", "string", "min:3", "max:50"],
            "data_nascimento" => ["required", "date", "before:tomorrow"],
            "comuna_id" => ["required", "integer", "min:1", "exists:comuna,id"],
            "status" => ["required", "boolean"],
            "aprovado" => ["required", "boolean"]
        ]);

        $desaparecido = Desaparecido::find($data['id']);
        $desaparecido->nome = $data['nome'];
        $desaparecido->data_nascimento = $data['data_nascimento'];
        $desaparecido->comuna_id = $data['comuna_id'];
        $desaparecido->status = $data['status'];
        $desaparecido->aprovado = $data['aprovado'];

        // Imagem
        if($request->hasFile('imagem') && $request->file('imagem')->isValid()) {
            $imagem = $request->validate([
                "imagem" => ["required", "file", "image"]
            ]);

            $img = $imagem['imagem'];

            // Gerar nome
            $nome_imagem = $img->getClientOriginalName();
            $extencao_imagem = $img->getClientoriginalExtension();
    
            $nome_imagem = md5(Hash::make($nome_imagem));
            $nome_final = $nome_imagem . "." . $extencao_imagem;
    
            // Processamento da imagem
            $imagem = Image::make($img);
            $imagem->resize(700, 474, function($img) {
                $img->aspectRatio();
            });
            $imagem->save("desaparecidos/{$nome_final}");

            // apagar a imagem
            unlink("desaparecidos/{$desaparecido->imagem}");

            $desaparecido->imagem = $nome_final;
        }

        // Email
        if($request->filled('email')) {
            
            if($request->input('email') != $desaparecido->email) {
                $email = $request->validate([
                    "email" => ["required", "email", "min:4", "unique:desaparecido,email"]
                ]);

                $desaparecido->email = $email['email'];
            }
        }

        // Telemovel 1
        if($request->filled('telemovel1')) {

            if(is_null($desaparecido->responsavel_telemovel1_id)) {
                goto pulaValidacaoTelemovel1;
            }
            
            if($request->input('telemovel1') != $desaparecido->responsavelTelemovel1->telemovel) {
                pulaValidacaoTelemovel1: // Ponto de referencia

                $telemovel1 = $request->validate([
                    "telemovel1" => ["required", "numeric", "between:900000000,999999999", "unique:responsavel_telemovel,telemovel"]
                ]);

                $responsavel_telemovel1 = ResponsavelTelemovel::updateOrCreate(
                    ["id" => $desaparecido->responsavel_telemovel1_id],
                    ["telemovel" => $telemovel1['telemovel1']]
                );

                $desaparecido->responsavel_telemovel1_id = $responsavel_telemovel1->id;
            }
        }

        // Telemovel 2
        if($request->filled('telemovel2')) {

            if(is_null($desaparecido->responsavel_telemovel2_id)) {
                goto pulaValidacaoTelemovel2;
            }
    
            if($request->input('telemovel2') != $desaparecido->responsavelTelemovel2->telemovel) {
                pulaValidacaoTelemovel2: // Ponto de referencia

                $telemovel2 = $request->validate([
                    "telemovel2" => ["required", "numeric", "between:900000000,999999999", "unique:responsavel_telemovel,telemovel"]
                ]);

                $responsavel_telemovel2 = ResponsavelTelemovel::updateOrCreate(
                    ["id" => $desaparecido->responsavel_telemovel2_id],
                    ["telemovel" => $telemovel2['telemovel2']]
                );

                $desaparecido->responsavel_telemovel2_id = $responsavel_telemovel2->id;
            }
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

        // Descricao
        if($request->filled('descricao')) {
            $descricao = $request->validate([
                "descricao" => ["required", "string", "min:230"]
            ]);

            Descricao::updateOrCreate(
                ['desaparecido_id' => $desaparecido->id],
                ["descricao" => $descricao['descricao']]
            );
        }

        $desaparecido->push();

        return redirect()->back()
            ->with('sucesso', 'Desaparecido editado com sucesso');
        
        
    }

    public function aceitarPedido(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:desaparecido,id"]
        ]);

        $desaparecido = Desaparecido::find($data['id']);

        $desaparecido->aprovado = true;

        $desaparecido->save();

        return redirect()->back()
            ->with('sucesso', 'Pedido aprovado com sucesso');
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Comuna;
use App\Models\Desaparecido;
use Illuminate\Http\Request;

class PesquisaController extends Controller
{
    public function index(Request $request) {
        $comunas = Comuna::all();

        // Receber os dados
        $nome = $request->query("nome", "");
        $ano_desaparecimento = $request->query("ano_desaparecimento", "");
        $data_nascimento = $request->query("data_nascimento", "");
        $comuna = $request->query("comuna", "");
        $ordem = $request->query("ordem", 1);

        // Ano desaparecimento
        switch($ano_desaparecimento) {
            case 1:
                $ano_desaparecimento = '';
                break;
            case 2:
                $ano_desaparecimento = '2021';
                break;
            case 3:
                $ano_desaparecimento = '2022';
                break;
        }

        // ordem
        switch($ordem) {
            case 1:
                $ordem = 'asc';
                break;
            case 2:
                $ordem = 'desc';
                break;
        }

        // Comunas
        if($comuna == 1) {
            $comuna = '';
        }

        // Desaparecido encontrado
        $desaparecidos = Desaparecido::where('aprovado', '1')
            ->where('nome', 'like', '%' . $nome .'%')
            ->where('data_nascimento', 'like', '%' . $data_nascimento . '%')
            ->where('comuna_id', 'like', '%' . $comuna . '%')
            ->where('created_at', 'like', '%' . $ano_desaparecimento .'%')
            ->orderBy('created_at', $ordem)
            ->simplePaginate(8);

        $request->flash();

        return view('pesquisa', [
            "comunas" => $comunas ?? [],
            "desaparecidos" => $desaparecidos ?? []
        ]);
    }
}

<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Desaparecido;
use App\Models\Comentario;
use Illuminate\Http\Request;

class PerfilController extends Controller
{
    public function index($id) {
        $desaparecido = Desaparecido::where('aprovado', '1')
            ->where('id', $id)
            ->first();

        if(is_null($desaparecido)) {
            return redirect()->back()
                ->withErrors('Desaparecido não encontrado');
        }

        // Calcular a idade
        $carbon = new Carbon($desaparecido->data_nascimento);
        $idade = $carbon->diff()->y;

        // Desaparecidos na mesma zona
        $mesma_zona = Desaparecido::where('aprovado', '1')
            ->where('comuna_id', $desaparecido->comuna_id)
            ->where('id', '!=', $desaparecido->id)
            ->limit(5)
            ->get();


        return view('perfil', [
            "desaparecido" => $desaparecido ?? [],
            "idade" => $idade ?? 0,
            "mesma_zona" => $mesma_zona ?? []
        ]);
    }

    public function visualizar(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:desaparecido,id"]
        ]);

        $desaparecido = Desaparecido::find($data['id']);
        $desaparecido->vizualizacoes_qtd++;
        $desaparecido->save();

        return redirect()->back()
            ->with('sucesso', 'Visualizado com sucesso');
    }

    public function comentar(Request $request) {
        $data = $request->validate([
            "desaparecido_id" => ["required", "integer", "min:1", "exists:desaparecido,id"],
            "user_id" => ["required", "integer", "min:1", "exists:users,id"],
            "comentario" => ["required", "string", "min:2"]
        ]);

        $comentario = new Comentario();
        $comentario->comentario = $data['comentario'];
        $comentario->desaparecido_id = $data['desaparecido_id'];
        $comentario->user_id = $data['user_id'];
        $comentario->save();

        return redirect()->back()
        ->with('sucesso', 'Comentado com sucesso');
    }

    public function deletarComentario(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:comentario,id"]
        ]);

        $comentario = Comentario::find($data['id']);
        $comentario->delete();

        return redirect()->back()
            ->with('sucesso', 'Comentario deletado com sucesso');
    }
}

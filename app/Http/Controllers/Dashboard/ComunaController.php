<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Comuna;
use App\Models\Desaparecido;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ComunaController extends Controller
{
    // Cadastrar comuna
    public function cadastrar(Request $request) {
        $data = $request->validate([
            "comuna" => ["required", "string", "min:3", "max:50", "unique:comuna,comuna"]
        ]);

        $comuna = new Comuna();
        $comuna->comuna = $data['comuna'];
        $comuna->save();

        return redirect()->back()
            ->with('sucesso', 'Comuna cadastrada com sucesso');
    }

    // Deletar comuna
    public function deletar(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:comuna,id"]
        ]);

        $comuna = Comuna::find($data['id']);
        $desaparecido = Desaparecido::where('comuna_id', $comuna->id)->first();
        
        if(is_null($desaparecido) == false) {
            return redirect()->back()
                ->withErrors('Não é possivel deletar está comuna');
        }

        $comuna->delete();

        return redirect()->back()
            ->with('sucesso', 'Comuna deletada com sucesso');

    }

    // Editar comuna
    public function editar(Request $request) {
        $data = $request->validate([
            "id" => ["required", "integer", "min:1", "exists:comuna,id"],
            "comuna" => ["required", "string", "min:3", "max:50", "unique:comuna,comuna"]
        ]);

        $comuna = Comuna::find($data['id']);
        $comuna->comuna = $data['comuna'];
        $comuna->save();

        return redirect()->back()
        ->with('sucesso', 'Comuna editada com sucesso');
    }
}

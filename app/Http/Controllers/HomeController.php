<?php

namespace App\Http\Controllers;

use App\Models\Desaparecido;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    // Home view
    public function index() {// Perfis dos desaparecidos
        $desaparecidos_perfis = Desaparecido::where('aprovado', true)
            ->where('status', false)
            ->orderBy('created_at', 'desc')
            ->simplePaginate(5);

        // Mais Vistos
        $mais_vistos = Desaparecido::where('aprovado', true)
            ->orderBy('vizualizacoes_qtd', 'desc')
            ->limit(10)
            ->get();

        // Mais Antigos
        $mais_antigos = Desaparecido::where('aprovado', true) 
            ->orderBy('created_at', 'asc')
            ->limit(10)
            ->get();

        // Comunas
        $comunas = Desaparecido::all()
            ->where('aprovado', true)
            ->groupBy('comuna_id')
            ->take(10);

        return view('home', [
            "desaparecidos_perfis" => $desaparecidos_perfis ?? [],
            "mais_vistos" => $mais_vistos ?? [],
            "mais_antigos" => $mais_antigos ?? [],
            "comunas" => $comunas ?? []
        ]);
    }
}

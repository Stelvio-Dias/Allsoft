<?php

namespace App\Http\Controllers\Dashboard;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Comuna;
use App\Models\Desaparecido;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index(Request $request) {
        $comunas = Comuna::all();

        // Desaparecidos query
        $campo = $request->query('campo', '');

        if(Auth::user()->admin == true) {
            $desaparecidos_query = Desaparecido::where('id', 'like', '%' . $campo . '%')
                ->orWhere('nome', 'like', '%' . $campo . '%')
                ->orderBy('created_at', 'desc')
                ->simplePaginate(10);
        } else {
            $desaparecidos_query = Desaparecido::where('id', 'like', '%' . $campo . '%')
                ->where('user_id', Auth::user()->id)
                ->orWhere('nome', 'like', '%' . $campo . '%')
                ->where('user_id', Auth::user()->id)
                ->orderBy('created_at', 'desc')
                ->simplePaginate(10);
        }




        // Coisas de admnistradores
        if(Auth::user()->admin == true) {
            $desaparecidos_qtd = 0;
            $desaparecidos_menores_qtd = 0;
            $aparecidos_qtd = 0;
            $aparecidos_menores_qtd = 0;
            $avistamentos = 0;
            $avistamentos_menores = 0;

            $users = User::all();
            $desaparecidos = Desaparecido::all();

            foreach($desaparecidos as $item) {
                $carbon = new Carbon($item->data_nascimento);
                $idade = $carbon->diff()->y;

                // caso ele seja desaparecido
                if($item->status == false) {
                    // DEsaparecido
                    $desaparecidos_qtd++;

                    if($idade < 18) {
                        $desaparecidos_menores_qtd++;
                    }
                } else {
                    // Aparecido
                    $aparecidos_qtd++;

                    if($idade < 18) {
                        $aparecidos_menores_qtd++;
                    }
                }

                $avistamentos += $item->visualizacoes_qtd;

                if($idade < 18) {
                    $avistamentos_menores += $item->visualizacoes_qtd;
                }
            }

            // Pedidos
            $pedidos = Desaparecido::where('aprovado', 'false')
                ->orderBy('created_at', 'desc')
                ->get();
        }

        $request->flash();

        return view('dashboard.home', [
            "comunas" => $comunas ?? [],
            "users" => $users ?? [],
            "desaparecidos" => $desaparecidos ?? [],
            "desaparecidos_query" => $desaparecidos_query ?? [],
            "desaparecidos_qtd" => $desaparecidos_qtd ?? 0,
            "desaparecidos_menores_qtd" => $desaparecidos_menores_qtd ?? 0,
            "aparecidos_qtd" => $aparecidos_qtd ?? 0,
            "aparecidos_menores_qtd" => $aparecidos_menores_qtd ?? 0,
            "avistamentos" => $avistamentos ?? 0,
            "avistamentos_menores" => $avistamentos_menores ?? 0,
            "pedidos" => $pedidos ?? []

        ]);
    }
}

<?php

namespace App\View\Components\Desaparecido;

use Illuminate\View\Component;

class CadastrarDesaparecido extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.desaparecido.cadastrar-desaparecido');
    }
}

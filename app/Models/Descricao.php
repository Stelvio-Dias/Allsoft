<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Descricao extends Model
{
    use HasFactory;

    protected $table = "descricao";

    public function descricao() {
        return $this->belongsTo(Desaparecido::class, 'desaparecido_id', 'id');
    }
}

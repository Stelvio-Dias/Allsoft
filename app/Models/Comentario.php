<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comentario extends Model
{
    use HasFactory;

    // Nome da tabela
    protected $table = "comentario";

    public function desaparecidoComentario() {
        return $this->belongsTo(Desaparecido::class, 'desaparecido_id', 'id');
    }

    public function userComentario() {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}

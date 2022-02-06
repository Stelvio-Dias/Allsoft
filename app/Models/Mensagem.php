<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mensagem extends Model
{
    use HasFactory;

    protected $table = "mensagem";

    public function assuntoMensagem() {
        return $this->belongsTo(AssuntoMensagem::class, 'assunto_mensagem_id', 'id');
    }
}

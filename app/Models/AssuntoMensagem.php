<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssuntoMensagem extends Model
{
    use HasFactory;

    // Nome da tabela
    protected $table = "assunto_mensagem";

    public function assuntoMensagem() {
        return $this->hasOne(Mensagem::class, 'assunto_mensagem_id', 'id');
    }
}

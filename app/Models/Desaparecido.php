<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Desaparecido extends Model
{
    use HasFactory;

    protected $table = "desaparecido";

    protected $fillable = [
        "nome", "data_nascimento", "imagem", "aprovado", "user_id", "comuna_id",
        "email", "responsavel_telemovel1_id", "responsavel_telemovel2_id", "altura", "peso",
        "vizualizacoes_qtd", "status", "id"
    ];

    public function comuna() {
        return $this->belongsTo(Comuna::class, 'comuna_id', 'id');
    }

    public function descricao() {
        return $this->hasOne(Descricao::class, 'desaparecido_id', 'id');
    }

    public function responsavelTelemovel1() {
        return $this->belongsTo(ResponsavelTelemovel::class, 'responsavel_telemovel1_id', 'id');
    }

    public function responsavelTelemovel2() {
        return $this->belongsTo(ResponsavelTelemovel::class, 'responsavel_telemovel2_id', 'id');
    }

    public function user() {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function desaparecidoComentario() {
        return $this->hasMany(Comentario::class, 'desaparecido_id', 'id');
    }
}

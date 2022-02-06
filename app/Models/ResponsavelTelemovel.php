<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResponsavelTelemovel extends Model
{
    use HasFactory;

    protected $table = "responsavel_telemovel";

    protected $fillable = ["telemovel"];

    public function responsavelTelemovel1() {
        return $this->hasOne(Desaparecido::class, 'responsavel_telemovel1_id', 'id');
    }

    public function responsavelTelemovel2() {
        return $this->hasOne(Desaparecido::class, 'responsavel_telemovel2_id', 'id');
    }
}

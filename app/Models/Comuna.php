<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comuna extends Model
{
    use HasFactory;

    protected $table = "comuna";

    public function comuna() {
        return $this->hasOne(Desaparecido::class, 'comuna_id', 'id');
    }
}

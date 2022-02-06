<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDesaparecido extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('desaparecido', function (Blueprint $table) {
            $table->id();
            $table->string('nome', 50);
            $table->date('data_nascimento');
            $table->string('imagem', 255);
            $table->boolean('aprovado')->default(false);
            $table->boolean('status')->default(false);
            $table->bigInteger('vizualizacoes_qtd')->default(0);

            // Chaves estrangeiras
            $table->foreignId('comuna_id')->constrained('comuna');
            $table->foreignId('user_id')->constrained('users');

            $table->foreignId('responsavel_telemovel1_id')
                ->nullable()
                ->constrained('responsavel_telemovel');

            $table->foreignId('responsavel_telemovel2_id')
                ->nullable()
                ->constrained('responsavel_telemovel');

            // Não obrigatorios
            $table->string('email', 100)->nullable()->unique();
            $table->integer('altura')->nullable()->unique();
            $table->integer('peso')->nullable()->unique();


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('desaparecido');
    }
}

<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Comuna;
use App\Models\Desaparecido;
use App\Models\User;
use App\Models\Descricao;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ResponsavelTelemovel;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;

class CheckMateController extends Controller
{
    private $nome = [
        "Ana", "Anabel", "Adriana", "Adriano", "Arnaldo", "Abrão", "Amanda", "Armando", 
        "Bruna", "Bruno", "Braulio", "Cassia", "Carla", "Carlos", "Debora", "Dias", "Dunilson",
        "Andreia", "Ândrea", "Elsa", "Elisa", "Edgar", "Eliana", "Fernanda", "Fernando",
        "Helga", "Ivana", "Ivan", "Joana", "João", "Luana", "Laiza", "Magno", "Magna", "Artur", "Eleanor",
        "Nair", "Nadia", "Osvaldo", "Paula", "Raíssa", "Vania", "Rick", "Michonne", "Clementine", "Grimes",
        "Sasha", "Abrahan", "Simon", "Eugine", "Shane", "Dale", "Alpha", "Beta", "Daryl", "Yumik",
        "Ezequiel", "Carol", "Judith", "Connie", "Viollet", "Luis", "Lily", "Milton", "Sténio", 
        "Erivandro", "Margarida", "Frederico", "Márcio", "Cristiano", "Ronaldo", "Leonel", "Messi",
        "Junior", "Neymar", "Rodrigo", "Miranda", "Larice", "Baszler", "Seth", "Rollins", "Bray",
        "Wyatt", "Goldberg", "Braun", "Alexa", "Bliss", "Asuka", "Shayna", "Sarray", "Kay", "Lee",
        "Keith", "Aaron", "Mitch", "Joe", "James", "Harden"
    ];

    private $descricao = [
        "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.",
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.",
        "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.",
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?",
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?"
    ];

    public function index() {
        set_time_limit(0);

        for($a = 1; $a <= 50; $a++) {
            // Processamento da imagem
            $nome_img = md5(Hash::make(time()));
            $nome_final = $nome_img . ".jpg";

            $image = Image::make("old/{$a}.jpg");
            $image->resize(700, 474, function($img) {
                $img->aspectRatio();
            });
            $image->save("desaparecidos/{$nome_final}");

            $nome = $this->nome();

            $desaparecido = Desaparecido::create([
                "nome" => $nome,
                "data_nascimento" => $this->dataNasimento(),
                "imagem" => $nome_final,
                "status" => false,
                "aprovado" => true,
                "vizualizacoes_qtd" => rand(0, 5000),
                "comuna_id" => $this->comuna(),
                "user_id" => $this->user(),
                "email" => $this->email($nome),
                "altura" => rand(140, 200),
                "peso" => rand(20, 300)

            ]);

            $responsavel_Telemovel1 = ResponsavelTelemovel::create([
                "telemovel" => $this->telemovel()
            ]);

            $responsavel_telemovel2 = ResponsavelTelemovel::create([
                "telemovel" => $this->telemovel()
            ]);

            $desaparecido->responsavel_telemovel1_id = $responsavel_Telemovel1->id;
            $desaparecido->responsavel_telemovel2_id = $responsavel_telemovel2->id;
            
            $descricao = new Descricao();
            $descricao->desaparecido_id = $desaparecido->id;
            $descricao->descricao = 
                $this->descricao[rand(0, count($this->descricao) - 1)].
                $this->descricao[rand(0, count($this->descricao) - 1)] . 
                $this->descricao[rand(0, count($this->descricao) - 1)] . 
                $this->descricao[rand(0, count($this->descricao) - 1)] . 
                $this->descricao[rand(0, count($this->descricao) - 1)];
            $descricao->save();

            $desaparecido->save();            
        }

    }

    public function nome() {
        $rand = rand(0, sizeof($this->nome) - 1);
        $primeiro_nome = $this->nome[$rand];

        do {
            $rand = rand(0, sizeof($this->nome) - 1);
            $ultimo_nome = $this->nome[$rand];

        } while($primeiro_nome == $ultimo_nome);

        $nome = $primeiro_nome . " " . $ultimo_nome;

        return $nome;
    }

    public function dataNasimento() {
        $ano = rand(1970, 2021);
        $mes = rand(1, 12);
        
        if($mes == 1 OR $mes == 3 OR $mes = 5 OR $mes = 6 OR $mes = 7 OR $mes = 8 OR $mes = 10 OR $mes = 12) {
            $dia = rand(1, 31);
        } elseif($mes = 2) {
            $dia = rand(1, 28);
        } else {
            $dia = rand(1, 30);
        }

        return $ano . "-" . $mes . "-" . $dia;
    }

    public function comuna() {
        $comuna = Comuna::all();

        return rand(1, count($comuna) - 1);
    }

    public function user() {
        $user = User::all();

        return rand(1, count($user) - 1);
    }

    public function telemovel() {
        $aprovado = false;

        do {
            $telefone = rand(900000000, 999999999);

            $responsavel_telemovel = ResponsavelTelemovel::where('telemovel', $telefone)
                ->first();

            if(is_null($responsavel_telemovel)) {
                $aprovado = true;
            }

        } while($aprovado == false);

        return $telefone;
    }

    public function email($nome) {
        $aprovado = false;
        $provador = [
            "@gmail.com", "@hotmail.com", "@outlooh.com", "@yoopmail.com"
        ];

        do {
            $email = str_replace(' ', '', $nome) . rand(200, 5000) . $provador[rand(0, sizeof($provador) - 1)];

            $desaparecido = Desaparecido::where('email', $email)
                ->first();

            if(is_null($desaparecido)) {
                $aprovado = true;
            }

        } while($aprovado = false);

        return $email;
    }


}

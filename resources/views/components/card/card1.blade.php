<div class="card-1">
    {{-- Img --}}
    <figure>
        <img 
        src="{{ url("desaparecidos/{$item->imagem}") }}" 
        alt="Imagem de {{$item->nome}}"
        class="lazy">
    </figure>

    {{-- Info Card --}}
    <div class="card-info">
        <div class="row">
            <div class="col">
                <i class="fas fa-globe-africa icon"></i>
                <p>{{$item->comuna->comuna}}</p>
            </div>
            <div class="col">
                <i class="fas fa-calendar-alt icon"></i>
                <p>{{ str_replace('-', '/', $item->data_nascimento) }}</p>
            </div>
            <div class="col">
                <i class="fas fa-comment-alt icon"></i>
                <p>0 Comentarios</p>
            </div>
        </div>
    </div>

    {{-- Body Card --}}
    <div class="card-body">
        <h2>
            <a 
                title="Ver perfil de {{ $item->nome }}"
                href="{{ route('perfil', ["id" => $item->id]) }}"
                >
                {{ $item->nome }}
            </a>
        </h2>
        <p>
            {{ Str::limit($item->descricao->descricao ?? '(Sem descrição)', 231, '...') }}
        </p>
        <a href="{{ route('perfil', ["id" => $item->id]) }}"
            title="Ver perfil de {{ $item->nome }}"
            >
            Ver Mais 
            <i class="fas fa-arrow-right icon"></i>
        </a>
    </div>

    <hr>
</div>
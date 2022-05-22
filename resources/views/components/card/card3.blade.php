<div class="card-3">
    {{-- Img --}}
    <figure>
        <img 
        data-src="{{ url("desaparecidos/{$item->imagem}") }}" 
        alt="Imagem de {{$item->nome}}"
        loading="lazy">
    </figure>

    {{-- Corpo --}}
    <div class="card-body">
        <h2>{{ $item->nome }}</h2>
        <p>
            {{ Str::limit($item->descricao->descricao ?? '', 71, '...') }}
        </p>
        <a href="{{ route('perfil', ["id" => $item->id]) }}"
            title="Ver perfil de {{ $item->nome }}">
            Ver Mais
        </a>
    </div>
</div>
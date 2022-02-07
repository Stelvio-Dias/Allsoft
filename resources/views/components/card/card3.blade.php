<div class="card-3">
    {{-- Img --}}
    <figure>
        <img 
        src="{{ url("desaparecidos/{$item->imagem}") }}" 
        alt="Imagem de {{$item->nome}}">
    </figure>

    {{-- Corpo --}}
    <div class="card-body">
        <h2>{{ $item->nome }}</h2>
        <p>
            {{ $item->descricao->descricao ?? '' }}
        </p>
        <a href="">Ver Mais</a>
    </div>
</div>
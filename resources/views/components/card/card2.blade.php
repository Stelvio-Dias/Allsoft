<div class="card-2">
    {{-- Img --}}
    <figure>
        <img 
        src="{{ url("desaparecidos/{$item->imagem}") }}" 
        alt="Imagem de {{$item->nome}}"
        loading="lazy">
    </figure>

    {{-- Card info --}}
    <div class="card-info">
        <div class="me-4">
            <i class="fas fa-calendar-alt icon"></i>
            <p>{{ str_replace('-', '/', $item->data_nascimento) }}</p>
        </div>

        <div>
            <i class="fas fa-eye icon"></i>
            <p>{{ $item->vizualizacoes_qtd }} Visualizações</p>
        </div>
    </div>

    {{-- Nome --}}
    <h3>
        <a href="{{ route('perfil', ["id" => $item->id]) }}"
            title="Ver perfil de {{ $item->nome }}"
            >
            {{ $item->nome }}
        </a>
    </h3>
</div>
<div class="card-1">
    {{-- Img --}}
    <figure>
        <img 
        src="{{ url("desaparecidos/{$item->imagem}") }}" 
        alt="Imagem de {{$item->nome}}">
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
            <a href="">{{ $item->nome }}</a>
        </h2>
        <p>
            {{ $item->descricao->descricao ?? '' }}
        </p>
        <a href="">Ver Mais <i class="fas fa-arrow-right icon"></i></a>
    </div>

    <hr>
</div>
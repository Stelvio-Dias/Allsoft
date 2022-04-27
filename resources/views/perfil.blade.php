@extends('layout.modelo')

@section('titulo', $desaparecido->nome)

@section('body')
{{-- Main Area --}}
<section id="main-area" class="mt-5">
    <div class="container">
        <div class="row">

            {{--  Perfis --}}
            <section class="col-12 col-md-8 pe-md-5 pe-auto">

                <section id="perfil">

                    {{-- imagem --}}
                    <figure>
                        <img 
                        src="{{ url("desaparecidos/{$desaparecido->imagem}") }}" 
                        alt="Imagem de {{$desaparecido->nome}}">
                    </figure>

                    {{-- Nome --}}
                    <h1>{{$desaparecido->nome}}</h1>

                    {{-- Quantidade Visualizacoes --}}
                    <p>{{$desaparecido->vizualizacoes_qtd}} Visualizações</p>

                    {{-- Formulario para visualizar | ligar para o responsavel --}}
                    @if(Auth::check() == true)

                    @if($desaparecido->responsavelTelemovel1 != null)
                        <a href="tel:{{$desaparecido->responsavelTelemovel1->telemovel}}" class="btn btn-success">
                            <i class="fas fa-phone"></i>
                            Ligar
                        </a>
                    @endif

                    @if($desaparecido->responsavelTelemovel2 != null)
                        <a href="tel:{{$desaparecido->responsavelTelemovel2->telemovel}}" class="btn btn-success">
                            <i class="fas fa-phone"></i>
                            Ligar
                        </a>
                    @endif

                    <form action="{{route('perfil.visualizar')}}" class="d-inline-block" method="POST" id="form-visualizar">
                        @csrf
                        <input type="hidden" name="id" value="{{$desaparecido->id}}">
                        <button type="submit" class="btn" title="Eu vi este desaparecido">
                            <i class="fas fa-eye"></i>
                            Visualizar</button>
                    </form>

                    @else
                    <p class="text-danger">Faça <a href="{{route('login')}}">Login</a> para ligar e visualizar</p>
                    @endif

                    {{-- Idade | comuna | Copiar URL --}}
                    <div class="row">
                        {{-- Idade --}}
                        <div class="col">
                            <i class="fas fa-user-clock icon"></i>
                            <p>{{ $idade }} anos</p>
                        </div>

                        {{-- comuna --}}
                        <div class="col">
                            <i class="fas fa-globe-africa icon"></i>
                            <p>{{$desaparecido->comuna->comuna}}</p>
                        </div>

                        {{-- Copiar URL --}}
                        <div class="col">
                            <i class="fas fa-clipboard-list icon"></i>
                            <p>Copiar URL</p>
                        </div>
                    </div>

                    {{-- Collaple descricao --}}
                    <hr>
                    <div class="d-flex justify-content-between desc" data-bs-toggle="collapse" href="#descricao">
                        <h4>Descrição</h4>
                        <i class="fas fa-caret-down"></i>
                    </div>

                    <div class="collapse show" id="descricao">
                        <p>{{ str_replace('-', '/', explode(' ', $desaparecido->created_at)[0]) }}</p>
                        <p class="">
                            {{$desaparecido->descricao->descricao ?? ''}}
                        </p>
                    </div>
                    <hr>

                </section>

                {{-- Comentatios --}}
                <section id="comentarios" class="mt-5">
                    <h2 class="title">Comentarios</h2>

                    @if(Auth::check() == true)
                    <form action="{{ route('perfil.comentar') }}" method="POST" id="comentar-form">
                        @csrf
                        <input type="hidden" name="user_id" value="{{Auth::user()->id}}">
                        <input type="hidden" name="desaparecido_id" value="{{$desaparecido->id}}">

                        <textarea class="form-control my-2" name="comentario" placeholder="Comentario"></textarea>
                        <button type="submit" class="form-control btn btn-success" title="Comentar">Comentar</button>
                    </form>
                    @else
                    <p class="text-danger">Esteja logado para comentar</p>
                    @endif

                    {{-- Exibir comentarios --}}
                    <div class="comentarios">

                        <div class="headline d-flex align-items-center">
                            <i class="fas fa-comment-alt icon"></i>
                            <p class="mb-0">{{ count($desaparecido->desaparecidoComentario) }} Comentarios</p>
                        </div>

                        @foreach($desaparecido->desaparecidoComentario->reverse() as $item)
                        <div class="comentario">
                            <div class="comentario-title">
                                <h4>{{ $item->userComentario->nome }}</h4>
                                <p>{{ str_replace('-', '/', explode(' ', $item->created_at)[0]) }}</p>
                            </div>

                            <p>
                                {{ $item->comentario }}
                            </p>

                            @if(Auth::check() == true)
                                @if(Auth::user()->id == $item->user_id)
                                    <div class="comentario-footer d-flex">
                                        {{-- Apagar Comentario --}}
                                        <form action="{{route('perfil.comentario.deletar')}}" method="POST" class="me-2">
                                            @csrf
                                            <input type="hidden" name="id" value="{{$item->id}}">
                                            <button type="submit" class="btn btn-danger">Apagar</button>
                                        </form>
                                    </div>
                                @endif
                            @endif

                            <hr>

                        </div>
                        @endforeach

                    </div>
                    
                </section>

            </section>

            {{-- Desaparecidos Na Mesma Zona --}}
            <aside class="col-12 col-md-4">

                {{-- Desaparecidos Na Mesma Zona --}}
                <section id="mesma-zona">
                    <h2 class="title">Desaparecidos na mesma zona</h2>

                    <div class="mais-vistos">

                        @foreach($mesma_zona as $item)
                            @component('components.card.card2')
                                @slot('item', $item)
                            @endcomponent
                        @endforeach

                    </div>
                </section>

            </aside>
        </div>
    </div>
</section>
{{-- !Main Area --}}
@endsection
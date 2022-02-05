@extends('layout.modelo')

@section('titulo', 'Perfil')

@section('body')



{{-- Main Area --}}
<section id="main-area" class="mt-5">
    <div class="container">
        <div class="row">

            {{--  Perfis --}}
            <section class="col-12 col-md-8 pe-md-5 pe-0">

                <section id="perfil">

                    {{-- imagem --}}
                    <figure>
                        <img 
                        src="{{ url('assets/images/Blog-post/blog8.png') }}" 
                        alt="Imagem de nome do desaparecido">
                    </figure>

                    {{-- Nome --}}
                    <h1>Nome do desaparecido</h1>

                    {{-- Quantidade Visualizacoes --}}
                    <p>0 Visualizações</p>

                    {{-- Formulario para visualizar --}}
                    <form action="" method="POST" id="form-visualizar">
                        <button type="submit" class="btn">Visualizar</button>
                    </form>

                    {{-- Idade | comuna | Copiar URL --}}
                    <div class="row">
                        {{-- Idade --}}
                        <div class="col">
                            <i class="fas fa-user-clock icon"></i>
                            <p>18 anos</p>
                        </div>

                        {{-- comuna --}}
                        <div class="col">
                            <i class="fas fa-globe-africa icon"></i>
                            <p>Benfica</p>
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

                    <div class="collapse" id="descricao">
                        <p>2022/01/01</p>
                        Lorem ipsum dolor sit amet.
                    </div>
                    <hr>

                </section>

                {{-- Comentatios --}}
                <section id="comentarios" class="mt-5">
                    <h2 class="title">Comentarios</h2>
                    <p class="text-danger">Esteja logado para comentar</p>

                    <form action="" method="" id="comentar-form">
                        <input type="text" name="nome" placeholder="Nome" class="form-control">
                        <textarea class="form-control my-2" name="comentario" placeholder="Comentario"></textarea>
                        <button type="submit" class="form-control btn btn-success">Comentar</button>
                    </form>

                    {{-- Exibir comentarios --}}
                    <div class="comentarios">

                        <div class="headline d-flex align-items-center">
                            <i class="fas fa-comment-alt icon"></i>
                            <p class="mb-0">2 Comentarios</p>
                        </div>

                        <div class="comentario">
                            <div class="comentario-title">
                                <h4>Nome</h4>
                                <p>2022/01/01</p>
                            </div>

                            <p>
                                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Temporibus at corporis perspiciatis eveniet soluta voluptatum.
                            </p>

                            <div class="comentario-footer d-flex">
                                {{-- Apagar Comentario --}}
                                <form action="" method="POST" class="me-2">
                                    <button type="submit" class="btn btn-danger">Apagar</button>
                                </form>

                                {{-- Editar Comentario --}}
                                <form action="" method="POST">
                                    <button type="submit" class="btn btn-primary">Editar</button>
                                </form>
                            </div>

                        </div>

                    </div>
                    
                </section>

            </section>

            {{-- Desaparecidos Na Mesma Zona --}}
            <aside class="col-12 col-md-4">

                {{-- Desaparecidos Na Mesma Zona --}}
                <section id="mesma-zona">
                    <h2 class="title">Mais Vistos</h2>

                    <div class="mais-vistos">

                        <div class="card-2">
                            {{-- Img --}}
                            <figure>
                                <img 
                                src="{{ url('assets/images/Blog-post/blg10.png') }}" 
                                alt="Imagem de nome do desaparecido">
                            </figure>

                            {{-- Card info --}}
                            <div class="card-info">
                                <div class="me-4">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    <p>2022/01/01</p>
                                </div>

                                <div>
                                    <i class="fas fa-eye icon"></i>
                                    <p>0 Visualizações</p>
                                </div>
                            </div>

                            {{-- Nome --}}
                            <h3>
                                <a href="">Nome do desaparecido</a>
                            </h3>
                        </div>

                    </div>
                </section>

            </aside>
        </div>
    </div>
</section>
{{-- !Main Area --}}


@endsection
@extends('layout.modelo')

@section('titulo', 'Home')

@section('body')

{{-- HEADER BANNER --}}
<section id="header-banner">
    <div class="container">
        <h2>Procure Alguem Desaparecido</h2>
        <form action="">
            <div class="row">
                <div class="col-9 pe-0">
                    <input type="search" name="nome" placeholder="Nome" class="form-control">
                </div>
                <div class="col-3 ps-0">
                    <button type="submit" class="form-control">Procurar</button>
                </div>
            </div>
        </form>
    </div>
</section>
{{-- !HEADER BANNER --}}


{{-- Main Area --}}
<section id="main-area" class="mt-5">
    <div class="container">
        <div class="row">

            {{-- Desaparecidos Perfis --}}
            <section class="col-12 col-md-8 pe-md-5 pe-0">
                <h2 class="title">Desaparecidos</h2>

                <div class="card-1">
                    {{-- Img --}}
                    <figure>
                        <img 
                        src="{{ url('assets/images/Blog-post/blog1.png') }}" 
                        alt="Imagem de nome do desaparecido">
                    </figure>
    
                    {{-- Info Card --}}
                    <div class="card-info">
                        <div class="row">
                            <div class="col">
                                <i class="fas fa-globe-africa icon"></i>
                                <p>Benfica</p>
                            </div>
                            <div class="col">
                                <i class="fas fa-calendar-alt icon"></i>
                                <p>2022/01/01</p>
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
                            <a href="">Nome do desaparecido</a>
                        </h2>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum temporibus ea unde, odit officiis cumque eligendi reiciendis distinctio placeat iste odio sapiente aliquam, libero tempora? Consectetur ullam voluptate unde alias quos expedita, quam beatae harum accusamus consequuntur libero! Neque, ea?
                        </p>
                        <a href="">Ver Mais <i class="fas fa-arrow-right icon"></i></a>
                    </div>

                    <hr>
                </div>

            </section>

            {{-- Comunas / Mais Vistos --}}
            <aside class="col-12 col-md-4">

                {{-- Comunas --}}
                <section id="comunas">
                    <h2 class="title">Comunas</h2>
                    <div class="comunas">
                        <div class="comuna d-flex justify-content-between align-content-center">
                            <p class="mb-0">Benfica</p>
                            <p class="mb-0">(05)</p>
                        </div>
                    </div>
                </section>


                {{-- Mais Vistos --}}
                <section id="mais-vistos" class="mt-5">
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



{{-- Mais Antigos --}}
<section id="mais-antigos" class="mt-5">
    <div class="container">

        <h2 class="title">Mais Antigos</h2>

        {{-- Carrousel --}}
        <div class="owl-carousel owl-theme">
            <div class="item">
                <div class="card-3">
                    {{-- Img --}}
                    <figure>
                        <img 
                        src="{{ url('assets/images/Blog-post/blog5.png') }}" 
                        alt="Imagem de nome do desaparecido">
                    </figure>
        
                    {{-- Corpo --}}
                    <div class="card-body">
                        <h2>Nome do desaparecido</h2>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum ratione necessitatibus ad.
                        </p>
                        <a href="">Ver Mais</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>



@endsection
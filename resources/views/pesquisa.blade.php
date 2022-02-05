@extends('layout.modelo')

{{-- Titulo da pagina --}}
@section('titulo', 'Pesquisa')

{{-- Corpo --}}
@section('body')

<section id="pesquisa" class="mt-4">

    <div class="container">
        <h2 class="title">Filtros</h2>

        {{-- Formulario de pesquisa --}}
        <form action="" method="">
    
            {{-- Nome --}}
            <div class="row">
                <label class="col-12">
                    <div class="input-group">
                        <span class="input-group-text">
                            Nome
                        </span>
                        <input type="text" name="nome" placeholder="Nome" class="form-control">
                    </div>
                </label>
            </div>

            {{-- Ano desaparecimento \ Data Nascimento \ Comuna \ Ordem --}}
            <div class="row mt-4">

                {{-- Ano desaparecimento --}}
                <label class="col-12 col-lg-3">
                    <p class="mb-1">Ano de desaparecimento</p>
                    <select name="ano_desaparecimento" class="form-select">
                        <option value="1">2021</option>
                        <option value="2">2022</option>
                    </select>
                </label>

                {{-- Data Nascimento --}}
                <label class="col-12 col-lg-3 mt-4 mt-lg-0">
                    <p class="mb-1">Data de Nascimento</p>
                    <input type="date" name="data_nascimento" class="form-control">
                </label>
                
                {{-- Comuna --}}
                <label class="col-12 col-lg-3 mt-4 mt-lg-0">
                    <p class="mb-1">Comuna</p>
                    <select name="comuna" class="form-select">
                        <option value="1">Desconhecido</option>
                        <option value="2">Benfica</option>
                        <option value="2">Talatona</option>
                    </select>
                </label>
                
                {{-- Ordem --}}
                <label class="col-12 col-lg-3 mt-4 mt-lg-0">
                    <p class="mb-1">Ordem</p>
                    <select name="ordem" class="form-select">
                        <option value="1">Mais recentes primeiro</option>
                        <option value="2">Mais antigos primeiro</option>
                    </select>
                </label>

            </div>

            <div class="row mt-4">
                <div class="col-12">
                    <button type="submit" class="form-control btn btn-success">Procurar</button>
                </div>
            </div>
    
        </form>

        {{-- Exibir Desaparecidos --}}
        <h2 class="text-center text-black-50 mt-4">
            Mostrar resultados para 
            <span class="text-danger">"</span>
            Sonsa
            <span class="text-danger">"</span>
        </h2>

        <div class="row mt-4">
            <div class="col-12 col-md-4 col-lg-3 mt-3">
            
                <div>
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
            <div class="col-12 col-md-4 col-lg-3 mt-3">
            
                <div>
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
            <div class="col-12 col-md-4 col-lg-3 mt-3">
            
                <div>
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
            <div class="col-12 col-md-4 col-lg-3 mt-3">
            
                <div>
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
    </div>

</section>

@endsection
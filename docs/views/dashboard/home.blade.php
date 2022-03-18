@extends('layout.dashboard')

{{-- Titulo --}}
@section('title', 'Home')

{{-- Body --}}
@section('main')

<div class="container-fluid">

    {{-- Dados gerais --}}
    <section id="dados-gerais" class="mt-5">
        <div class="row">

            <div class="col-12 col-md-6 col-lg-3 mt-2 mt-lg-0">
                <div class="card">
                    <div class="card-body">
                        <h2>Cadastrados</h2>
                        <span>
                            {{-- Quantidade total de cadastrados --}}
                            0
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                0
                            </span>
                            Menores de idade
                        </h3>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 mt-2 mt-lg-0">
                <div class="card">
                    <div class="card-body">
                        <h2>Desaparecidos</h2>
                        <span>
                            {{-- Quantidade total de desaparecidos --}}
                            0
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                0
                            </span>
                            Menores de idade
                        </h3>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 mt-2 mt-lg-0">
                <div class="card">
                    <div class="card-body">
                        <h2>Aparecidos</h2>
                        <span>
                            {{-- Quantidade total de aparecidos --}}
                            0
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                0
                            </span>
                            Menores de idade
                        </h3>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 mt-2 mt-lg-0">
                <div class="card">
                    <div class="card-body">
                        <h2>Avistamentos</h2>
                        <span>
                            {{-- Quantidade total de avistamentos --}}
                            0
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                0
                            </span>
                            Menores de idade
                        </h3>
                    </div>
                </div>
            </div>

        </div>
    </section>

    {{-- Form Home --}}
    <section id="form-home" class="mt-5">
        <h2 class="title text-center">Pessoas Desaparecidas</h2>
        <form action="" method="GET">
            <div class="row">
                <div class="col-8 pe-0">
                    <input type="text" name="campo" value="" placeholder="ID ou Nome" class="form-control rounded-0">
                </div>
                
                <div class="col-4 ps-0">
                    <input type="submit" class="form-control btn btn-dark rounded-0" value="Pesquisar">
                </div>
            </div>
        </form>
    </section>

    
    {{-- Exiir resultados --}}
    <section id="exibir-resultados" class="mt-5 pb-4">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>IMAGEM</th>
                        <th>NOME</th>
                        <th>DATA DE NASC.</th>
                        <th>COMUNA</th>
                        <th>EDITAR</th>
                        <th>DELETAR</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td data-bs-toggle="modal" data-bs-target="#imagem">
                            <img 
                            src=""
                            class="view-img">
                        </td>Nome{{$item->nome}}</td>
                        <td>01/01/2022</td>
                        <td>Benfica</td>
                        {{-- Editar --}}
                        <td>
                            <a href=""
                            data-bs-toggle="modal"
                            data-bs-target="#editar-desaparecido">
                                <i class="fas fa-redo-alt icon"></i>
                            </a>
                        </td>
                        {{-- Deletar --}}
                        <td>
                            <a href=""
                            data-bs-toggle="modal"
                            data-bs-target="#deletar-desaparecido">
                                <i class="fas fa-times icon"></i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
    </section>

</div>

@endsection




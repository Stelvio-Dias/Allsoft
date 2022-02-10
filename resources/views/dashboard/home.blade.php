@extends('layout.dashboard')

{{-- Titulo --}}
@section('title', 'Home')

{{-- Body --}}
@section('main')

<div class="container-fluid">

    @if(Auth::user()->admin == true)
    {{-- Dados gerais --}}
    <section id="dados-gerais" class="mt-5">
        <div class="row">

            <div class="col-12 col-md-6 col-lg-3 mt-2 mt-lg-0">
                <div class="card">
                    <div class="card-body">
                        <h2>Cadastrados</h2>
                        <span>
                            {{-- Quantidade total de cadastrados --}}
                            {{ $desaparecidos_qtd + $aparecidos_qtd }}
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                {{ $desaparecidos_menores_qtd + $aparecidos_menores_qtd }}
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
                            {{ $desaparecidos_qtd }}
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                {{ $desaparecidos_menores_qtd }}
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
                            {{ $aparecidos_qtd }}
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                {{ $aparecidos_menores_qtd }}
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
                            {{ $avistamentos }}
                        </span>
        
                        <h3>
                            <span class="text-danger">
                                {{ $avistamentos_menores }}
                            </span>
                            Menores de idade
                        </h3>
                    </div>
                </div>
            </div>

        </div>
    </section>
    @endif

    {{-- Form Home --}}
    <section id="form-home" class="mt-5">
        <h2 class="title text-center">Pessoas Desaparecidas</h2>
        <form action="" method="GET">
            <div class="row">
                <div class="col-8 pe-0">
                    <input type="text" name="campo" value="{{ old('campo') }}" placeholder="ID ou Nome" class="form-control rounded-0">
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
                    @foreach($desaparecidos_query as $item)
                    <tr>
                        <td>{{$item->id}}</td>
                        <td data-bs-toggle="modal" data-bs-target="#imagem-{{$item->id}}">
                            <img 
                            src="{{ url("desaparecidos/{$item->imagem}") }}"
                            class="view-img">
                        </td>
                        <td>{{$item->nome}}</td>
                        <td>{{ str_replace('-', '/', $item->data_nascimento) }}</td>
                        <td>{{ $item->comuna->comuna }}</td>
                        {{-- Editar --}}
                        <td>
                            <a href=""
                            data-bs-toggle="modal"
                            data-bs-target="#editar-desaparecido-{{$item->id}}">
                                <i class="fas fa-redo-alt icon"></i>
                            </a>
                        </td>
                        {{-- Deletar --}}
                        <td>
                            <a href=""
                            data-bs-toggle="modal"
                            data-bs-target="#deletar-desaparecido-{{$item->id}}">
                                <i class="fas fa-times icon"></i>
                            </a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        {{ $desaparecidos_query->links() }}
    </section>

</div>

@endsection




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
                        <input type="text" name="nome" value="{{old('nome')}}" placeholder="Nome" class="form-control">
                    </div>
                </label>
            </div>

            {{-- Ano desaparecimento \ Data Nascimento \ Comuna \ Ordem --}}
            <div class="row mt-4">

                {{-- Ano desaparecimento --}}
                <label class="col-12 col-lg-3">
                    <p class="mb-1">Ano de desaparecimento</p>
                    <select name="ano_desaparecimento" class="form-select">
                        <option value="1" @if(old('ano_desaparecimento') == 1) selected @endif>Desconhecido</option>
                        <option value="2" @if(old('ano_desaparecimento') == 2) selected @endif>2021</option>
                        <option value="3" @if(old('ano_desaparecimento') == 3) selected @endif>2022</option>
                    </select>
                </label>

                {{-- Data Nascimento --}}
                <label class="col-12 col-lg-3 mt-4 mt-lg-0">
                    <p class="mb-1">Data de Nascimento</p>
                    <input type="date" name="data_nascimento" value="{{old('data_nascimento')}}" class="form-control">
                </label>
                
                {{-- Comuna --}}
                <label class="col-12 col-lg-3 mt-4 mt-lg-0">
                    <p class="mb-1">Comuna</p>
                    <select name="comuna" class="form-select">
                        @foreach($comunas as $item)
                            <option value="{{$item->id}}"
                            @if(old('comuna') == $item->id)
                                selected
                            @endif>
                                {{$item->comuna}}
                            </option>
                        @endforeach
                    </select>
                </label>
                
                {{-- Ordem --}}
                <label class="col-12 col-lg-3 mt-4 mt-lg-0">
                    <p class="mb-1">Ordem</p>
                    <select name="ordem" class="form-select">
                        <option value="1" @if(old('ordem') == 1) selected @endif>Mais recentes primeiro</option>
                        <option value="2" @if(old('ordem') == 2) selected @endif>Mais antigos primeiro</option>
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
            @if(count($desaparecidos) > 0)
                Mostrar resultados para 
                <span class="text-danger">"</span>{{ old('nome') }}<span class="text-danger">"</span>
            @else
                Nenhum (0) resultado encontrado
            @endif
        </h2>

        <div class="row mt-4">

            @foreach($desaparecidos as $item)
            <div class="col-12 col-md-4 col-lg-3 mt-3">
                <div>
                    @component('components.card.card3')
                        @slot('item', $item)
                    @endcomponent
                </div>
            </div>
            @endforeach

        </div>

        <div class="my-4">
            {{ $desaparecidos->links() }}
        </div>

    </div>

</section>

@endsection
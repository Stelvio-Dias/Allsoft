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

                @foreach($desaparecidos_perfis as $item)
                    @component('components.card.card1')
                        @slot('item', $item)
                    @endcomponent
                @endforeach

                {{ $desaparecidos_perfis->links() }}

            </section>

            {{-- Comunas / Mais Vistos --}}
            <aside class="col-12 col-md-4">

                {{-- Comunas --}}
                <section id="comunas">
                    <h2 class="title">Comunas</h2>
                    <div class="comunas">
                        @foreach($comunas as $item)
                        <div class="comuna d-flex justify-content-between align-content-center">
                            <p class="mb-0">{{ $item[0]->comuna->comuna }}</p>
                            <p class="mb-0">({{ count($item) }})</p>
                        </div>
                        @endforeach
                    </div>
                </section>


                {{-- Mais Vistos --}}
                <section id="mais-vistos" class="mt-5">
                    <h2 class="title">Mais Vistos</h2>

                    <div class="mais-vistos">

                        @foreach($mais_vistos as $item)
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



{{-- Mais Antigos --}}
<section id="mais-antigos" class="mt-5">
    <div class="container">

        <h2 class="title">Mais Antigos</h2>

        {{-- Carrousel --}}
        <div class="owl-carousel owl-theme">
            @foreach($mais_vistos as $item)
            <div class="item">
                @component('components.card.card3')
                    @slot('item', $item)
                @endcomponent
            </div>
            @endforeach
        </div>

    </div>
</section>



@endsection
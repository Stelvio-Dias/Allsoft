<!DOCTYPE html>
<html lang="pt-ao">
<head>
    <!-- Meta Tags -->
    <meta charset="UTF8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no">
    <meta name="author" content="Adriana de Jesus Dembele">
    <meta name="author" content="Loyde Astride da Silva">
    <meta name="author" content="Larice Patricia Sebastião Mateus">
    <meta name="author" content="Stélvio Magno Artur Dias">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Titulo da página -->
    <title>{{ env('APP_NAME') }} - @yield('title')</title>

    <link rel="stylesheet" href="{{ url("assets/lib/bootstrap/css/bootstrap.min.css") }}">
    <link rel="stylesheet" href="{{ url("assets/lib/fontawesome/css/all.min.css") }}">
    <!-- CSS personalizado -->
    <link rel="stylesheet" href="{{ url("assets/css/dashboard.css") }}">
    
</head>
<body>

{{-- HEader --}}
<header id="header" class="bg-dark text-white">

    <div class="container-fluid d-flex justify-content-between align-items-center h-100">

        <button class="btn" data-bs-toggle="offcanvas" data-bs-target="#menu">
            <i class="fas fa-bars icon"></i>
        </button>

        <h1>Titulo da pagina</h1>

        <h3>{{Auth::user()->nome}}</h3>


    </div>

</header>


{{-- Offcanvas --}}
<div class="offcanvas offcanvas-start bg-dark" id="menu" >
    <div class="offcanvas-header">
        <a href="#">
            <h2>{{ env('APP_NAME') }}</h2>
        </a>
        <button type="button" class="btn-close-white btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <ul>
            <li>
                <a href="">
                    <i class="fas fa-home icon"></i>
                    Home
                </a>
            </li>
            <li>
                <a href=""
                data-bs-toggle="modal"
                data-bs-target="#comunas">
                    <i class="fas fa-map-marked-alt icon"></i>
                    Comunas ({{ count($comunas) }})
                </a>
            </li>
            <li>
                <a href=""
                data-bs-toggle="modal"
                data-bs-target="#editar-permicao">
                    <i class="fas fa-user-shield icon"></i>
                    Usuarios ({{ count($users) }})
                </a>
            </li>
            <li>
                <a href=""
                data-bs-toggle="modal"
                data-bs-target="#pedidos">
                    <i class="fas fa-hand-holding-heart icon"></i>
                    Pedidos (03)
                </a>
            </li>
            <li>
                <a href=""
                data-bs-toggle="modal"
                data-bs-target="#cadastrar-desaparecido">
                    <i class="fas fa-user-plus icon"></i>
                    Desaparecidos
                </a>
            </li>
            <li>
                <a href=""
                data-bs-toggle="modal"
                data-bs-target="#usuario-configuracao">
                    <i class="fas fa-cogs icon"></i>
                    Configurações
                </a>
            </li>
            <li>
                <a href=""
                data-bs-toggle="modal"
                data-bs-target="#terminar-sessao">
                    <i class="fas fa-sign-out-alt icon"></i>
                    Terminar Sessão
                </a>
            </li>
        </ul>

        <h2 class="text-center">Copyright ©2022 Todos direitos reservados</h2>
    </div>
</div>


<div class="erros">

    @if($errors->any())
        @foreach($errors->all() as $error)
        <div class="alert alert-danger alert-dismissible">
            <strong>Erro! </strong>{{ $error }}
            <button type="button" class="bt btn-close" data-bs-dismiss="alert"></button>
        </div>
        @endforeach
    @endif

    @if(session('sucesso'))
    <div class="alert alert-success alert-dismissible">
        <strong>Parabéns! </strong>{{ session('sucesso') }}
        <button type="button" class="bt btn-close" data-bs-dismiss="alert"></button>
    </div>
    @endif

</div>

<main id="main">
    @yield('main')
</main>

{{-- ~xxxxxxxxxxxxx USers xxxxxxxxxxxx --}}
{{-- Component Editar permissão --}}
@component('components.usuario.editar-permicao')
    @slot('users', $users)
@endcomponent
{{-- Component Usuario Configuração --}}
@component('components.usuario.usuario-configuracao')
    
@endcomponent

{{-- Component Terminar sessão --}}
@component('components.usuario.terminar-sesssao')
    
@endcomponent


{{--XXXXXXXXXXXXXXXX Comunas XXXXXXXXXXXXXXXXXXXX--}}

{{-- Component Comunas --}}
@component('components.comuna.comuna')
    @slot('comunas', $comunas)
@endcomponent

@foreach($comunas as $item)
    {{-- Editar comuna --}}
    @component('components.comuna.editar-comuna')
        @slot('item', $item)
    @endcomponent


    {{-- Deletar Comuna --}}
    @component('components.comuna.deletar-comuna')
        @slot('item', $item)
    @endcomponent
@endforeach


{{-- XXXXXXXXXXXXXXXXX DESAPARECIDOS XXXXXXXXXXXXXX --}}
{{-- Component Pedido --}}
@component('components.pedido.pedido')
    
@endcomponent

{{-- Component Cadastrar desaparecido --}}
@component('components.desaparecido.cadastrar-desaparecido')
    @slot('comunas', $comunas)
@endcomponent

@foreach($desaparecidos as $item)
    {{-- Component Exibir imagem --}}
    @component('components.desaparecido.exibir-imagem')
        @slot('item', $item)
    @endcomponent

    {{-- Component Deletar Desaparecido --}}
    @component('components.desaparecido.deletar-desaparecido')
        @slot('item', $item)
    @endcomponent
@endforeach

{{-- Component Editar desaparecido --}}
@component('components.desaparecido.editar-desaparecido')
    
@endcomponent





    
<script src="{{ url("assets/lib/bootstrap/js/bootstrap.min.js") }}"></script>
<script src="{{ url("assets/lib/fontawesome/js/all.min.js") }}"></script>
</body>
</html>
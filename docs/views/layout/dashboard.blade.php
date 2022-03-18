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

        <h1>Home</h1>

        <h3></h3>


    </div>

</header>


{{-- Offcanvas --}}
<div class="offcanvas offcanvas-start bg-dark" id="menu" >
    <div class="offcanvas-header">
        <a href="" title="Ir para a página principal">
            <h2>Nome APP</h2>
        </a>
        <button type="button" class="btn-close-white btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <ul>
            <li>
                <a href="" title="Ir para a página principal">
                    <i class="fas fa-home icon"></i>
                    Home
                </a>
            </li>
            <li>
                <a href=""
                title="Gerir comunas"
                data-bs-toggle="modal"
                data-bs-target="#comunas">
                    <i class="fas fa-map-marked-alt icon"></i>
                    Comunas (0)
                </a>
            </li>
            <li>
                <a href=""
                title="Editar permissão de usuario"
                data-bs-toggle="modal"
                data-bs-target="#editar-permicao">
                    <i class="fas fa-user-shield icon"></i>
                    Usuarios (0)
                </a>
            </li>
            <li>
                <a href=""
                title="Ver pedidos"
                data-bs-toggle="modal"
                data-bs-target="#pedidos">
                    <i class="fas fa-hand-holding-heart icon"></i>
                    Pedidos (0)
                </a>
            </li>
            <li>
                <a href="">
                    <i class="fas fa-chess-king icon"></i>
                    Check Mate
                </a>
            </li>
            <li>
                <a href=""
                title="Cadastrar desaparecidos"
                data-bs-toggle="modal"
                data-bs-target="#cadastrar-desaparecido">
                    <i class="fas fa-user-plus icon"></i>
                    Desaparecidos
                </a>
            </li>
            <li>
                <a href=""
                title="Configurar dados"
                data-bs-toggle="modal"
                data-bs-target="#usuario-configuracao">
                    <i class="fas fa-cogs icon"></i>
                    Configurações
                </a>
            </li>
            <li>
                <a href=""
                title="Terminar sessão"
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

<main id="main">
    @yield('main')
</main>

    
<script src="{{ url("assets/lib/bootstrap/js/bootstrap.min.js") }}"></script>
<script src="{{ url("assets/lib/fontawesome/js/all.min.js") }}"></script>
</body>
</html>
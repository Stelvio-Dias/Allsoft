<!DOCTYPE html>
<html lang="pt-pt">
<head>
    <meta charset="UTF-8">

    <meta name="author" content="Adriana de Jesus Dembele">
    <meta name="author" content="Larice Patricia Sebastião Mateus">
    <meta name="author" content="Loyde Astride da Silva">
    <meta name="author" content="Stélvio Dias">

    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <meta name="description" content="Essa é a pagina de Home">

    <title>{{ env('APP_NAME') }} - @yield('titulo')</title>

    {{-- Css --}}
    <link rel="stylesheet" href="{{ url("assets/lib/bootstrap/css/bootstrap.min.css") }}">
    <link rel="stylesheet" href="{{ url("assets/lib/fontawesome/css/all.min.css") }}">
    <link rel="stylesheet" href="{{ url("assets/lib/owlcarousel/css/owl.carousel.min.css") }}">
    <link rel="stylesheet" href="{{ url("assets/css/style.css") }}">
</head>
<body>
    
<header id="header">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" title="Ir para a página principal" href="{{ route('home') }}">{{ env('APP_NAME') }}</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="text-white fas fa-bars icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('home')}}" title="Ir para a página principal">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('dashboard.home')}}" title="Area admnistrativa">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#footer" title="Enviar uma mensagem">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link bg-primary rounded-pill btn-pill" href="{{route('faq')}}" title="Perguntas frequentementes perguntadas">faq</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-lg-4 mt-3 mt-lg-0">
                    <form action="{{route('pesquisa')}}" method="GET" id="form-header">
                        <div class="row">
                            <div class="col-10 pe-0">
                                <input type="search" name="nome" placeholder="Nome" class="form-control rounded-0">
                            </div>
                            <div class="col-2 ps-0">
                                <button type="submit" class="form-control btn btn-light rounded-0" title="Pesquisar">
                                    <i class="fas fa-search icon"></i>
                                </button>
                            </div>
                    </form>
                </ul>
            </div>
        </div>
    </nav>
</header>

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

<main>
    @yield('body')
</main>



<footer id="footer" class="bg-dark text-white py-5 mt-3">

    <div class="container">
        <div class="row">

            <div class="col-12 col-lg-6">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="footer-title">
                            <h4 class="title">Sobre Nós</h4>
                            <p>
                                Trabalho de fim de curso apresentado à Coordenação do Curso de Informática do Complexo Escolar Girassol como requisito para obtenção do grau de Técnico Médio de Informática.
                            </p>
                        </div>

                        <div class="footer-title">
                            <h4 class="title">Newsletter</h4>

                            <form action="{{ route('newsletter') }}" method="POST">
                                @csrf
                                <p>Assine a nossa newsletter.</p>
                                <div class="row">
                                    <div class="col-9 pe-0">
                                        <input type="email" name="email" placeholder="Email" class="form-control rounded-0">
                                    </div>
                                    <div class="col-3 ps-0">
                                        <button type="submit" class="form-control rounded-0" title="Assinar o newsletter">
                                            <i class="fas fa-chevron-right icon"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 mt-4 mt-md-0">
                        <div class="footer-title">
                            <h4 class="title">Links</h4>
                            <ul>
                                <li>
                                    <a href="{{route('home')}}" title="Ir para a página principal">Home</a>
                                </li>
                                <li>
                                    <a href="{{route('faq')}}" title="Perguntas frequestemente perguntadas">FAQ</a>
                                </li>
                                <li>
                                    <a href="{{route('cadastro')}}" title="Criar uma conta">Cadastrar conta</a>
                                </li>
                                <li>
                                    <a href="{{route('login')}}" title="Logar">Login</a>
                                </li>
                                <li>
                                    <a href="{{route('dashboard.home')}}" title="Área admnistrativa">Área admnistrativa</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    
            <div class="col-12 col-lg-6 mt-4 mt-lg-0">
                
                <div class="footer-title">
                    <h4 class="title">Envie uma mensagem</h4>
                    <p>Entre em contacto conosco.</p>
                </div>

                <form action="{{ route('mensagem') }}" method="POST">
                    @csrf

                    {{-- Nome --}}
                    <div class="row mb-3">
                        <div class="col-12">
                            <input type="text" name="nome" placeholder="Nome" class="form-control">
                        </div>
                    </div>


                    {{-- Email --}}
                    <div class="row mb-3">
                        <div class="col-12">
                            <input type="email" name="email" placeholder="Email" class="form-control">
                        </div>
                    </div>
                    {{-- Assunto --}}
                    <div class="row mb-3">
                        <div class="col-12">
                            <input type="text" name="assunto" placeholder="Assunto" class="form-control">
                        </div>
                    </div>

                    {{-- Mensagem --}}
                    <div class="row mb-3">
                        <div class="col-12">
                            <textarea name="mensagem" placeholder="Mensagem" class="form-control"></textarea>
                        </div>
                    </div>

                    <button type="submit" class="form-control btn" title="Enviar mensagem">Enviar</button>
                </form>

            </div>    
        </div>

        <div class="footer-stats text-center">
            <p>
                Feito com 
                <i class="fas fa-heart text-danger"></i>
                &
                <i class="fas fa-coffee text-white"></i>
                por

                <span class="text-danger"><</span>
                <span class="text-white">Adriana de Jesus, Larice Mateus, Loyde da Silva e Stélvio Dias</span>
                <span class="text-danger">/></span>
            </p>
            <p>
                Copyright &copy;2022 Todos direitos reservados
            </p>
        </div>
    </div>

</footer>

{{-- Javascript --}}
<script src="{{ url("assets/lib/jquery/jquery-3.5.1.min.js") }}"></script>
<script src="{{ url("assets/lib/bootstrap/js/bootstrap.min.js") }}"></script>
<script src="{{ url("assets/lib/fontawesome/js/all.min.js") }}"></script>
<script src="{{ url("assets/lib/owlcarousel/js/owl.carousel.min.js") }}"></script>
<script src="{{ url("assets/js/main.js") }}"></script>
</body>
</html>
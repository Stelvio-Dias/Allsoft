<!DOCTYPE html>
<html lang="pt-pt">
<head>
    <meta charset="UTF-8">

    <meta name="author" content="Adriana de Jesus Dembele">
    <meta name="author" content="Larice Patricia Sebastião Mateus">
    <meta name="author" content="Loyde Astride da Silva">
    <meta name="author" content="Stélvio Dias">

    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <title>{{ env('APP_NAME') }} - @yield('titulo')</title>

    {{-- Css --}}
    <link rel="stylesheet" href="{{ url("assets/lib/bootstrap/css/bootstrap.min.css") }}">
    <link rel="stylesheet" href="{{ url("assets/lib/fontawesome/css/all.min.css") }}">
    <link rel="stylesheet" href="{{ url("assets/css/auth.css") }}">
</head>
<body> 

<div class="erros">

</div> 

<main>
    @yield('body')
</main>

{{-- Javascript --}}
<script src="{{ url("assets/lib/bootstrap/js/bootstrap.min.js") }}"></script>
<script src="{{ url("assets/lib/fontawesome/js/all.min.js") }}"></script>
</body>
</html>
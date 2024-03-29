@extends('layout.auth')

{{-- titulo --}}
@section('titulo', 'Logar')

{{-- Body --}}
@section('body')

<form action="" method="POST">
    <div class="">
        <h2>Entrar</h2>
    </div>


    {{-- Email --}}
    <div class="row">
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-envelope icon"></i>
                </span>
                <input type="email" name="email" value="" class="form-control" placeholder="E-Mail">
            </div>
        </div>
    </div>


    {{-- Password --}}
    <div class="row">
        <div class="input-group">
            <span class="input-group-text">
                <i class="fas fa-lock icon"></i>
            </span>
            <input type="password" name="password" class="form-control" placeholder="Password">
        </div>
    </div>


    {{-- Btn Enviar --}}
    <div class="row">
        <div class="col-12">
            <button type="submit" class="form-control btn">
                Logar
                <i class="fas fa-user-plus"></i>
            </button>
        </div>
    </div>

    {{-- Links --}}
    <div class="links">
        <p>
            <a href="">
                Ainda não sou um membro
            </a>
        </p>
    </div>

</form>

@endsection
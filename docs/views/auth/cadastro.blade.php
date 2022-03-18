@extends('layout.auth')

{{-- titulo --}}
@section('titulo', 'Cadastrar')

{{-- Body --}}
@section('body')

<form action="" method="POST">
    <div class="">
        <h2>REGISTRAR UM NOVO MEMBRO</h2>
    </div>

    {{-- Nome --}}
    <div class="row">
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-user icon"></i>
                </span>
                <input type="text" name="nome" value="" class="form-control" placeholder="Nome">
            </div>
        </div>
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

    {{-- Telemovel --}}
    <div class="row">
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-phone icon"></i>
                </span>
                <input type="number" name="telemovel" value="" class="form-control" placeholder="Telemovel">
            </div>
        </div>
    </div>

    {{-- Data de Nascimento --}}
    <div class="row">
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-calendar-alt icon"></i>
                </span>
                <input type="date" name="data_nascimento" value="" class="form-control" placeholder="dd/mm/aa">
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

    {{-- Confirmar Password --}}
    <div class="row">
        <div class="col-12">
            <div class="input-group">
                <div class="input-group-text">
                    <i class="fas fa-lock icon"></i>
                </div>
                <input type="password" name="password_confirmation" class="form-control" placeholder="Confirmar Password">
            </div>
        </div>
    </div>

    {{-- Btn Enviar --}}
    <div class="row">
        <div class="col-12">
            <button type="submit" class="form-control btn">
                Cadastrar
                <i class="fas fa-user-plus"></i>
            </button>
        </div>
    </div>

    {{-- Links --}}
    <div class="links">
        <p>
            <a href="">
                Já sou um membro
            </a>
        </p>
    </div>

</form>

@endsection
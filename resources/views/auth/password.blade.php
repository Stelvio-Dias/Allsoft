@extends('layout.auth')

{{-- titulo --}}
@section('titulo', 'Esqueci a senha')

{{-- Body --}}
@section('body')

<form action="{{ route('password-action') }}" method="POST" autocomplete="off">
    @csrf
    
    <div class="">
        <h2>Esqueci a senha</h2>
    </div>


    {{-- Email --}}
    <div class="row">
        <div class="col-12">
            <p>
                Digite o seu email e nós vamos um link para alterar a senha.
            </p>
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-envelope icon"></i>
                </span>
                <input type="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="E-Mail">
            </div>
        </div>
    </div>

    {{-- Btn Enviar --}}
    <div class="row">
        <div class="col-12">
            <button type="submit" class="form-control btn">
                Enviar
            </button>
        </div>
    </div>

    {{-- Links --}}
    <div class="links">
        <p class="mb-0">
            <a href="{{route('login')}}">
                Lembrou a sua senha?
            </a>
        </p>
    </div>

</form>

@endsection
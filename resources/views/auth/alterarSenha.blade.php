@extends('layout.auth')

{{-- titulo --}}
@section('titulo', 'Alterar senha')

{{-- Body --}}
@section('body')

<form action="{{ route('password.update') }}" method="POST" autocomplete="off">
    @csrf
    <input type="hidden" name="token" value="{{$token}}">
    
    <div class="">
        <h2>Alterar senha</h2>
    </div>


    {{-- Email --}}
    <div class="row">
        <div class="col-12">
            <p>
                Confirme o email e a nova password
            </p>
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-envelope icon"></i>
                </span>
                <input type="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="E-Mail">
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
                Enviar
            </button>
        </div>
    </div>

</form>

@endsection
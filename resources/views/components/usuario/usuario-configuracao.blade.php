<div class="modal fade" id="usuario-configuracao">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">

            {{-- Modal Header --}}
            <div class="modal-header">
                <h5 class="modal-title">Configurações</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">
                <form action="{{route('dashboard.user.configuracao')}}" method="POST" id="usuario-configuracao-form">
                    @csrf
                    <input type="hidden" name="id" value="{{Auth::user()->id}}">
 
                    {{-- Nome \ Data de Nascimento --}}
                    <div class="row">
                        {{-- Nome --}}
                        <div class="col-md-6 col-12 mb-3">
                            <p class="mb-1">Nome</p>
                            <label class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-user icon"></i>
                                </span>
                                <input type="text" name="nome" value="{{ Auth::user()->nome }}" placeholder="Nome" class="form-control">
                            </label>
                        </div>

                        {{-- Data de nascimento --}}
                        <div class="col-md-6 col-12 mb-3">
                            <p class="mb-1">Data de Nascimento</p>
                            <label class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-calendar-alt icon"></i>
                                </span>
                                <input type="date" name="data_nascimento" value="{{ Auth::user()->data_nascimento }}" placeholder="Data de Nascimento" class="form-control">
                            </label>
                        </div>
                    </div>

                    {{-- Email \ Telemovel --}}
                    <div class="row">
                        {{-- Email --}}
                        <div class="col-md-6 col-12 col-12 mb-3">
                            <p class="mb-1">Email</p>
                            <label class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope icon"></i>
                                </span>
                                <input type="email" name="email" value="{{ Auth::user()->email }}" placeholder="Emal" class="form-control">
                            </label>
                        </div>

                        {{-- telemovel --}}
                        <div class="col-md-6 col-12 col-12 mb-3">
                            <p class="mb-1">Telemovel</p>
                            <label class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope icon"></i>
                                </span>
                                <input type="number" name="telemovel" value="{{ Auth::user()->telemovel }}" placeholder="Telemovel" class="form-control">
                            </label>
                        </div>
                    </div>

                    {{-- Old password \ password --}}
                    <div class="row">
                        <p class="mb-1">(Para alterar a palavra passe preencha ambos os campos)</p>

                        {{-- Old password --}}
                        <div class="col-md-6 col-12 col-12 mb-3">
                            <p class="mb-1">Password Atual</p>
                            <label class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-lock icon"></i>
                                </span>
                                <input type="password" name="old_password" placeholder="Password Atual" class="form-control">
                            </label>
                        </div>

                        {{-- Password --}}
                        <div class="col-md-6 col-12 col-12 mb-3">
                            <p class="mb-1">Password Nova</p>
                            <label class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-lock icon"></i>
                                </span>
                                <input type="password" name="password" placeholder="Password Nova" class="form-control">
                            </label>
                        </div>
                    </div>

                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-danger" id="usuario-deletar-conta" data-bs-toggle="modal" data-bs-target="#deletar-conta">Deletar conta</button>
                <button type="submit" class="btn btn-success" id="usuario-configuracao-form-btn">Salvar</button>
            </div>

        </div>
    </div>
</div>

<script>

    let formulario_configuracao = document.querySelector("#usuario-configuracao-form")
    let formulario_configuracao_btn = document.querySelector("#usuario-configuracao-form-btn")

    formulario_configuracao_btn.addEventListener('click', () => {
        formulario_configuracao.submit()
    })

</script>
<div class="modal fade" id="cadastrar-desaparecido">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
        <div class="modal-content">
            {{-- Modal HEader --}}
            <div class="modal-header">
                <h5 class="modal-title">Cadastrar Desaparecido</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">

                <form action="{{route('dashboard.desaparecido.cadastrar')}}" id="cadastrar-desaparecido-form" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="user_id" value="{{ Auth::user()->id }}">
                    <input type="hidden" name="aprovado" value="{{ Auth::user()->admin }}">

                    {{-- Nome \ Data De nascimento \ Imagem --}}
                    <div class="row">

                        {{-- Nome --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Nome Completo</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-user-edit icon"></i>
                                </span>
                                <input type="text" name="nome" placeholder="Nome" class="form-control">
                            </div>
                        </label>

                        {{-- Data de Nascimento --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Data de Nascimento</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-calendar-alt icon"></i>
                                </span>
                                <input type="date" name="data_nascimento" placeholder="dd/mm/aa" class="form-control">
                            </div>
                        </label>

                        {{-- Imagem --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Imagem</p>
                            <input type="file" name="imagem" class="form-control">
                        </label>
                    </div>

                    {{-- Email \ Telemovel1 \ Telemovel2 --}}
                    <div class="row mt-4">

                        {{-- Email --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Email</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope icon"></i>
                                </span>
                                <input type="email" name="email" placeholder="Email" class="form-control">
                            </div>
                        </label>

                        {{-- Telemovel 1 --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Telemovel 1</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-phone icon"></i>
                                </span>
                                <input type="number" name="telemovel1" placeholder="Telemovel 1" class="form-control">
                            </div>
                        </label>

                        {{-- Telemovel 2 --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Telemovel 2</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-phone icon"></i>
                                </span>
                                <input type="number" name="telemovel2" placeholder="Telemovel 2" class="form-control">
                            </div>
                        </label>
                    </div>

                    {{-- Comuna \ Altura \ Peso --}}
                    <div class="row mt-4">
                        
                        {{-- Comuna --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Local de Desaparecimento</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-map-marked-alt icon"></i>
                                </span>
                                <select name="comuna_id" class="form-select">
                                    @foreach($comunas as $item)
                                    <option value="{{$item->id}}">{{ $item->comuna }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </label>

                        {{-- Altura --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Altura(CM)</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-ruler-vertical icon"></i>
                                </span>
                                <input type="number" name="altura" placeholder="Altura" class="form-control">
                            </div>
                        </label>

                        {{-- Peso --}}
                        <label class="col-12 col-md-6 col-lg-4 mt-3 mt-lg-0">
                            <p>Peso (KG)</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-balance-scale icon"></i>
                                </span>
                                <input type="number" name="peso" placeholder="Peso" class="form-control">
                            </div>
                        </label>
                    </div>

                    {{-- Descrição --}}
                    <div class="row mt-4">
                        <label class="col-12">
                            <p>Descrição</p>
                            <textarea name="descricao" class="form-control" placeholder="Descrição"></textarea>
                        </label>
                    </div>

                </form> 

            </div>

            {{-- Modal footer --}}
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Fechar</button>
                <button type="submit" class="btn btn-success" id="cadastrar-desaparecido-form-btn">Cadastrar</button>
            </div>
        </div>
    </div>
</div>

<script>
    let formulario_cadastrar_desaparecido = document.querySelector("#cadastrar-desaparecido-form")
    let formulario_btn_cadastrar_desaparecido = document.querySelector("#cadastrar-desaparecido-form-btn")

    formulario_btn_cadastrar_desaparecido.addEventListener('click', () => {
        formulario_cadastrar_desaparecido.submit()
    })
</script>
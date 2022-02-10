<div class="modal fade" id="editar-desaparecido-{{$item->id}}">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">ID: {{$item->id}}</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <form action="{{route('dashboard.desaparecido.editar')}}" id="editar-desaparecido-form-{{$item->id}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id" value="{{ $item->id }}">

                    {{-- Nome \ Data De nascimento \ Imagem --}}
                    <div class="row">

                        {{-- Nome --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Nome Completo</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-user-edit icon"></i>
                                </span>
                                <input type="text" name="nome" value="{{ $item->nome }}" placeholder="Nome" class="form-control">
                            </div>
                        </label>

                        {{-- Data de Nascimento --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Data de Nascimento</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-calendar-alt icon"></i>
                                </span>
                                <input type="date" name="data_nascimento" value="{{ $item->data_nascimento }}" placeholder="dd/mm/aa" class="form-control">
                            </div>
                        </label>

                        {{-- Imagem --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Imagem</p>
                            <input type="file" name="imagem" class="form-control">
                        </label>
                    </div>


                    {{-- Email \ Telemovel1 \ Telemovel2 --}}
                    <div class="row mt-4">

                        {{-- Email --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Email</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope icon"></i>
                                </span>
                                <input type="email" name="email" value="{{ $item->email ?? '' }}" placeholder="Email" class="form-control">
                            </div>
                        </label>

                        {{-- Telemovel 1 --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Telemovel 1</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-phone icon"></i>
                                </span>
                                <input type="number" name="telemovel1" value="{{ $item->responsavelTelemovel1->telemovel ?? '' }}" placeholder="Telemovel 1" class="form-control">
                            </div>
                        </label>

                        {{-- Telemovel 2 --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Telemovel 2</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-phone icon"></i>
                                </span>
                                <input type="number" name="telemovel2" value="{{ $item->responsavelTelemovel2->telemovel ?? '' }}" placeholder="Telemovel 2" class="form-control">
                            </div>
                        </label>
                    </div>


                    {{-- Comuna \ Altura \ Peso --}}
                    <div class="row mt-4">
                        
                        {{-- Comuna --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Local de Desaparecimento</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-map-marked-alt icon"></i>
                                </span>
                                <select name="comuna_id" class="form-select">
                                    @foreach($comunas as $comuna)
                                    <option value="{{ $comuna->id }}"
                                    @if($comuna->id == $item->comuna_id)
                                        selected
                                    @endif>
                                        {{ $comuna->comuna }}
                                    </option>
                                    @endforeach
                                </select>
                            </div>
                        </label>

                        {{-- Altura --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Altura(CM)</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-ruler-vertical icon"></i>
                                </span>
                                <input type="number" name="altura" value="{{ $item->altura ?? '' }}" placeholder="Altura" class="form-control">
                            </div>
                        </label>

                        {{-- Peso --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Peso (KG)</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-balance-scale icon"></i>
                                </span>
                                <input type="number" name="peso" value="{{ $item->peso ?? '' }}" placeholder="Peso" class="form-control">
                            </div>
                        </label>
                    </div>

                    {{-- Status \ Aprovado --}}
                    <div class="row mt-4">

                        {{-- Status --}}
                        <div class="col-12 col-md-6 col-lg-4">
                            <p class="mb-0">Status</p>
                            
                            <select name="status" class="form-select">
                                <option value="0" 
                                @if($item->status == false) 
                                    selected
                                @endif>
                                    Desaparecido
                                </option>
                                <option value="1"
                                @if($item->status == true)
                                    selected
                                @endif>
                                    Aparecido
                                </option>
                            </select>

                        </div>

                        @if(Auth::user()->admin == true)
                        {{-- Aprovado --}}
                        <label class="col-12 col-md-6 col-lg-4">
                            <p>Aprovado</p>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-user-check icon"></i>
                                </span>
                                
                                <select name="aprovado" class="form-select">
                                    <option value="0" 
                                    @if($item->aprovado == false) 
                                        selected
                                    @endif>
                                        Não
                                    </option>
                                    <option value="1"
                                    @if($item->aprovado == true)
                                        selected
                                    @endif>
                                        Sim
                                    </option>
                                </select>    
                            </div>
                        </label>
                        @endif

                    </div>


                    {{-- Descrição --}}
                    <div class="row mt-4">
                        <label class="col-12">
                            <p>Descrição</p>
                            <textarea name="descricao" class="form-control" placeholder="Descrição">{{ $item->descricao->descricao ?? '' }}</textarea>
                        </label>
                    </div>
                    
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Fechar</button>
                <button class="btn btn-success" id="editar-desaparecido-form-btn-{{$item->id}}">Editar</button>
            </div>
        </div>
    </div>
</div>

<script>
    let formulario_editar_desaparecido_{{$item->id}} = document.querySelector("#editar-desaparecido-form-{{$item->id}}")
    let formulario_btn_editar_desaparecido_{{$item->id}} = document.querySelector("#editar-desaparecido-form-btn-{{$item->id}}")

    formulario_btn_editar_desaparecido_{{$item->id}}.addEventListener('click', () => {
        formulario_editar_desaparecido_{{$item->id}}.submit()
    })
</script>
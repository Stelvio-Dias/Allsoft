<div class="modal fade" id="comunas">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            {{-- Modal HEader --}}
            <div class="modal-header">
                <h5 class="modal-title">Comunas</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">
                
                {{-- Adicionar Comuna --}}
                <form action="" method="">
                    <h2 class="title">Adicionar comuna</h2>
                    
                    <div class="row">
                        {{-- Nome Comuna --}}
                        <div class="col-9 pe-0">
                            <div class="input-group">
                                <span class="input-group-text rounded-0">
                                    <i class="fas fa-map-marked-alt"></i>
                                </span>
                                <input type="text" name="comuna" class="form-control rounded-0" placeholder="Comuna">
                            </div>
                        </div>
        
                        {{-- Botao Submit --}}
                        <div class="col-3 ps-0">
                            <button type="submit" class="form-control rounded-0 btn btn-dark">Adicionar</button>
                        </div>
                    </div>
                </form>

                {{-- ver comunas --}}
                <section id="ver-comunas" class="mt-3">
                    <table class="table table-hover table-light table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>COMUNA</th>
                                <th>AÇÃO</th>
                                <th>AÇÃO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Benfica</td>
                                {{-- Editar --}}
                                <td>
                                    <a href=""
                                    data-bs-toggle="modal"
                                    data-bs-target="#editar-comuna">
                                        <i class="fas fa-redo-alt"></i>
                                    </a>
                                </td>

                                {{-- Deletar --}}
                                <td>
                                    <a href=""
                                    data-bs-toggle="modal"
                                    data-bs-target="#deletar-comuna">
                                        <i class="fas fa-times"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>

            </div>

            {{-- Modal footer --}}
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>

{{-- Editar comuna --}}
@component('components.comuna.editar-comuna')
    
@endcomponent


{{-- Deletar Comuna --}}
@component('components.comuna.deletar-comuna')
    
@endcomponent
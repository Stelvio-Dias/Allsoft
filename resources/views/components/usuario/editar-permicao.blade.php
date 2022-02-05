<div class="modal fade" id="editar-permicao">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            {{-- Modal HEader --}}
            <div class="modal-header">
                <h5 class="modal-title">Editar Permissão</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">
                <table class="table table-hover table-light table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Nivel</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>PAUL ROVIA</td>
                            <td>teste@gmail.com</td>
                            {{-- Formulario Editar Nivel do Usuario --}}
                            <form action="" method="">
                                <td>
                                    <select name="admin" class="form-select">
                                        <option value="0">Usuario</option>    
                                        <option value="1">Admnistrador</option>    
                                    </select>    
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-success">Editar</button>
                                </td>
                            </form>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
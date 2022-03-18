<div class="modal fade" id="pedidos">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            {{-- Modal HEader --}}
            <div class="modal-header">
                <h5 class="modal-title">Pedidos</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>IMAGEM</th>
                                <th>NOME</th>
                                <th>DATA DE NASC.</th>
                                <th>COMUNA</th>
                                <th>Rejeitar</th>
                                <th>Aceitar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{$item->id}}</td>
                                <td data-bs-toggle="modal" data-bs-target="#imagem">
                                    <img 
                                    src=""
                                    class="view-img">
                                </td>
                                <td>Nome</td>
                                <td>01/01/2021</td>
                                <td>Benfica</td>
                                <td>
                                    <form action="" method="POST">
                                        <button type="submit" class="btn btn-danger">Rejeitar</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="" method="POST">
                                        <button type="submit" class="btn btn-success">Aceitar</button>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
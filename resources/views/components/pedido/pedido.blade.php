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
                            <td>1</td>
                            <td data-bs-toggle="modal" data-bs-target="#imagem-1">
                                <img 
                                src="{{ url("assets/images/Blog-post/blg10.png") }}"
                                class="view-img">
                            </td>
                            <td>Paul Rovia</td>
                            <td>2022/01/01</td>
                            <td>Benfica</td>
                            <td>
                                <form method="" action="">
                                    <button type="button" class="btn btn-danger">Rejeitar</button>
                                </form>
                            </td>
                            <td>
                                <form action="" method="">
                                    <button type="button" class="btn btn-success">Aceitar</button>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
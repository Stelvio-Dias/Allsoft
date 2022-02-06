<div class="modal fade" id="terminar-sessao">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ env('APP_NAME') }}</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <p>Deseja terminar sessão</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Não</button>
                <a href="{{route('logout')}}" class="btn btn-success">Sim</a>
            </div>
        </div>
    </div>
</div>
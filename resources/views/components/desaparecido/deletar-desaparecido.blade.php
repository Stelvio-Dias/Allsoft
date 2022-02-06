<div class="modal fade" id="deletar-desaparecido-{{$item->id}}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">ID: {{ $item->id }}</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <form action="{{ route('dashboard.desaparecido.deletar') }}" method="POST" id="deletar-desaparecido-{{$item->id}}-form">
                    @csrf
                    <input type="hidden" name="id" value="{{$item->id}}">
                </form>

                <p>Deseja deletar este desaparecido? ({{ $item->nome }})</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Não</button>
                <button class="btn btn-success" id="deletar-desaparecido-{{$item->id}}-form-btn">Sim</button>
            </div>
        </div>
    </div>
</div>

<script>
    let formulario_deletar_desaparecido_{{$item->id}} = document.querySelector("#deletar-desaparecido-{{$item->id}}-form")
    let formulario_btn_deletar_desaparecido_{{$item->id}} = document.querySelector("#deletar-desaparecido-{{$item->id}}-form-btn")

    formulario_btn_deletar_desaparecido_{{$item->id}}.addEventListener('click', () => {
        formulario_deletar_desaparecido_{{$item->id}}.submit()
    })
</script>
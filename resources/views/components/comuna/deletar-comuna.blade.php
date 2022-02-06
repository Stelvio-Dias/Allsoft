<div class="modal fade" id="deletar-comuna-{{$item->id}}">
    <div class="modal-dialog">
        <div class="modal-content">
            {{-- Modal Header --}}
            <div class="modal-header">
                <h5 class="modal-title">ID: {{$item->id}}</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">
                <p>Deseja deletar esta comuna? ({{$item->comuna}})</p>

                <form action="{{route('dashboard.comuna.deletar')}}" id="deletar-comuna-{{$item->id}}-form" method="POST">
                    @csrf
                    <input type="hidden" name="id" value="{{$item->id}}">
                </form>
            </div>

            {{-- Modal Footer --}}
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Não</button>
                <button type="button" class="btn btn-success" id="deletar-comuna-{{$item->id}}-form-btn">Sim</button>
            </div>
        </div>
    </div>
</div>

<script>
    let formulario_{{$item->id}}_deletar_comuna = document.querySelector("#deletar-comuna-{{$item->id}}-form")
    let formulario_btn_{{$item->id}}_deletar_comuna = document.querySelector("#deletar-comuna-{{$item->id}}-form-btn")

    formulario_btn_{{$item->id}}_deletar_comuna.addEventListener('click', () => {
        formulario_{{$item->id}}_deletar_comuna.submit()
    })
</script>
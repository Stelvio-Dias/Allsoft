<div class="modal fade" id="editar-comuna-{{$item->id}}">
    <div class="modal-dialog">
        <div class="modal-content">
            {{-- Modal Header --}}
            <div class="modal-header">
                <h5 class="modal-title">ID: {{$item->id}}</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">
                <form action="{{route('dashboard.comuna.editar')}}" method="POST" id="editar-comuna-{{$item->id}}-form">
                    @csrf
                    <input type="hidden" name="id" value="{{$item->id}}">
                    <input type="text" name="comuna" class="form-control" value="{{$item->comuna}}">
                </form>
            </div>

            {{-- Modal Footer --}}
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Não</button>
                <button type="button" class="btn btn-success" id="editar-comuna-{{$item->id}}-form-btn">Editar</button>
            </div>
        </div>
    </div>
</div>

<script>
    let formulario_{{$item->id}}_editar_comuna = document.querySelector("#editar-comuna-{{$item->id}}-form")
    let formulario_btn_{{$item->id}}_editar_comuna = document.querySelector("#editar-comuna-{{$item->id}}-form-btn")

    formulario_btn_{{$item->id}}_editar_comuna.addEventListener('click', () => {
        formulario_{{$item->id}}_editar_comuna.submit()
    })
</script>
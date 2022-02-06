<div class="modal fade" id="imagem-{{$item->id}}">
    <div class="modal-dialog">
        <div class="modal-content">

            {{-- Modal Header --}}
            <div class="modal-header">
                <h5 class="title">Imagem de {{$item->nome}}</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal">
            </div>

            {{-- Modal Body --}}
            <div class="modal-body">
                <img 
                src="{{ url("desaparecidos/{$item->imagem}") }}"
                class="img-fluid">
            </div>

        </div>
    </div>
</div>
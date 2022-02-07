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
                        @foreach($pedidos as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td data-bs-toggle="modal" data-bs-target="#imagem-{{$item->id}}">
                                <img 
                                src="{{ url("desaparecidos/{$item->imagem}") }}"
                                class="view-img">
                            </td>
                            <td>{{ $item->nome }}</td>
                            <td>{{ str_replace('-', '/', $item->data_nascimento) }}</td>
                            <td>{{ $item->comuna->comuna }}</td>
                            <td>
                                <form action="{{route('dashboard.desaparecido.deletar')}}" method="POST">
                                    @csrf
                                    <input type="hidden" name="id" value="{{$item->id}}">
                                    <button type="submit" class="btn btn-danger">Rejeitar</button>
                                </form>
                            </td>
                            <td>
                                <form action="{{ route('dashboard.desaparecido.aceitar-pedido') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="id" value="{{$item->id}}">
                                    <button type="submit" class="btn btn-success">Aceitar</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
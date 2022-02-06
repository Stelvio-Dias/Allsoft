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
                        @foreach($users as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->nome}}</td>
                            <td>{{$item->email}}</td>
                            {{-- Formulario Editar Nivel do Usuario --}}
                            <form action="{{ route('dashboard.user.editar-permissao') }}" method="POST">
                                @csrf
                                <td>

                                    <input type="hidden" name="id" value="{{$item->id}}">
                                    
                                    <select name="admin" 
                                    @if(Auth::user()->id == $item->id)
                                        disabled
                                    @endif
                                    class="form-select">
                                        <option value="0"
                                        @if($item->admin == false)
                                            selected
                                        @endif>
                                            Usuario
                                        </option>    
                                        <option value="1"
                                        @if($item->admin == true)
                                            selected
                                        @endif>
                                            Admnistrador
                                        </option>    
                                    </select>    
                                </td>
                                <td>
                                    <button type="submit" 
                                    @if(Auth::user()->id == $item->id)
                                        disabled
                                    @endif
                                    class="btn btn-success">Editar</button>
                                </td>
                            </form>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
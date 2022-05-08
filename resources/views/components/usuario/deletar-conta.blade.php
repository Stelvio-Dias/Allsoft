<div class="modal fade" id="deletar-conta">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ env('APP_NAME') }}</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <p>Deseja deletar está conta</p>
                <form action="{{route('dashboard.user.deletar-conta')}}" id="form-deletar-conta" method="POST">
                    @csrf    
                    <input type="hidden" name="id" value="{{ Auth::user()->id }}">
                </form> 
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Não</button>
                <button type="submit" class="btn btn-success" id="btn-form-deletar-conta">Sim</button>
            </div>
        </div>
    </div>
</div>

<script>
    let form_deletar_conta = document.querySelector("#form-deletar-conta")
    let btn_form_deletar_conta = document.querySelector("#btn-form-deletar-conta")

    btn_form_deletar_conta.addEventListener('click', ()=> {
        form_deletar_conta.submit()
    })
</script>
@extends('layout.modelo')

{{-- Titulo da pagina --}}
@section('titulo', 'FAQ')

{{-- Corpo --}}
@section('body')

<section id="faq" class="mt-4">
    <div class="container">
        <h2 class="title">FAQ</h2>

        <div class="accordion" id="accordionExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Quem somos nós?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Somos estudantes da 13ª classe do curso de Tecnico medio de informática, o nosso grupo está composto por:
                        <br><code>#AdrianaDembele</code><br>
                        <code>#Larice Mateus</code><br>
                        <code>#Loyde da Silva</code><br>
                        <code>#Stélvio Dias</code><br>
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        O que é o allsoft?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Allsoft é um sistema web de pesquisa e cadastro de pessoas desaparecidas no municipio de Talatona.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTree">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTree" aria-expanded="false" aria-controls="collapseTree">
                        Como pesquisar um desaparecido?
                    </button>
                </h2>
                <div id="collapseTree" class="accordion-collapse collapse" aria-labelledby="headingTree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Para pesquisar por um desaparecido clique na barra de pesquisa posicionada no canto superior direito da tela.
                        Em seguida coloque o nome do desaparecido e será direcionado para a página de busca.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        Como cadastrar um desaparecido?
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Para cadastrar um desaparecido você precisa fazer o login, após fazer o login será direcionado para o painel admnistrativo.
                        Depois clique no icone do menu direcionado no canto superior esquerdo e será aberto um menu suspenso, clique em "+ desaparecido"
                        e insira as credenciais do desaparecido. Depois clique em cadastrar e o pedido de cadastro será inspecionado por um admnistrador.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        Como recuperar a senha?
                    </button>
                </h2>
                <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Na tela de login entre no link "Esqueci a minha senha", após isso será direcionado para uma tela e insira o seu email.
                        Será enviado um link para a recuperação da senha no email inserido. Clique no link e coloque as credenciais.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSix">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                        Como deletar uma conta?
                    </button>
                </h2>
                <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Entre no painel admnistrativo e vai em configurações. Terá um botão deletar conta.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSeven">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                        Como enviar uma mensagem?
                    </button>
                </h2>
                <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Dirija-se até o rodapé do site e terá um formulário para enviar uma mensagem.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingNine">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
                        Como comentar no perfil de um desaparecido?
                    </button>
                </h2>
                <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Esteja logado e entre no perfil de um desaparecido. Abaixo terá um formulario para comentar.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTen">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                        Como visualizar o perfil de um desaparecido?
                    </button>
                </h2>
                <div id="collapseTen" class="accordion-collapse collapse" aria-labelledby="headingTen" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Esteja logado e entre no perfil de um desaparecido. Abaixo da imagem do desaparecido está um botão visualizar.
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingEleven">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
                        Como ligar para um desaparecido?
                    </button>
                </h2>
                <div id="collapseEleven" class="accordion-collapse collapse" aria-labelledby="headingEleven" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Esteja logado e entre no perfil de um desaparecido. Abaixo da imagem do desaparecido está botões para ligar.
                    </div>
                </div>
            </div>

        </div>

    </div>
</section>   

@endsection
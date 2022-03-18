@extends('layout.modelo')

{{-- Titulo da pagina --}}
@section('titulo', 'FAQ')

{{-- Corpo --}}
@section('body')

<section id="faq" class="mt-4">
    <div class="container">
        <h2 class="title">FAQ</h2>

        <div class="accordion" id="faq-1">
            <div class="accordion-item">
                <h2 class="accordion-header" id="faq-header-1">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq-action-1" aria-expanded="true" aria-controls="collapseOne">
                    Quem Somos Nós?
                </button>
                </h2>
                <div id="faq-action-1" class="accordion-collapse collapse show" aria-labelledby="faq-header-1" data-bs-parent="#faq-1">
                <div class="accordion-body">
                    <strong>Quem somos nós.</strong> 
                    <p>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Fugit maiores necessitatibus aliquid repudiandae quas praesentium quia eum possimus at nostrum, inventore, amet cum ex odio hic! Saepe repudiandae dolor laborum.
                    </p>
                </div>
                </div>
            </div>
        </div>

        <div class="accordion" id="faq-2">
            <div class="accordion-item">
                <h2 class="accordion-header" id="faq-header-2">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq-action-2" aria-expanded="true" aria-controls="collapseTwo">
                    Como fazer para cadastrar?
                </button>
                </h2>
                <div id="faq-action-2" class="accordion-collapse collapse" aria-labelledby="faq-header-2" data-bs-parent="#faq-2">
                <div class="accordion-body">
                    <strong> Como fazer para cadastrar.</strong> 
                    <p>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Fugit maiores necessitatibus aliquid repudiandae quas praesentium quia eum possimus at nostrum, inventore, amet cum ex odio hic! Saepe repudiandae dolor laborum.
                    </p>
                </div>
                </div>
            </div>
        </div>

    </div>
</section>

@endsection
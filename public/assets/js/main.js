$(document).ready(function() {
    // Imagem carousel
    $("#mais-antigos .owl-carousel").owlCarousel({
        loop: true,
        margin: 10,
        responsive: {
            0: {
                items: 1
            }, 
            560: {
                items: 2
            }, 
            960: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    })

    // Copiar URL
    let btn_copiar = document.querySelector("#copiar-url")

    if(btn_copiar != null) {
        btn_copiar.addEventListener('click', ()=> {
            let url = window.location.href
            navigator.clipboard.writeText(url).then(()=> {
                let alert = document.createElement('div')
                // Criar o alert
                alert.classList.add('alert')
                alert.classList.add('alert-success')
                alert.classList.add('alert-dismissible')
                alert.innerHTML = "<strong>Parabens!</strong> URL copiada com sucesso!"

                let button = document.createElement('button')
                button.classList.add('btn')
                button.classList.add('btn-close')
                button.setAttribute('data-bs-dismiss', 'alert')

                document.querySelector('.erros').appendChild(alert)
                alert.appendChild(button)
            })
        })
    }
})
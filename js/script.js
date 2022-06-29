// Criar uma função em JS
// Formato ES6 baseado em Arrow Function

// Função que realiza o cadastro de livros
const cadastrar = () => {
    // Capitura o valor digitado no campo titulo

    // Declara as variáveis e captura o valor preenchido
    let titulo = document.getElementById('titulo').value
    let autor = document.getElementById('autor').value
    let categoria = document.getElementById('categoria').value
    let valor = document.getElementById('valor').value

    // Verifica se a variável está vazia, se for true, irá exibir um alerta
    if (titulo == '') {
        alert('Digite o título do livro!')
        return
    }

    if (autor == '') {
        alert('Digite o autor do livro!')
        return
    }

    if (categoria == '') {
        alert('Escolha a categoria do livro!')
        return
    }
    
    if (valor == '') {
        alert('Escolha o valor do livro!')
    }

    //Envio dos dados usando fetch ao backend

    fetch('backend/cadastro_livro.php', {
        method: 'POST',
        body: `titulo= ${titulo} & autor= ${autor} & categoria= ${categoria} & valor= ${valor}`,
        headers: {
            'Content-type': 'application/x-www-form-urlencoded'
        }
    })

    .then(function(response) {
        response.json().then(dados=>{
            //Aqui é onde iremos receber e tratar a resposta do PHP
            Swal.fire(
                'Atenção',
                dados.mensagem,
                dados.resposta == "OK" ? 'sucess' : 'error'
              )
            // Resetar o formulário - limpar os campos
            document.getElementById('main-form').reset()
        })
    })
}
// Final da função cadastrar

const listar = () => {
    fetch('backend/listar.php')
}
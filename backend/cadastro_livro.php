<?php

// Exibe todas as variáveis enviadas via POST ao php
//var_dump($_POST);

// Criar uma variável em PHP
$titulo = $_POST['titulo'];
$autor = $_POST['autor'];
$categoria = $_POST['categoria'];
$valor = $_POST['valor'];

// Conexão com o Banco de Dados
$servidor = 'localhost';
$usuario = 'root';
$senha = '';
$bancoDados = 'db_livraria';

try {
    // Definindo as configurações de conexão com o banco de dados
    $conexao = new PDO("mysql:host=$servidor;dbname=$bancoDados; charset=utf8", $usuario, $senha);

    // seta o modo de erro do PDO para exception
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query de inserção de dados no DB MySQL
    $sql = "INSERT INTO tb_livros (titulo, autor, id_categorias, valor) VALUES ('$titulo', '$autor', '$categoria', $valor)";

    // Prepara a execução da query acima
    $comando = $conexao->prepare($sql);

    // Executa a Query preparada acima
    $comando->execute();

    // Criar um array para resposta ao usuário
    $resposta = array("resposta"=>"OK", "mensagem"=>"Cadastro realizado com sucesso!");

  } catch(PDOException $e) {
    // Aqui é tratado o erro e retornado ao usuárion
    $resposta = ['resposta'=>'ERRO!', 'mensagem'=>$e->getMessage()];
  }

$json = json_encode($resposta, JSON_UNESCAPED_UNICODE);
echo $json;

?>

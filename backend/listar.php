<?php

// Conexão com o Banco de Dados
$servidor = 'localhost';
$usuario = 'root';
$senha = '';
$bancoDados = 'db_livraria';

try {
    // Definindo as configurações de conexão com o banco de dados
    $conexao = new PDO("mysql:host=$servidor;dbname=$bancoDados; charset=utf8", $usuario, $senha);

    // seta o modo de erro do PDO para exception, 
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query de listagem de dados no DB MySQL
    $sql = "SELECT * FROM tb_livros WHERE ativo = 1";

    // Prepara a execução da query acima
    $comando = $conexao->prepare($sql);

    // Executa a Query preparada acima
    $comando->execute();

    // Essa linha irá tratar os dados do retorno do select executado no banco de dados,
    // somente é usada nesse caso. Em INSERT, UPDATE e DELETE não tem necessidade.

    $resposta = $comando->fetchAll(PDO::FETCH_ASSOC);

  } catch(PDOException $e) {
    // Aqui é tratado o erro e retornado ao usuárion
    $resposta = ['resposta'=>'ERRO!', 'mensagem'=>$e->getMessage()];
  }

$json = json_encode($resposta, JSON_UNESCAPED_UNICODE);
echo $json;

?>
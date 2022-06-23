<?php

// Exibe todas as variáveis enviadas via POST ao php
//var_dump($_POST);

// Criar uma variável em PHP

$titulo = $_POST['titulo'];
$autor = $_POST['autor'];
$categoria = $_POST['categoria'];
$categoria = $_POST['valor'];

// Conexão com o Banco de Dados

$servidor = 'localhost';
$usuario = 'root';
$senha = '';

try {
    $conexao = new PDO("mysql:host=$servidor;dbname=myDB", $usuario, $senha);
    // set the PDO error mode to exception
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
  } catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
  }
?>
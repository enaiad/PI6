<?php

$host = 'localhost';
$user = 'root';
$pass = '';
$db_name = 'pi6';

$conn = new MySQLi($host, $user, $pass, $db_name);


// isso é só pra testar, pode deletar se quiser ou mudar pro codigo abaixo
if ($conn) {
echo "certo";
}

//esse, que trata erro e pa
if ($conn->connect_error) {
  die('Database cocnnection error: ' . $conn->connect_error);
}
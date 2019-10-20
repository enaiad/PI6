<?php 
require "connect.php";

$criar_tabela_usuarios = '
	create table usuarios(
	id int not null primary key auto_increment,
	nome varchar(50) not null,
	email varchar(100) not null,
	senha varchar(32) not null
	)
';

//pra chamar o banco de datos, tu usa $conn, que é o mesmo que tem os dados lá do outro arquivo connect
$stmt = $conn->prepare($criar_tabela_usuarios);
$stmt->execute();

if ($stmt) {
	echo '<br>tabela criada';
}
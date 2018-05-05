<?php

	function connection(){
		
		$hostname 	=	'localhost';
		$username	=	'root';
		$password	=	'';
		$dbname   	=	'anas';// em caso de Anas seria 'anas' que o nome da base de dados

		$connection = mysqli_connect($hostname,$username,$password,$dbname) or die(mysql_error("erro de conexao"));
	
		return $connection;

	}
	header("Content-Type: application/json");

	
?>